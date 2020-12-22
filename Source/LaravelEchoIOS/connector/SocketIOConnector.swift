//
// Created by valentin vivies on 21/07/2017.
//

import Foundation
import SocketIO


/// This class creates a connnector to a Socket.io server.
class SocketIOConnector: IConnector {

    private var socketManager: SocketManagerSpec?

    
    /// Default connector options.
    var _defaultOptions: [String: Any] = [ "auth": ["headers": []], "authEndpoint": "/broadcasting/auth", "broadcaster": "socket.io", "host": "", "key": "", "namespace": "App.Events"]

    
    /// Connector options.
    var options: [String: Any]

    
    /// All of the subscribed channels.
    var channels: [String: IChannel]

    
    /// Create a new class instance.
    ///
    /// - Parameter options: options
    init(options: [String: Any]){
        self.options = options
        self.channels = [:]
        //self.setOptions(options: options)
        self.connect()
    }

    
    /// Merge the custom options with the defaults.
    ///
    /// - Parameter options: options
    func setOptions(options: [String: Any]){
        self.options =  self.mergeOptions(options: options)
    }

    
    /// Create a fresh Socket.io connection.
    func connect(){
        if let url = URL(string: self.options["host"] as? String ?? "") {
            let socketConfig: SocketIOClientConfiguration = [.log(true), .compress]
            self.socketManager = SocketManager(socketURL: url, config: socketConfig)
            self.socketManager?.defaultSocket.connect(timeoutAfter: 5, withHandler: {
                print("ERROR")
            })
        }
    }
    
    
    /// Add other handler type
    ///
    /// - Parameters:
    ///   - event: event name
    ///   - callback: callback
    func on(event: String, callback: @escaping NormalCallback){
        self.socketManager?.defaultSocket.on(event, callback: callback)
    }

    
    /// Listen for an event on a channel instance.
    ///
    /// - Parameters:
    ///   - name: channel name
    ///   - event: event name
    ///   - callback: callback
    /// - Returns: the channel
    func listen(name : String, event: String, callback: @escaping NormalCallback) -> IChannel{
        return self.channel(name: name).listen(event: event, callback: callback)
    }

    
    /// Get a channel instance by name.
    ///
    /// - Parameter name: channel name
    /// - Returns: the channel
    func channel(name: String) -> IChannel{
        if(self.channels[name] == nil){
            // TODO: Can Crash, needs refactor.
            self.channels[name] = SocketIoChannel(
                socket: self.socketManager!.defaultSocket, name: name, options: self.options
            )
        }
        return self.channels[name]!
    }

    
    /// Get a private channel instance by name.
    ///
    /// - Parameter name: channel name
    /// - Returns: the private channel
    func privateChannel(name: String) -> IPrivateChannel{
        if(self.channels["private-" + name] == nil){
            // TODO: Can Crash, needs refactor.
            self.channels["private-" + name] = SocketIOPrivateChannel(
                socket: self.socketManager!.defaultSocket, name: "private-" + name, options: self.options
            )
        }
        return self.channels["private-" + name]! as! IPrivateChannel
    }

    
    /// Get a presence channel instance by name.
    ///
    /// - Parameter name: channel name
    /// - Returns: the presence channel
    func presenceChannel(name: String) -> IPresenceChannel{
        if(self.channels["presence-" + name] == nil){
            // TODO: Can Crash, needs refactor.
            self.channels["presence-" + name] = SocketIOPresenceChannel(
                socket: self.socketManager!.defaultSocket, name: "presence-" + name, options: self.options
            )
        }
        return self.channels["presence-" + name]! as! IPresenceChannel
    }

    
    /// Leave the given channel.
    ///
    /// - Parameter name: channel name
    func leave(name : String){
        let channels: [String] = [name, "private-" + name, "presence-" + name];
        for(name) in channels{
            if let c = self.channels[name] {
                c.unsubscribe()
                self.channels[name] = nil
            }
        }
    }

    
    /// Get the socket_id of the connection.
    ///
    /// - Returns: the socket id
    func socketId() -> String {
        return self.socketManager?.defaultSocket.sid ?? ""
    }

    
    /// Disconnect from the Echo server.
    func disconnect(){
        socketManager?.defaultSocket.disconnect()
    }
    
    
    /// Merge options with default
    ///
    /// - Parameter options: the options
    /// - Returns: merged options
    func mergeOptions(options : [String: Any]) -> [String: Any]{
        var def = self._defaultOptions
        for (k, v) in options{
            def[k] = v
        }
        return def
    }

}
