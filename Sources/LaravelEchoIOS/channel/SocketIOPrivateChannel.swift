//
// Created by valentin vivies on 09/10/2017.
//

import Foundation
import SocketIO

/**
 * This class represents a Socket.io private channel.
 */
class SocketIOPrivateChannel: SocketIoChannel, IPrivateChannel {

    /// Create a new class instance.
    ///
    /// - Parameters:
    ///   - socket: the socket instance
    ///   - name: the channel name
    ///   - options: options for the channel
    override init(socket: SocketIOClient, name: String, options: [String: Any]){
        super.init(socket: socket, name: name, options: options)
    }

    
    /// Trigger client event on the channel.
    ///
    /// - Parameters:
    ///   - eventName: event name
    ///   - data: data send
    /// - Returns: the private channel itself
    func whisper(eventName: String, data: [AnyObject]) -> IPrivateChannel{
        self.socket.emit("client event", [
            "channel": self.name,
            "event": "client-" + eventName,
            "data" : data
        ])
        return self
    }

}
