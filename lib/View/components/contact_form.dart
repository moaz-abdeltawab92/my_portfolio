import 'package:flutter/material.dart';
import 'package:portfolio_website/Responsive/responsive.dart';
import 'package:portfolio_website/Utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Get In Touch With Me",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: Responsive.isMobile(context)
              ? Responsive.widthOfScreen(context) * 0.9
              : Responsive.widthOfScreen(context) * 0.7,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: shadoColor,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Text(
                    "Full Name",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xffAF8F6F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: "Your Full Name",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

              const    Text(
                    "Message",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xffAF8F6F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _messageController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: "Your Message",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xffC1BAA1),
                          ),
                          onPressed: () async {
                            final name = _nameController.text.trim();
                            final message = _messageController.text.trim();

                            if (name.isEmpty || message.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in all fields.'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(10),
                                ),
                              );
                              return;
                            }

                            final whatsappMessage = 'Hello, my name is $name and I wanted to say:\n$message';
                            final encodedMessage = Uri.encodeComponent(whatsappMessage);
                            final whatsappUrl = Uri.parse('https://wa.me/201017645365?text=$encodedMessage');

                            if (await canLaunchUrl(whatsappUrl)) {
                              await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
                              
                              _nameController.clear();
                              _messageController.clear();

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Message sent successfully via WhatsApp.'),
                                    backgroundColor: Colors.green,
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(10),
                                  ),
                                );
                              }
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Could not launch WhatsApp.'),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.all(10),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
    );
  }
}
