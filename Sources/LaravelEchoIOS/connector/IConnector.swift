//
// Created by valentin vivies on 21/07/2017.
//

import Foundation
import SocketIO


/// Connector protocol
protocol IConnector{

    
    /// Create a fresh connection.
    func connect()
    
    
    /// Set an event handler
    ///
    /// - Parameters:
    ///   - event: event name
    ///   - callback: callback
    func on(event: String, callback: @escaping NormalCallback)

    
    /// Get a channel instance by name.
    ///
    /// - Parameter name: channel name
    /// - Returns: the channel
    func channel(name: String) -> IChannel

    
    /// Listen an event on a channel
    ///
    /// - Parameters:
    ///   - name: channel name
    ///   - event: event name
    ///   - callback: callback
    /// - Returns: the channel
    func listen(name : String, event: String, callback: @escaping NormalCallback) -> IChannel

    
    /// Get a private channel instance by name.
    ///
    /// - Parameter name: channel name
    /// - Returns: the private channel
    func privateChannel(name: String) -> IPrivateChannel

    
    /// Get a presence channel instance by name.
    ///
    /// - Parameter name: channel name
    /// - Returns: the presence channel
    func presenceChannel(name: String) -> IPresenceChannel

    
    /// Leave the given channel.
    ///
    /// - Parameter name: channel name
    func leave(name : String)

    
    /// Get the socket_id of the connection.
    ///
    /// - Returns: the socket id
    func socketId() -> String

    
    /// Disconnect from the Echo server.
    func disconnect()

}
