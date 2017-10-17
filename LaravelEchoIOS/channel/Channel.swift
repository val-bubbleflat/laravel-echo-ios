//
//  Channel.swift
//  laravel-echo-ios
//
//  Created by valentin vivies on 21/07/2017.
//

import Foundation
import SocketIO


/// This class represents a basic channel.
class Channel: IChannel {

    
    /// The Echo options.
    var options: [String: Any]

    
    /// Create new Channel
    ///
    /// - Parameter options: options
    init (options: [String: Any]){
        self.options = options
    }

    
    /// Listen for an event on the channel instance.
    ///
    /// - Parameters:
    ///   - event: event name
    ///   - callback: callback
    /// - Returns: the channel itself
    func listen(event: String, callback: @escaping NormalCallback) -> IChannel {
        return self
    }

    
    /// Listen for an event on the channel instance.
    ///
    /// - Parameter callback: callback
    /// - Returns: the channel itself
    func notification(callback: @escaping NormalCallback) -> IChannel {
        return self.listen(event: ".Illuminate.Notifications.Events.BroadcastNotificationCreated", callback: callback)
    }

    
    /// Listen for a whisper event on the channel instance.
    ///
    /// - Parameters:
    ///   - event: event name
    ///   - callback: callback
    /// - Returns: the channel itself
    func listenForWhisper(event: String, callback: @escaping NormalCallback) -> IChannel {
        return self.listen(event: ".client-" + event, callback: callback)
    }

    
    /// Unsubscribe from channel and ubind event callbacks.
    func unsubscribe(){

    }

    
    /// Subscribe to a Socket.io channel.
    func subscribe(){

    }

}
