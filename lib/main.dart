import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Chat {
  final String name;
  final String message;

  Chat(this.name, this.message);
}

class MyApp extends StatelessWidget {
  final List<Chat> chats = [
    Chat("Maheer", "Are u there"),
    Chat("Abdullah", "Fine"),
    Chat("Alice", "Hi there!"),
    Chat("Areesha", "Waiting for reply"),
    Chat("Huzaifa", "Call me"),
    Chat("Bob", "Flutter is awesome!"),
    Chat("John", "Hello, how are you?"),
    Chat("Irfan", "Good"),
    Chat("Furqan", "Join Meeting"),
    Chat("Jamal", "Are u there ?"),
    Chat("Hamza", "Todays plan?"),
    Chat("Sir", "Have a nice day"),
    Chat("Saqib", "Hmmm"),
    Chat("Haris", "Pushed"),
    // Add more chats here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:
                Color(0xFF026256), // Set background color to #026256
            title: Row(
              children: <Widget>[
                Text('WhatsApp', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(), // Adds space between title and icons
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Handle search icon tap
                  },
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    // Handle camera icon tap
                  },
                ),
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("New Group"),
                    ),
                    PopupMenuItem(
                      child: Text("New Broadcast"),
                    ),
                    PopupMenuItem(
                      child: Text("WhatsApp Web"),
                    ),
                    PopupMenuItem(
                      child: Text("Starred messages"),
                    ),
                  ],
                ),
              ],
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Chats'),
                Tab(text: 'Status'),
                Tab(text: 'Calls'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ChatList(chats),
              StatusList(chats),
              CallsList(chats),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  final List<Chat> chats;

  ChatList(this.chats);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        final firstLetter = chat.name[0].toUpperCase();
        return ListTile(
          leading: CircleAvatar(
            child: Text(firstLetter, style: TextStyle(color: Colors.white)),
            backgroundColor:
                Color(0xFF026256), // Set background color to #026256
          ),
          title: Text(chat.name),
          subtitle: Text(chat.message),
          trailing: Text("10:30 AM"),
          onTap: () {
            // Handle chat item tap
          },
        );
      },
    );
  }
}

class StatusList extends StatelessWidget {
  final List<Chat> chats;

  StatusList(this.chats);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        final firstLetter = chat.name[0].toUpperCase();
        return ListTile(
          leading: CircleAvatar(
            child: Text(firstLetter, style: TextStyle(color: Colors.white)),
            backgroundColor:
                Color(0xFF026256), // Set background color to #026256
          ),
          title: Text(chat.name),
          subtitle: Text(chat.message),
          trailing: Text("10:30 AM"),
          onTap: () {
            // Handle chat item tap
          },
        );
      },
    );
  }
}

class CallsList extends StatelessWidget {
  final List<Chat> chats;

  CallsList(this.chats);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        final firstLetter = chat.name[0].toUpperCase();
        return ListTile(
          leading: CircleAvatar(
            child: Text(firstLetter, style: TextStyle(color: Colors.white)),
            backgroundColor:
                Color(0xFF026256), // Set background color to #026256
          ),
          title: Text(chat.name),
          subtitle: Text(chat.message),
          trailing: Text("10:30 AM"),
          onTap: () {
            // Handle chat item tap
          },
        );
      },
    );
  }
}

// class StatusList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Status List'),
//     );
//   }
// }

// class CallsList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Calls List'),
//     );
//   }
// }
