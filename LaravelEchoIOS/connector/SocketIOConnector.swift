//
// Created by valentin vivies on 21/07/2017.
// Copyright (c) 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOConnector: IConnector {

    var socket: SocketIOClient?

    var _defaultOptions: [String: Any] = [ "auth": ["headers": []], "authEndpoint": "/broadcasting/auth", "broadcaster": "socket.io", "host": "", "key": "", "namespace": "App.Events"]

    var options: [String: Any]

    var channels: [String: IChannel]

    init(options: [String: Any]){
        self.socket = nil
        self.options = options
        self.channels = [:]
        //self.setOptions(options: options)
        self.connect()
    }

    func setOptions(options: [String: Any]){
        self.options =  self.mergeOptions(options: options)
    }

    func connect(){
        if let url = self.options["host"] as? String {
            let nurl: URL! = URL(string: url)
            let socketConfig: SocketIOClientConfiguration = [.log(true), .compress]
            self.socket = SocketIOClient(socketURL: nurl, config: socketConfig)
            self.socket?.connect(timeoutAfter: 5, withHandler: {
                print("ERROR")
            })
        }
    }
    
    func on(event: String, callback: @escaping NormalCallback){
        self.socket!.on(event, callback: callback)
    }

    func listen(name : String, event: String, callback: @escaping NormalCallback) -> IChannel{
        return self.channel(name: name).listen(event: event, callback: callback)
    }

    func channel(name: String) -> IChannel{
        if(self.channels[name] == nil){
            let socket: SocketIOClient! = self.socket
            self.channels[name] = SocketIoChannel(
                socket: socket, name: name, options: self.options
            )
        }
        return self.channels[name]!
    }

    func privateChannel(name: String) -> IPrivateChannel{
        if(self.channels["private-" + name] == nil){
            let socket: SocketIOClient! = self.socket
            self.channels["private-" + name] = SocketIOPrivateChannel(
            socket: socket, name: "private-" + name, options: self.options
            )
        }
        return self.channels["private-" + name]! as! IPrivateChannel
    }

    func presenceChannel(name: String) -> IPresenceChannel{
        if(self.channels["presence-" + name] == nil){
            let socket: SocketIOClient! = self.socket
            self.channels["presence-" + name] = SocketIOPresenceChannel(
            socket: socket, name: "presence-" + name, options: self.options
            )
        }
        return self.channels["presence-" + name]! as! IPresenceChannel
    }

    func leave(name : String){
        let channels: [String] = [name, "private-" + name, "presence-" + name];
        for(name) in channels{
            if let c = self.channels[name] {
                c.unsubscribe()
                self.channels[name] = nil
            }
        }
    }

    func socketId() -> String {
        if let socket: SocketIOClient = self.socket{
            return socket.sid!
        }
        return ""
    }

    func disconnect(){
        let socket: SocketIOClient! = self.socket
        socket.disconnect()
    }

    func mergeOptions(options : [String: Any]) -> [String: Any]{
        var def = self._defaultOptions
        for (k, v) in options{
            def[k] = v
        }
        return def
    }

}
