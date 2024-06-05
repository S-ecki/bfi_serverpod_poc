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

  List<Info> infos = [];
  var isImportant = false;

  @override
  void initState() {
    client.openStreamingConnection();
    _getInfo();
    super.initState();
  }

  void _getInfo() async {
    await for (var message in client.info.stream) {
      if (message is Infos) {
        setState(() {
          infos = (message).infoList;
        });
      }
    }
  }

  void _sendInfo() {
    final info = Info(
        title: _titleController.text,
        body: _bodyController.text,
        important: isImportant);
    client.info.sendStreamMessage(info);
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
      appBar: AppBar(
        leading: null,
        title: Text(
          'BFI Admin Prototyp',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Titel',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                hintText: 'Informationen',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              minLines: 4,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: isImportant,
                  onChanged: (value) => setState(() => isImportant = value!),
                  activeColor: bfiBlue,
                ),
                const Text("Wichtig"),
                const Spacer(),
                ElevatedButton(
                  onPressed: _sendInfo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bfiRed,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Veröffentlichen'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(
              color: bfiBlue,
              thickness: 2,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: InfoListWidget(infos: infos),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoListWidget extends StatelessWidget {
  final List<Info> infos;

  const InfoListWidget({
    super.key,
    required this.infos,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: infos.length,
      itemBuilder: (context, index) {
        final info = infos[index];
        return ListTile(
          onTap: () {},
          iconColor: bfiBlue,
          dense: false,
          title: Row(
            children: [
              Text(
                info.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(width: 8),
              if (info.important ?? false)
                const Icon(Icons.warning, color: bfiRed),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
