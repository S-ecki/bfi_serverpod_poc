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
      title: 'Bfi Prototype Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
          body: Banner(
              message: "Prototype",
              location: BannerLocation.topEnd,
              child: WebInfoSender())),
    );
  }
}

class WebInfoSender extends StatefulWidget {
  const WebInfoSender({super.key});

  @override
  WebInfoSenderState createState() => WebInfoSenderState();
}

class WebInfoSenderState extends State<WebInfoSender> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    client.openStreamingConnection();
    super.initState();
  }

  void _sendInfo() {
    final infor =
        Info(title: _titleController.text, body: _bodyController.text);
    client.info.sendStreamMessage(infor);
    _titleController.clear();
    _bodyController.clear();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Enter title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _bodyController,
            decoration: const InputDecoration(
              hintText: 'Enter body',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
            minLines: 4,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _sendInfo,
            child: const Text('Send Info'),
          ),
        ],
      ),
    );
  }
}
