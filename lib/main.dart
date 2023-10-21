
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Chat {
  final String name;
  final String message;

  Chat(this.name, this.message);
}

class StatusUpdate {
  final String name;
  final String time;

  StatusUpdate(this.name, this.time);
}

class CallItem {
  final String name;
  final String time;

  CallItem(this.name, this.time);
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

  final List<StatusUpdate> statusUpdates = [
    StatusUpdate("You", "Just now"),
    StatusUpdate("Alice", "5 minutes ago"),
    StatusUpdate("John", "1 hour ago"),
    // Add more status updates here
  ];

  final List<CallItem> callList = [
    CallItem("Jane", "9:00 AM"),
    CallItem("Mike", "Yesterday"),
    // Add more call items here
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
              StatusList(statusUpdates),
              CallList(callList),
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
  final List<StatusUpdate> statusUpdates;

  StatusList(this.statusUpdates);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
        ),
        ListTile(
          leading: CircleAvatar(
            child: CircleAvatar(
              backgroundColor:
                  Color(0xFF026256), // Match chat list avatar color
              radius: 24.0,
            ),
          ),
          title: Text("Your Status"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          child: Text("Recent Updates", style: TextStyle(color: Colors.grey)),
        ),
        Divider(),
        for (var status in statusUpdates)
          ListTile(
            leading: CircleAvatar(
              child: CircleAvatar(
                child: Text(status.name[0].toUpperCase(),
                    style: TextStyle(color: Colors.white)),
                backgroundColor:
                    Color(0xFF026256), // Match chat list avatar color
                radius: 24.0,
              ),
            ),
            title: Text(status.name),
            subtitle: Text(status.time),
          ),
      ],
    );
  }
}

class CallList extends StatelessWidget {
  final List<CallItem> callList;

  CallList(this.callList);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
        ),
        ListTile(
          leading: CircleAvatar(
            child: CircleAvatar(
              child: Icon(Icons.phone,
                  color: Colors.green, size: 32.0), // Smaller phone icon
              backgroundColor:
                  Color(0xFF026256), // Match chat list avatar color
              radius: 24.0,
            ),
          ),
          title: Text("Create Call Link"),
          subtitle: Text("Share a link for your WhatsApp call"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          child: Text("Recent Calls", style: TextStyle(color: Colors.grey)),
        ),
        Divider(),
        for (var call in callList)
          ListTile(
            leading: CircleAvatar(
              child: CircleAvatar(
                child: Text(call.name[0].toUpperCase(),
                    style: TextStyle(color: Colors.white)),
                backgroundColor:
                    Color(0xFF026256), // Match chat list avatar color
                radius: 24.0,
              ),
            ),
            title: Text(call.name),
            subtitle: Text(call.time),
            trailing: Icon(
              Icons.phone,
              color: Colors.green,
            ),
          ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class Chat {
//   final String name;
//   final String message;

//   Chat(this.name, this.message);
// }

// class StatusUpdate {
//   final String name;
//   final String time;

//   StatusUpdate(this.name, this.time);
// }

// class MyApp extends StatelessWidget {
//   final List<Chat> chats = [
//     Chat("Maheer", "Are u there"),
//     Chat("Abdullah", "Fine"),
//     Chat("Alice", "Hi there!"),
//     Chat("Areesha", "Waiting for reply"),
//     Chat("Huzaifa", "Call me"),
//     Chat("Bob", "Flutter is awesome!"),
//     Chat("John", "Hello, how are you?"),
//     Chat("Irfan", "Good"),
//     Chat("Furqan", "Join Meeting"),
//     Chat("Jamal", "Are u there ?"),
//     Chat("Hamza", "Todays plan?"),
//     Chat("Sir", "Have a nice day"),
//     Chat("Saqib", "Hmmm"),
//     Chat("Haris", "Pushed"),
//     // Add more chats here
//   ];

//   final List<StatusUpdate> statusUpdates = [
//     StatusUpdate("You", "Just now"),
//     StatusUpdate("Alice", "5 minutes ago"),
//     StatusUpdate("John", "1 hour ago"),
//     // Add more status updates here
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 3, // Number of tabs
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor:
//                 Color(0xFF026256), // Set background color to #026256
//             title: Row(
//               children: <Widget>[
//                 Text('WhatsApp', style: TextStyle(fontWeight: FontWeight.bold)),
//                 Spacer(), // Adds space between title and icons
//                 IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     // Handle search icon tap
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.camera_alt),
//                   onPressed: () {
//                     // Handle camera icon tap
//                   },
//                 ),
//                 PopupMenuButton(
//                   icon: Icon(Icons.more_vert),
//                   itemBuilder: (context) => [
//                     PopupMenuItem(
//                       child: Text("New Group"),
//                     ),
//                     PopupMenuItem(
//                       child: Text("New Broadcast"),
//                     ),
//                     PopupMenuItem(
//                       child: Text("WhatsApp Web"),
//                     ),
//                     PopupMenuItem(
//                       child: Text("Starred messages"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             bottom: TabBar(
//               tabs: [
//                 Tab(text: 'Chats'),
//                 Tab(text: 'Status'),
//                 Tab(text: 'Calls'),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               ChatList(chats),
//               StatusList(statusUpdates),
//               CallsList(chats),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChatList extends StatelessWidget {
//   final List<Chat> chats;

//   ChatList(this.chats);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: chats.length,
//       itemBuilder: (context, index) {
//         final chat = chats[index];
//         final firstLetter = chat.name[0].toUpperCase();
//         return ListTile(
//           leading: CircleAvatar(
//             child: Text(firstLetter, style: TextStyle(color: Colors.white)),
//             backgroundColor:
//                 Color(0xFF026256), // Set background color to #026256
//           ),
//           title: Text(chat.name),
//           subtitle: Text(chat.message),
//           trailing: Text("10:30 AM"),
//           onTap: () {
//             // Handle chat item tap
//           },
//         );
//       },
//     );
//   }
// }

// class CallsList extends StatelessWidget {
//   final List<Chat> chats;

//   CallsList(this.chats);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: chats.length,
//       itemBuilder: (context, index) {
//         final chat = chats[index];
//         final firstLetter = chat.name[0].toUpperCase();
//         return ListTile(
//           leading: CircleAvatar(
//             child: Text(firstLetter, style: TextStyle(color: Colors.white)),
//             backgroundColor:
//                 Color(0xFF026256), // Set background color to #026256
//           ),
//           title: Text(chat.name),
//           subtitle: Text(chat.message),
//           trailing: Text("10:30 AM"),
//           onTap: () {
//             // Handle chat item tap
//           },
//         );
//       },
//     );
//   }
// }

// class StatusList extends StatelessWidget {
//   final List<StatusUpdate> statusUpdates;

//   StatusList(this.statusUpdates);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         ListTile(
//           leading: CircleAvatar(
//             // child: Icon(Icons.account_circle, size: 60.0),
//             backgroundColor: Colors.green,
//           ),
//           title: Text("Your Status"),
//           trailing: IconButton(
//             icon: Icon(Icons.more_horiz),
//             onPressed: () {
//               // Handle "more" icon tap for your status
//             },
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text("Recent Updates", style: TextStyle(color: Colors.grey)),
//         ),
//         Divider(),
//         for (var status in statusUpdates)
//           ListTile(
//             leading: CircleAvatar(
//               child: Text(status.name[0].toUpperCase(),
//                   style: TextStyle(color: Colors.white)),
//               backgroundColor: Colors.blue,
//             ),
//             title: Text(status.name),
//             subtitle: Text(status.time),
//           ),
//       ],
//     );
//   }
// }
