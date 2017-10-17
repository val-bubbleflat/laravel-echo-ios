# Laravel Echo IOS

This is a project by [Bubbleflat : find your perfect roommate and flatsharing](https://bubbleflat.com) 

This project is wrapper to use [Laravel Echo](https://github.com/laravel/echo) in Swift IOS project

This only work for **socket.io**, NOT FOR PUSHER yet !

## Installation

This module can be imported with CocoaPods

```
pod 'LaravelEchoIOS'
```

## Example

First, you need to import the framework :

```Swift
import LaravelEchoIOS
```

Then you can use it like in javascript ( but you need to wait for the socket to be connected )

```Swift
let token = "Auth token"
let e : Echo = Echo(options: ["host":"http://localhost:6001", "auth": ["headers": ["Authorization": "Bearer " + token]]])

e.connected(){ data, ack in

    print("CONNECTED")

    e.join(channel: "conversation.243").listen(event: ".NewMessage", callback: { data, ack in

        print(data)

    })

}
```

## Documentation

See [full Echo documentation](https://laravel.com/docs/5.5/broadcasting) for all available methods

All callback must been use like this : 

```Swift
e.connected(){ data, ack in

  // Do something when call

}
```

Or with a function like this

```Swift
func listener(data: [Any], ack: SocketAckEmitter)
```


**here, joining, leaving are not available yet**
