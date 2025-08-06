import 'package:chat_app/constanst.dart';
import 'package:chat_app/widgets/custom_chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatScreen';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollection);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data!.docs[0]['message']);
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    KLogo,
                    height: 70,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              backgroundColor: kPrimaryColors,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemBuilder: (context, index) {
                      return ChatBuble(
                        backgrange: kPrimaryColors,
                        text: 'i am new user ',
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({KMessages: data});
                      controller.clear();
                    },
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        suffixIcon: const Icon(Icons.send,
                            color: kPrimaryColors, size: 30),
                        hintText: 'Send Massage',
                        hintStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: kPrimaryColors, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: Colors.teal, width: 2))),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Text('Loading.....');
        }
      },
    );
  }
}
