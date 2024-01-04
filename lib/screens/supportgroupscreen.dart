import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  Widget _bottomContainer({
    required LinearGradient color,
    required double price,
    required String name,
    required String title,
    required String subtitle,
    required String images,
  }) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 190,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 160,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight, image: NetworkImage(images)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Groups"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                      color: const LinearGradient(
                          colors: [Colors.blue, Colors.teal]),
                      images:
                          'https://www.feelinggoodinstitute.com/public/gallery/140322_08_57_30.webp',
                      price: 100,
                      name: "Managing Anxiety: CBT Group for Anxiety",
                      title: "Counselor: Dr. Peterson",
                      subtitle: "Schedule: Mondays 2-3pm on Zoom",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                      color: const LinearGradient(
                          colors: [Colors.blue, Colors.teal]),
                      images:
                          'https://www.simplypsychology.org/wp-content/uploads/Dialectical-Behavior-Therapy.jpeg',
                      price: 100,
                      name: "MindWise: Thrive at BMCC and Beyond",
                      title: "Counselors: Elliot Rayman, M.A",
                      subtitle: "Schedule: Tuesdays 2-3pm on Zoom",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                      color: const LinearGradient(
                          colors: [Colors.blue, Colors.teal]),
                      images:
                          'https://davisphinneyfoundation.org/wp-content/uploads/2018/05/Womens-Only-Parkinsons-Support-Group-Feature.jpeg',
                      price: 100,
                      name: "Women of Courage",
                      title: "Counselors: Dr. Burger and Dr. Mack",
                      subtitle: "Schedule: Mondays 3:30-4:30 on Zoom",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                      color: const LinearGradient(
                          colors: [Colors.blue, Colors.teal]),
                      images:
                          'https://hopesdoorny.org/wp-content/uploads/2020/01/courage.png',
                      price: 100,
                      name: "Relaciones - Relationships",
                      title:
                          "Counselors: Eglys Santos, M.S.W and Uris Lopez, Counseling intern",
                      subtitle: "Schedule: Fridays 12-1pm on Zoom",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                      color: const LinearGradient(
                          colors: [Colors.blue, Colors.teal]),
                      images:
                          'https://cached.imagescaler.hbpl.co.uk/resize/scaleWidth/952/cached.offlinehbpl.hbpl.co.uk/news/OMP/colourful-people-silhouettes_tcm27-91857.jpg',
                      price: 100,
                      name: "LGBT+Students: Connection and Support",
                      title: "Counselors: Amy Ojerholm and Emily Feely",
                      subtitle: "Schedule: Thursdays 2-3pm on Zoom",
                    ),
                  ),
                  const Text(
                    "Interested?",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          String email = "counselingcenter@bmcc.cuny.edu";
                          String subject = "";
                          String body = "";
                          var emailAddress = Uri.parse(
                              'mailto:$email?subject=$subject&body=$body');
                          if (await canLaunchUrl(emailAddress)) {
                            await launchUrl(emailAddress);
                          }
                          ;
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Email us",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          FlutterPhoneDirectCaller.callNumber("2122208140");
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "Call us",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
