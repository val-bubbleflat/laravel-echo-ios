//
// Created by valentin vivies on 09/10/2017.
// Copyright (c) 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOPresenceChannel: SocketIoChannel, IPresenceChannel {

    override init(socket: SocketIOClient, name: String, options: [String: Any]){
        super.init(socket: socket, name: name, options: options)
    }

    func here(callback: NormalCallback) -> IPresenceChannel {
        return self;
    }

    func joining(callback: NormalCallback) -> IPresenceChannel {
        return self;
    }

    func leaving(callback: NormalCallback) -> IPresenceChannel {
        return self;
    }

}
