//
//  Echo.swift
//  laravel-echo-ios
//
//  Created by valentin vivies on 21/07/2017.
//  Copyright © 2017 Bubbleflat. All rights reserved.
//

import Foundation
import SocketIO

class Echo {
    
    var connector: IConnector

    var options: [String: Any]
    
    init(options: [String: Any]){
        self.options = options
        //No Pusher support
        self.connector = SocketIOConnector(options: self.options);
    }
    
    func connected(callback: @escaping NormalCallback){
        return self.on(event: "connect", callback: callback)
    }
    
    func on(event: String, callback: @escaping NormalCallback){
        return self.connector.on(event: event, callback: callback)
    }

    func listen(channel: String, event: String, callback: @escaping NormalCallback) -> IChannel{
        return self.connector.listen(name: channel, event: event, callback: callback);
    }

    func channel(channel: String) -> IChannel {
        return self.connector.channel(name: channel);
    }

    func privateChannel(channel: String) -> IChannel{
        return self.connector.privateChannel(name:channel);
    }

    func join(channel: String) -> IPresenceChannel {
        return self.connector.presenceChannel(name:channel)
    }

    func socketId() -> String {
        return self.connector.socketId()
    }

    func disconnect(){
        self.connector.disconnect();
    }
    
}
