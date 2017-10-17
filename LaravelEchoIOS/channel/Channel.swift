//
//  Channel.swift
//  laravel-echo-ios
//
//  Created by valentin vivies on 21/07/2017.
//  Copyright © 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

class Channel: IChannel {

    var options: [String: Any]

    init (options: [String: Any]){
        self.options = options
    }

    func listen(event: String, callback: @escaping NormalCallback) -> IChannel {
        return self
    }

    func notification(callback: @escaping NormalCallback) -> IChannel {
        return self.listen(event: ".Illuminate.Notifications.Events.BroadcastNotificationCreated", callback: callback)
    }

    func listenForWhisper(event: String, callback: @escaping NormalCallback) -> IChannel {
        return self.listen(event: ".client-" + event, callback: callback)
    }

    func unsubscribe(){

    }

    func subscribe(){

    }

}
