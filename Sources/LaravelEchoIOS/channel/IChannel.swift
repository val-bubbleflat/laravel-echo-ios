//
//  IChannel.swift
//  laravel-echo-ios
//
//  Created by valentin vivies on 21/07/2017.
//

import Foundation
import SocketIO

/// This class represents a basic channel protocol.
public protocol IChannel {
    
    /// Listen for an event on the channel instance.
    ///
    /// - Parameters:
    ///   - event: event name
    ///   - callback: callback
    /// - Returns: the channel itself
    func listen(event: String, callback: @escaping NormalCallback) -> IChannel
    
    /// Listen for an event on the channel instance.
    ///
    /// - Parameter callback: callback
    /// - Returns: the channel itself
    func notification(callback: @escaping NormalCallback) -> IChannel

    /// Listen for a whisper event on the channel instance.
    ///
    /// - Parameters:
    ///   - event: event name
    ///   - callback: callback
    /// - Returns: the channel itself
    func listenForWhisper(event: String, callback: @escaping NormalCallback) -> IChannel

    /// Unsubscribe from channel and ubind event callbacks.
    func unsubscribe()

    /// Subscribe to a Socket.io channel.
    func subscribe()
    
}
