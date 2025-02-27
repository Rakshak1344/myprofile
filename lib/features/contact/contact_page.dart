import 'package:flutter/material.dart';
import 'package:profile/features/common/widgets/title_and_line.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendEmail() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'dev.rakshith14@gmail.com',
      query:
          'subject=Contact from $name&body=Name: $name\nEmail: $email\nMessage: $message',
    );

    if (await canLaunchUrl(emailUri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Email client opened. Please complete sending.')),
      );
      Future.delayed(Duration(seconds: 2)).then((_) async {
        await launchUrl(emailUri);
      });
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open email client.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [

          SizedBox(height: 20),
          TitleAndLine(
            preTitle: "Get in touch",
            title: "Contact Me",
          ),
          SizedBox(height: 20),
          Container(
            width: 400,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.all()),
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your name' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your email' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                        labelText: 'Message',
                        contentPadding: EdgeInsets.all(16)),
                    maxLines: 5,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your message' : null,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 360,
            child: OutlinedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _sendEmail();
                }
              },
              label: const Text('Send'),
              icon: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
