import 'package:flutter/material.dart';
import 'package:preply_clone/bottomsheets/message_bottom_sheet.dart';

class ChatMessage {
  final String sender; // 'me' veya 'other'
  final String message;

  ChatMessage({required this.sender, required this.message});
}

class MessageDetailPage extends StatefulWidget {
  final String personName;
  final String personImage; // karşı tarafın profil resmi

  const MessageDetailPage({
    Key? key,
    required this.personName,
    required this.personImage,
  }) : super(key: key);

  @override
  State<MessageDetailPage> createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  final List<ChatMessage> _messages = [
   ChatMessage(sender: 'other', message: '👋 Merhaba hocam, nasılsınız?'),
  ChatMessage(sender: 'me', message: 'Merhaba İrem, iyiyim teşekkür ederim. Sen nasılsın?'),
  ChatMessage(sender: 'other', message: 'Ben de iyiyim hocam, teşekkür ederim 😊'),
  ChatMessage(sender: 'other', message: 'Hocam ödevlerimi tamamladım, size atayım mı?'),
  ChatMessage(sender: 'me', message: 'Tabii ki İremcim, gönderebilirsin.'),
  ChatMessage(sender: 'other', message: '📎 1. ve 2. haftanın PDF’lerini gönderiyorum şimdi.'),
  ChatMessage(sender: 'me', message: 'Dosyalar geldi, hemen göz atıyorum.'),
  ChatMessage(sender: 'me', message: 'Güzel çalışmışsın, özellikle 2. haftadaki açıklamalar çok net 👏'),
  ChatMessage(sender: 'other', message: 'Çok sevindim hocam, özellikle grafik kısmında biraz uğraştım.'),
  ChatMessage(sender: 'me', message: 'Emeğin belli oluyor. Görsel destek kullanman da çok yerinde olmuş.'),
  ChatMessage(sender: 'other', message: 'Eksik bir şey var mı sizce?'),
  ChatMessage(sender: 'me', message: 'Bir tek sonuç kısmını biraz daha detaylandırabilirsin, onun dışında her şey çok iyi.'),
  ChatMessage(sender: 'other', message: 'Anladım hocam, hemen düzenlerim. Çok teşekkür ederim.'),
  ChatMessage(sender: 'me', message: 'Rica ederim İremcim. Bu hafta için ek kaynaklara baktın mı?'),
  ChatMessage(sender: 'other', message: 'Henüz inceleyemedim hocam, ama bu akşam başlamak istiyorum.'),
  ChatMessage(sender: 'me', message: 'Tamamdır. Önce video dersleri izle, sonra notlarını çıkar.'),
  ChatMessage(sender: 'other', message: 'Not almak için defterim hazır bile 😄'),
  ChatMessage(sender: 'me', message: 'Harika! Eğer anlamadığın bir yer olursa her zaman sorabilirsin.'),
  ChatMessage(sender: 'other', message: 'Olur hocam, çok teşekkür ederim desteğiniz için 🙏'),
  ChatMessage(sender: 'me', message: 'Her zaman İrem, başarılarının devamını diliyorum 💪'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.personName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg.sender == 'me';

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profil resmi
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                         isMe ? 'images/beyza.png' : widget.personImage,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Mesaj balonu
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.white : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            msg.message,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          const _MessageInputBar(),
        ],
      ),
    );
  }
}

class _MessageInputBar extends StatelessWidget {
  const _MessageInputBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 4),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const MessageBottomSheet(),
              );
            },
          ),
          Expanded(
            child: SizedBox(
              height: 80,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Your message",
                  contentPadding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.thumb_up_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mic_none),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
