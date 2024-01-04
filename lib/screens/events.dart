import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  Widget _bottomContainer({
    required LinearGradient color,
    required String name,
    required String title,
    required String subtitle,
    required String images,
    TextButton? call,
  }) {
    return Container(
      height: 240,
      width: 700,
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
                    call ??
                        TextButton(
                          onPressed: () {},
                          child: const Text(""),
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
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Events"),
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
                            'https://res.cloudinary.com/devex/image/fetch/https://lh4.googleusercontent.com/VQyrPPyh-FGdV2BJtlcwDphesnxERD6SLWvGtARygLDVNSsXhFF0kzG_yXvLyiARZbKIG3VYF_CIbF4_B-Wy3Eu7kKhHKKR3pq_2ob2pdZgxt_Wz_uqXjRMrhIBKREQnJo--Ui9b',
                        name: "STEM Innovation Challenge",
                        title: "Location: Richard Harrison Terrace",
                        subtitle: "Date: November 4, 2023",
                        call: TextButton(
                          onPressed: () async {
                            var url = Uri.parse(
                                "https://docs.google.com/forms/d/e/1FAIpQLSeDXMAy0caynWM1OzfMozxDq72qasJmjGs6ATEv58p2rcC2Ww/viewform");
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Link",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                      color: const LinearGradient(
                          colors: [Colors.blue, Colors.teal]),
                      images:
                          'https://static.frieze.com/files/styles/frieze_event_image/public/event/main/1694604449998-2d98d43a-f4b7-419d-9a00-d214c54e929e_1.jpg?VersionId=lSwNNVX79wRBIkCXoq4nHuWjEYyP58i_&itok=Hk2EAN2a',
                      name: "Noel W Anderson's "
                          "Black Exhaustion"
                          " Art Exihibit",
                      title: "Location: 81 Barclay St., NYC 10007",
                      subtitle: "Date: September 6 - December 2",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                      color: const LinearGradient(
                          colors: [Colors.blue, Colors.teal]),
                      images:
                          'https://i.ytimg.com/vi/kh1U7X7HXjI/maxresdefault.jpg',
                      name: "Healing Through Hip Hop: Beats and Bars at BMCC",
                      title: "Location: Hudson Room 199 Chambers St., NY",
                      subtitle: "Schedule: November 2 3-5 pm",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                        color: const LinearGradient(
                            colors: [Colors.blue, Colors.teal]),
                        images:
                            'https://bmccprodstroac.blob.core.windows.net/uploads/2019/07/transfer-calendar.jpg',
                        name:
                            "Fall 2023 Evening and Online Virtual Transfer Fair",
                        title: "Location: Zoom",
                        subtitle: "Date: November 2 4-6pm on Zoom",
                        call: TextButton(
                          onPressed: () async {
                            var url = Uri.parse(
                                "https://us04web.zoom.us/j/76597233841?pwd=STNEiMWc4nnoKbw0mhbDv5TEbteB78.1");
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Link",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                      color: const LinearGradient(
                          colors: [Colors.blue, Colors.teal]),
                      images:
                          'https://bmccprodstroac.blob.core.windows.net/uploads/2020/11/mld-event.jpg',
                      name: "Modern Languages Day - Fall 2023",
                      title: "Location: Richard Harris Terrace",
                      subtitle: "Date: November 3 10am-1pm",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
