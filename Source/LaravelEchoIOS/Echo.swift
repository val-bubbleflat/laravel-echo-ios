//
//  Echo.swift
//  laravel-echo-ios
//
//  Created by valentin vivies on 21/07/2017.
//

import Foundation
import SocketIO


/// This class is the primary API for interacting with broadcasting.
class Echo {
    
    
    /// The broadcasting connector.
    var connector: IConnector

    
    /// The Echo options.
    var options: [String: Any]
    
    
    /// Create a new class instance.
    ///
    /// - Parameter options: options
    init(options: [String: Any]){
        self.options = options
        //No Pusher support
        self.connector = SocketIOConnector(options: self.options);
    }
    
    
    /// when connected to the socket
    ///
    /// - Parameter callback: callback
    func connected(callback: @escaping NormalCallback){
        return self.on(event: "connect", callback: callback)
    }
    
    
    /// Catch an event
    ///
    /// - Parameters:
    ///   - event: event name
    ///   - callback: callback
    func on(event: String, callback: @escaping NormalCallback){
        return self.connector.on(event: event, callback: callback)
    }

    
    /// Listen for an event on a channel instance.
    ///
    /// - Parameters:
    ///   - channel: channel name
    ///   - event: event name
    ///   - callback: callback
    /// - Returns: the channel listened
    func listen(channel: String, event: String, callback: @escaping NormalCallback) -> IChannel{
        return self.connector.listen(name: channel, event: event, callback: callback);
    }

    
    /// Get a channel instance by name.
    ///
    /// - Parameter channel: channel name
    /// - Returns: the channel
    func channel(channel: String) -> IChannel {
        return self.connector.channel(name: channel);
    }

    
    /// Get a private channel instance by name.
    ///
    /// - Parameter channel: channel name
    /// - Returns: the private channel
    func privateChannel(channel: String) -> IChannel{
        return self.connector.privateChannel(name:channel);
    }

    
    /// Get a presence channel instance by name.
    ///
    /// - Parameter channel: channel name
    /// - Returns: the private channel
    func join(channel: String) -> IPresenceChannel {
        return self.connector.presenceChannel(name:channel)
    }
    
    
    /// Leave the given channel.
    ///
    /// - Parameter channel: the channel name
    func leave(channel: String) {
        self.connector.leave(name: channel)
    }

    
    /// Get the Socket ID for the connection.
    ///
    /// - Returns: the socket id
    func socketId() -> String {
        return self.connector.socketId()
    }

    
    /// Disconnect from the Echo server.
    func disconnect(){
        self.connector.disconnect();
    }
    
}
