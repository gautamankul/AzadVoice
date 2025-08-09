// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Message> messages = [
    Message(
      senderName: "Party Official",
      lastMessage: "Healthcare rally update: We've reached 500 attendees!",
      timestamp: "2:30 PM",
      isRead: false,
      avatarColor: Colors.blue,
      messageCount: 3,
    ),
    Message(
      senderName: "Campaign Team",
      lastMessage: "Please review the budget proposal for next quarter",
      timestamp: "1:15 PM",
      isRead: true,
      avatarColor: Colors.green,
      messageCount: 0,
    ),
    Message(
      senderName: "Event Coordinator",
      lastMessage: "Venue confirmed for Saturday's rally at Central Park",
      timestamp: "12:45 PM",
      isRead: false,
      avatarColor: Colors.orange,
      messageCount: 1,
    ),
    Message(
      senderName: "Volunteer Group",
      lastMessage: "Thank you for organizing yesterday's cleanup drive!",
      timestamp: "11:30 AM",
      isRead: true,
      avatarColor: Colors.purple,
      messageCount: 0,
    ),
    Message(
      senderName: "Media Team",
      lastMessage: "Press release draft is ready for your approval",
      timestamp: "10:20 AM",
      isRead: false,
      avatarColor: Colors.teal,
      messageCount: 2,
    ),
    Message(
      senderName: "Finance Committee",
      lastMessage: "Monthly financial report has been uploaded",
      timestamp: "9:45 AM",
      isRead: true,
      avatarColor: Colors.indigo,
      messageCount: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Messages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add new message functionality
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search messages...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),

          // Messages List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessageTile(message);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(Message message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: message.avatarColor.withOpacity(0.1),
              child: Text(
                message.senderName[0],
                style: TextStyle(
                  color: message.avatarColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            if (message.messageCount > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Text(
                    '${message.messageCount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          message.senderName,
          style: TextStyle(
            fontWeight: message.isRead ? FontWeight.normal : FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            message.lastMessage,
            style: TextStyle(
              color: message.isRead ? Colors.grey[600] : Colors.black87,
              fontSize: 14,
              fontWeight: message.isRead ? FontWeight.normal : FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.timestamp,
              style: TextStyle(
                color: message.isRead ? Colors.grey[400] : Colors.blue,
                fontSize: 12,
                fontWeight: message.isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            if (!message.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        onTap: () {
          // Navigate to individual chat screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(message: message),
            ),
          );
        },
      ),
    );
  }
}

class Message {
  final String senderName;
  final String lastMessage;
  final String timestamp;
  final bool isRead;
  final Color avatarColor;
  final int messageCount;

  Message({
    required this.senderName,
    required this.lastMessage,
    required this.timestamp,
    required this.isRead,
    required this.avatarColor,
    required this.messageCount,
  });
}

class ChatScreen extends StatefulWidget {
  final Message message;

  const ChatScreen({super.key, required this.message});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> chatMessages = [];

  @override
  void initState() {
    super.initState();
    // Add some sample chat messages
    chatMessages.addAll([
      ChatMessage(
        text: widget.message.lastMessage,
        isMe: false,
        timestamp: widget.message.timestamp,
      ),
      ChatMessage(
        text: "Thanks for the update! Looking forward to it.",
        isMe: true,
        timestamp: "2:35 PM",
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: widget.message.avatarColor.withOpacity(0.2),
              child: Text(
                widget.message.senderName[0],
                style: TextStyle(
                  color: widget.message.avatarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.message.senderName,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final chatMessage = chatMessages[index];
                return _buildChatBubble(chatMessage);
              },
            ),
          ),
          
          // Message Input
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(ChatMessage chatMessage) {
    return Align(
      alignment: chatMessage.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: chatMessage.isMe ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chatMessage.text,
              style: TextStyle(
                color: chatMessage.isMe ? Colors.white : Colors.black87,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              chatMessage.timestamp,
              style: TextStyle(
                color: chatMessage.isMe ? Colors.white70 : Colors.grey[600],
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        chatMessages.add(
          ChatMessage(
            text: _messageController.text.trim(),
            isMe: true,
            timestamp: _getCurrentTime(),
          ),
        );
      });
      _messageController.clear();
    }
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";
  }
}

class ChatMessage {
  final String text;
  final bool isMe;
  final String timestamp;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}