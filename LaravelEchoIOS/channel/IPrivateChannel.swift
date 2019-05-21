//
// Created by valentin vivies on 21/07/2017.
// Copyright (c) 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO


/// This protocol represents a private channel.
public protocol IPrivateChannel: IChannel{

    
    /// Trigger client event on the channel.
    ///
    /// - Parameters:
    ///   - eventName: event name
    ///   - data: data send
    /// - Returns: the private channel itself
    func whisper(eventName: String, data: [AnyObject]) -> IPrivateChannel

}
