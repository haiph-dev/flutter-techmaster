import 'package:flutter/material.dart';

const imgSrc =
    'https://img.freepik.com/premium-photo/image-colorful-galaxy-sky-generative-ai_791316-9864.jpg?w=1480';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avatar Page')),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Avatar(name: 'Hai', isUpload: true),
          Avatar(
            name: 'Hai',
            isUpload: false,
            avatarUrl: imgSrc,
          )
        ]),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  Avatar(
      {super.key, required this.name, this.avatarUrl, required this.isUpload});

  final String name;
  final String? avatarUrl;
  final bool isUpload;

  late List<Widget> stackList = [];

  @override
  Widget build(BuildContext context) {
    stackList.add(
      CircleAvatar(
        backgroundColor: Colors.lightBlue,
        radius: 100,
        child: Text(
          name[0],
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 100, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    if (avatarUrl?.isEmpty ?? true) {
      print(avatarUrl.runtimeType);
      stackList.add(CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl!),
        radius: 100,
        onBackgroundImageError: (e, s) {
          debugPrint('image issue, $e,$s');
        },
      ));
    }

    if (isUpload == true) {
      stackList.add(Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: Colors.lightBlue,
            radius: 30,
            child: Icon(
              Icons.upload,
              size: 50,
              color: Colors.white,
            ),
          )));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: stackList,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 50),
        )
      ],
    );
  }
}
