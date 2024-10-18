import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

Future<void> signOut() async {
  await auth.signOut();
}

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: titleBar(context),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'About Us:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                subtitle: Text(
                    'We are a team of six members who are passionate about the culture of India.\n\nNaman Goyal: Founder and Developer\n\nOther Co-founders:\nPranav Mishra\nVansh Mishra\nAtulya Raj\nAntriksh Balayan\nKriti Garg'),
              ),
              ListTile(
                title: Text(
                  'Contact Us:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                subtitle: Text(
                  'Email: namangoyaldev@gmail.com',
                ),
              ),
              ListTile(
                title: Text(
                  'Privacy Policy:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                subtitle: Text(
                  'We will not share your personal information with anyone.',
                ),
              ),
              ListTile(
                title: Text(
                  'Terms and Conditions:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                subtitle: Text(
                  'Do not spam our emails or publish fake reports.',
                ),
              ),
              ListTile(
                title: Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Developed by Naman Goyal with ❤️',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  AppBar titleBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffffffff),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Cravel',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Logout?'),
              content: const Text(
                'Press ok to logout or cancel to remain signed in.',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    await signOut();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                    if (FirebaseAuth.instance.currentUser == null) {
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          icon: const Icon(
            Icons.logout_outlined,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }

  bottomBar(BuildContext context) {
    return const BottomAppBar(
      color: Color(0xffffffff),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: null, child: Text('Remove Adds')),
        ],
      ),
    );
  }
}
