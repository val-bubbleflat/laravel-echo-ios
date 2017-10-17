//
// Created by valentin vivies on 21/07/2017.
// Copyright (c) 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

protocol IPrivateChannel: IChannel{

    func whisper(eventName: String, data: [AnyObject]) -> IPrivateChannel

}
