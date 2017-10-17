//
//  SocketIOChannel.swift
//  laravel-echo-ios
//
//  Created by valentin vivies on 21/07/2017.
//  Copyright © 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

class SocketIoChannel: Channel {
    
    var socket: SocketIOClient
    
    var name: String

    var auth: [String: Any]
    
    var eventFormatter: EventFormatter
    
    var events : [String: [NormalCallback]]

    init(socket: SocketIOClient, name: String, options: [String: Any]){
        self.name = name
        self.socket = socket
        self.events = [:]

        var namespace = ""
        if let wrapperNamespace = options["namespace"] as? String{
            namespace = wrapperNamespace
        }

        self.auth = [:]
        if let wrapperAuth = options["auth"] as? [String: Any]{
            self.auth = wrapperAuth
        }

        self.eventFormatter = EventFormatter(namespace: namespace)

        super.init(options: options)

        self.subscribe()
        self.configureReconnector()
    }

    override func subscribe(){
        let data = [["channel": self.name, "auth": self.auth]]
        self.socket.emit("subscribe", with : data)
    }

    override func unsubscribe(){
        self.unbind()
        let data = [["channel": self.name, "auth": self.auth]]
        self.socket.emit("unsubscribe", with: data)
    }

    override func listen(event: String, callback: @escaping NormalCallback) -> IChannel{
        self.on(event: self.eventFormatter.format(event: event), callback: callback)
        return self
    }

    func on(event: String, callback: @escaping NormalCallback){

        func listener(data: [Any], ack: SocketAckEmitter){
            if let channel = data[0] as? String {
                if(self.name == channel){
                    callback(data, ack)
                }
            }
        }

        self.socket.on(event, callback: listener)
        self.bind(event: event, callback: listener)
    }

    func configureReconnector(){

        func listener(event: [Any], _ack: SocketAckEmitter){
            self.subscribe()
        }

        self.socket.on("reconnect", callback: listener)
        self.bind(event: "reconnect", callback: listener)
    }

    func bind(event: String, callback: @escaping NormalCallback){
        if(self.events[event] == nil){
            self.events[event] = []
        }
        self.events[event]!.append(callback)
    }

    func unbind(){
        for (key, _) in self.events {
            self.events[key] = nil
        }
        self.socket.removeAllHandlers()
    }
    
}
