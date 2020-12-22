//
// Created by valentin vivies on 09/10/2017.
//

import Foundation
import SocketIO


/// This class represents a Socket.io presence channel.
class SocketIOPresenceChannel: SocketIoChannel, IPresenceChannel {

    
    /// Create a new class instance.
    ///
    /// - Parameters:
    ///   - socket: the socket instance
    ///   - name: the channel name
    ///   - options: options for the channel
    override init(socket: SocketIOClient, name: String, options: [String: Any]){
        super.init(socket: socket, name: name, options: options)
    }

    
    /// Register a callback to be called anytime the member list changes. TODO
    ///
    /// - Parameter callback: callback
    /// - Returns: the presence channel itself
    func here(callback: NormalCallback) -> IPresenceChannel {
        return self;
    }

    
    /// Listen for someone joining the channel. TODO
    ///
    /// - Parameter callback: callback
    /// - Returns: the presence channel itself
    func joining(callback: NormalCallback) -> IPresenceChannel {
        return self;
    }

    /// Listen for someone leaving the channel. TODO
    ///
    /// - Parameter callback: callback
    /// - Returns: the presence channel itself
    func leaving(callback: NormalCallback) -> IPresenceChannel {
        return self;
    }

}
