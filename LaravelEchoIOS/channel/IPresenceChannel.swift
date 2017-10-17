//
// Created by valentin vivies on 21/07/2017.
// Copyright (c) 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

protocol IPresenceChannel: IChannel{

    func here(callback: NormalCallback) -> IPresenceChannel

    func joining(callback: NormalCallback) -> IPresenceChannel

    func leaving(callback: NormalCallback) -> IPresenceChannel

}