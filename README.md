# flutterconnectivity

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## For internet connectivity we need to check the following condition

     subscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityStatus = result.toString();
      print(_connectivityStatus);

      if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile)
        {
          setState(() {

          });
        }
    });
    
 ## StreamSubscription:
 It is an event from a stream. The subscription provides events to the listener and holds the callbacks used to handle the events.
 
 The subscription can also be used to unsubscribe from the events or to temporarily pause the events from the stream.
 
