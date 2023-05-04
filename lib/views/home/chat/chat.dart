import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class Message {
  Message({
    required this.text,
    required this.author,
    required this.isMe,
    required this.time,
    required bool isUser,
  });

  final String text;
  final String author;
  final bool isMe;
  final String time;

  String get initials {
    return author.characters.take(2).join().toUpperCase();
  }
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = <Message>[];

  void _onSubmit() {
    final String text = _textController.text;
    if (text.isEmpty) return;
    setState(() {
      _messages.insert(0,
          Message(text: text, isUser: true, author: '', isMe: false, time: ''));
    });
    // 与ChatGPT模型交互并生成响应消息
    final String response = generateResponse(text) as String;
    setState(() {
      _messages.insert(
          0,
          Message(
              text: response,
              isUser: false,
              author: '',
              isMe: false,
              time: ''));
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) {
                final Message message = _messages[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(child: Text(message.initials)),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(message.author),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text(message.text),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: SafeArea(
              child: Row(
                children: <Widget>[
                  // 文本输入框
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onSubmitted: (_) => _onSubmit(),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '请提问~',
                      ),
                    ),
                  ),
                  // 发送按钮
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => _onSubmit(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

Future<String> generateResponse(String text) async {
  String url = 'https://my-chatgpt-api.com/generate';
  var uri = Uri.parse(url);
  final response = await http.post(
    uri,
    body: json.encode({'text': text}),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as Map<String, dynamic>;
    print(data);
    return data['response'] as String;
  } else {
    throw Exception('Failed to generate response');
  }
}
