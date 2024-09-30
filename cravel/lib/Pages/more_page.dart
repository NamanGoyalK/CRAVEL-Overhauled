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
      body: const Padding(
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
                  'We are a team of six members who are passionate about the culture of India.\n\nNaman Goyal: Founder and Developer\nPranav Mishra: Founder and Database handler\n\nOther Co-founders:\nVansh Mishra\nAtulya Raj\nAntriksh Balayan\nKriti Garg'),
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
          ],
        ),
      ),
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
          onPressed: () async {
            await signOut();
            if (FirebaseAuth.instance.currentUser == null) {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            }
          },
          icon: const Icon(
            Icons.logout_outlined,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }
}