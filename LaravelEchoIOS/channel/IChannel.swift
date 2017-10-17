//
//  IChannel.swift
//  laravel-echo-ios
//
//  Created by valentin vivies on 21/07/2017.
//  Copyright © 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

protocol IChannel {
    
    func listen(event: String, callback: @escaping NormalCallback) -> IChannel
    
    func notification(callback: @escaping NormalCallback) -> IChannel

    func listenForWhisper(event: String, callback: @escaping NormalCallback) -> IChannel

    func unsubscribe()

    func subscribe()
    
}
