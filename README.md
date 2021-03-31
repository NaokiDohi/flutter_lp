# flutter_lp

A new Flutter project.

## Getting Started

Docker commands below are for firebase cli.

1.  docker build . -t firebase
2.  docker run -it -p 9005:9005 -v $(pwd):/app firebase  
    firebase login  
    firebase init  
    exit
3.  docker run -it -p 8080:8080 -v $(pwd):/app firebase  
    firebase emulators:sart

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
