//
// Created by valentin vivies on 21/07/2017.
// Copyright (c) 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

protocol IConnector{

    func connect()
    
    func on(event: String, callback: @escaping NormalCallback)

    func channel(name: String) -> IChannel

    func listen(name : String, event: String, callback: @escaping NormalCallback) -> IChannel

    func privateChannel(name: String) -> IPrivateChannel

    func presenceChannel(name: String) -> IPresenceChannel

    func leave(name : String)

    func socketId() -> String

    func disconnect()

}
