import 'package:flutter/material.dart';
import 'package:poc_client/poc_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bfi Prototype',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Banner(
              message: "Prototype",
              location: BannerLocation.topEnd,
              child: DesktopInfoDisplay()),
        ));
  }
}

class DesktopInfoDisplay extends StatefulWidget {
  const DesktopInfoDisplay({super.key});

  @override
  State<DesktopInfoDisplay> createState() => _DesktopInfoDisplayState();
}

class _DesktopInfoDisplayState extends State<DesktopInfoDisplay> {
  List<Info>? infos;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  void getInfo() async {
    await client.openStreamingConnection();
    await for (var message in client.info.stream) {
      if (message is Infos) {
        setState(() {
          infos = (message).infoList;
          errorMessage = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Container(
        height: 50,
        color: Colors.red[300],
        child: Center(
          child: Text(errorMessage!),
        ),
      );
    } else if (infos == null) {
      return Container(
        height: 50,
        color: Colors.grey[300],
        child: const Center(
          child: Text('No server response yet.'),
        ),
      );
    }

    return ListView.builder(
      itemCount: infos!.length,
      itemBuilder: (context, index) {
        final info = infos![index];
        return ListTile(
          title: Text(info.title),
          subtitle: Text(info.body),
        );
      },
    );
  }
}
