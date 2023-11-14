import 'package:flutter/material.dart';
import 'counselorscreen.dart';
import 'supportgroupscreen.dart';
import 'events.dart';
import 'journalscreen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _categories(BuildContext context, {required String name}) {
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(
                color: Colors.blue, fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _bottomContainer(
      {required LinearGradient color,
      required String name,
      required String title,
      required String subtitle,
      required String images}) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 190,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
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
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      image: NetworkImage(images)))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.teal])),
            height: 240,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xfffafbfd),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: const Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Welcome to the",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff0c3469),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "      BMCC",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Color(0xff0c3469),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Wellness Hub",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Color(0xff0c3469),
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                        Container(
                            height: 150,
                            width: 160,
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://bmccprodstroac.blob.core.windows.net/uploads/ported/bmcc-association/images/foundation.jpg')),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ],
                    ),
                  )
                ]),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            _categories(
                              context,
                              name: '   Resources:',
                            ),
                            TextButton(
                              onPressed: () async {
                                var url = Uri.parse(
                                    "https://positivepsychology.com/benefits-of-cbt/");
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                }
                              },
                              child: _categories(
                                context,
                                name: 'Benefits of CBT',
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                var url = Uri.parse(
                                    "https://www.mentalhealth.org.uk/explore-mental-health/publications/how-look-after-your-mental-health-using-mindfulness");
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                }
                              },
                              child: _categories(
                                context,
                                name: 'Mindfulness',
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                var url = Uri.parse(
                                    "https://www.verywellmind.com/dialectical-behavior-therapy-1067402");
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch url';
                                }
                              },
                              child: _categories(
                                context,
                                name: 'Benefits of DBT',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CounselorScreen()));
                        },
                        child: _bottomContainer(
                          color: const LinearGradient(
                              colors: [Colors.blue, Colors.teal]),
                          images:
                              'https://www.thoughtco.com/thmb/CS9cgIjIKIokzCT_EWMj7mX8IdU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/teenager-596316634-5b708a7ec9e77c0025f7e580.jpg',
                          name: "Counseling",
                          title: "Speak to a mental",
                          subtitle: " health counselor",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const JournalScreen()));
                        },
                        child: _bottomContainer(
                          color: const LinearGradient(
                              colors: [Colors.blue, Colors.teal]),
                          images:
                              'https://www.bphope.com/wp-content/uploads/2022/12/journaling-bipolar-disorder-1352005300.jpg',
                          name: "Journaling",
                          title: "Vent your thoughts",
                          subtitle: "and track mood",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GroupScreen()));
                        },
                        child: _bottomContainer(
                          color: const LinearGradient(
                              colors: [Colors.blue, Colors.teal]),
                          images:
                              'https://www.verywellmind.com/thmb/8GRkCUFsNCGGRs2gJ9GdysPTOgQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/diverse-people-sit-in-circle-and-brainstorm-ideas-1163038341-c0805b192d7f42a4b82fbf93b1b97d4e.jpg',
                          name: "Support Groups",
                          title: "Speak with others",
                          subtitle: "and grow together",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventsScreen()));
                        },
                        child: _bottomContainer(
                          color: const LinearGradient(
                              colors: [Colors.blue, Colors.teal]),
                          images:
                              'https://bmccprodstroac.blob.core.windows.net/uploads/2023/10/ASAP-students-outside-calendar.jpg',
                          name: "School Events",
                          title: "Connect with",
                          subtitle: "classmates",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
