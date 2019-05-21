//
// Created by valentin vivies on 21/07/2017.
//

import Foundation
import SocketIO


///  This protocol represents a presence channel.
public protocol IPresenceChannel: IChannel{

    
    /// Register a callback to be called anytime the member list changes.
    ///
    /// - Parameter callback: callback
    /// - Returns: the presence channel itself
    func here(callback: NormalCallback) -> IPresenceChannel

    
    /// Listen for someone joining the channel.
    ///
    /// - Parameter callback: callback
    /// - Returns: the presence channel itself
    func joining(callback: NormalCallback) -> IPresenceChannel

    /// Listen for someone leaving the channel.
    ///
    /// - Parameter callback: callback
    /// - Returns: the presence channel itself
    func leaving(callback: NormalCallback) -> IPresenceChannel

}
