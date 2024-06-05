import 'package:bfi_prototype_web/main.dart';
import 'package:flutter/material.dart';
import 'package:poc_client/poc_client.dart';

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
    return Scaffold(
        body: Banner(
      message: "Prototyp",
      location: BannerLocation.topEnd,
      child: Padding(
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
      ),
    ));
  }
}
