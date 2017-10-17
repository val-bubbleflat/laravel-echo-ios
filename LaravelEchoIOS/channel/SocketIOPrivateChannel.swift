//
// Created by valentin vivies on 09/10/2017.
// Copyright (c) 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOPrivateChannel: SocketIoChannel, IPrivateChannel {

    override init(socket: SocketIOClient, name: String, options: [String: Any]){
        super.init(socket: socket, name: name, options: options)
    }

    func whisper(eventName: String, data: [AnyObject]) -> IPrivateChannel{
        self.socket.emit("client event", [
            "channel": self.name,
            "event": "client-" + eventName,
            "data" : data
        ])
        return self
    }

}
