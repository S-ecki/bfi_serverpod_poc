import 'package:poc_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

const _channelPixelAdded = 'pixel-added';

class InfoEndpoint extends Endpoint {
  final data = Infos(infoList: [
    Info(
      title: 'Surfen mit Speed',
      body:
          'Die neuen „High-Performance“ WLAN Kabel sind da. Damit erreicht Ihr großartige Downloadgeschwindigkeiten von 12 (!!) kb/s. Jede Person, die eines benötigt, einfach bitte kurz per Fax bei uns melden.',
      important: true,
    ),
    Info(
      title: 'Neuer Entwicklungspartner',
      body:
          'Das BFI wird in Zukunft ihre IT-Infrastuktur mit der Firma "LEAN-CODERS" auf das nächste Level bringen. Wir freuen uns auf eine effiziente Zusammenarbeit.',
    ),
    Info(
      title: 'Heiligabend vor der Tür',
      body:
          'In 202 Tagen ist bereits erneut Heiligabend. Ein Grund zur Freude, oder?',
    ),
    Info(
      title: 'Bald bessere Luft!',
      body:
          'Die IT Abteilung hat Großes zu verkünden: Wir haben einen neuen Luftbefeuchter. Vielen Dank für Eure Aufmerksamkeit!',
    ),
  ]);

  @override
  Future<void> streamOpened(StreamingSession session) async {
    // Send the client a full version of the pixel image.
    sendStreamMessage(session, data);

    // Add a listener to the _channelPixelAdded channel. The listener will be
    // called whenever we post a message to the channel. In this case, we will
    // just pass the message on to the client. The listeners are connected to
    // the session and will be automatically disposed when the session is
    // closed. If you need to do any additional cleanup work, this can be done
    // by overriding the streamClosed method.
    session.messages.addListener(_channelPixelAdded, (update) {
      sendStreamMessage(session, update);
    });
  }

  // handleStreamMessage is called when we get a message from a client. The
  // Session object identifies which client we are receiving the message from.
  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    if (message is Info) {
      data.infoList.add(message);
      // Notify all connected clients that we set a pixel, by posting a message
      // to the _channelPixelAdded channel.
      session.messages.postMessage(_channelPixelAdded, data, global: false);
    }
  }
}
