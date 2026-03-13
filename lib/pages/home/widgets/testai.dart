import 'package:flutter/material.dart';
import 'package:yyh_clothes/common/utils/ai_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final controller = TextEditingController();

  String result = "";

  void send() async {

    String text = controller.text;

    setState(() {
      result = "AI思考中...";
    });

    String res = await AIService.chat(text);

    setState(() {
      result = res;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("AI聊天")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "问AI一个问题"
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: send,
              child: const Text("发送"),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: SingleChildScrollView(
                child: Text(result),
              ),
            )

          ],
        ),
      ),
    );
  }
}