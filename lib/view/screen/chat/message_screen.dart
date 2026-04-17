import 'package:flipit/config/constants/app_sizes.dart';
import 'package:flipit/view/custom/common_image_view_widget.dart';
import 'package:flipit/view/custom/custom_appbar.dart';
import 'package:flipit/view/custom/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../config/constants/app_colors.dart';
import '../../../generated/assets.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<_ChatMessage> _messages = [
    _ChatMessage(
      text: "Lorem ipsum dolor sit amet consectetur.",
      isMe: true,
    ),
    _ChatMessage(
      text: "Lorem ipsum dolor sit amet consectetur.",
      isMe: false,
    ),
    _ChatMessage(
      text: "Lorem ipsum dolor sit amet consectetur.",
      isMe: true,
    ),
    _ChatMessage(
      text: "Lorem ipsum dolor sit amet consectetur.",
      isMe: false,
    ),
    _ChatMessage(
      text: "Lorem ipsum dolor sit amet consectetur.",
      isMe: true,
    ),
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        _ChatMessage(
          text: text,
          isMe: true,
        ),
      );
    });

    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff14C7E8);
    const Color bgColor = Color(0xffF4F4F4);
    const Color incomingColor = Color(0xffFAFAFA);

    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      appBar:  CustomAppBar(
        showBackButton: false,
        actions: [
          SizedBox(width: 20,),
          GestureDetector(
            onTap: (){
              Get.back();
            },
              child: CommonImageView(imagePath: Assets.imagesBackArrow,height: 40,)),
          SizedBox(width: 20,),
          CommonImageView(imagePath: Assets.imagesPpf1,height: 50,),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "John Doe",
                  size: 15,
                  weight: FontWeight.w600,
                ),
                MyText(
                  text: "Last seen 2 min",
                  size: 12,
                  weight: FontWeight.w400,
                  color: kText2Color,
                ),

              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:  SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Enter message......",
                      hintStyle: TextStyle(
                        color: Color(0xffA6A6A6),
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: _sendMessage,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 52,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Send",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 25),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 60, 14, 14),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: _messages.length,
                        separatorBuilder: (_, __) =>
                        const SizedBox(height: 14),
                        itemBuilder: (context, index) {
                          final msg = _messages[index];
                          return Align(
                            alignment: msg.isMe
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                MediaQuery.of(context).size.width * 0.62,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: msg.isMe
                                    ? primaryColor
                                    : incomingColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                msg.text,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.25,
                                  color: msg.isMe
                                      ? Colors.white
                                      : const Color(0xff333333),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Top product/user badge
              Positioned(
                top: -20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       CommonImageView(
                         imagePath: Assets.imagesShirt,radius: 50,
                         height: 40,
                         width: 40,
                       ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "Hotel T-Shirt",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff3A3A3A),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "M",
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff8B8B8B),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isMe;

  _ChatMessage({
    required this.text,
    required this.isMe,
  });
}