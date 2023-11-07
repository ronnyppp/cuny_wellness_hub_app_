import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CounselorScreen extends StatelessWidget {
  const CounselorScreen({super.key});

  Widget _bottomContainer({
    required LinearGradient color,
    required double price,
    required String name,
    required String title,
    required String subtitle,
    required String images,
    required TextButton call,
  }) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        gradient: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 190,
            padding: const EdgeInsets.only(left: 20, top: 20),
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
                    call,
                  ],
                )
              ],
            ),
          ),
          Container(
              height: 160,
              width: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight, image: NetworkImage(images)),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Counselors"),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CounselorScreen()));
                    },
                    child: _bottomContainer(
                        color: const LinearGradient(
                            colors: [Colors.blue, Colors.teal]),
                        images:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRePCWMA--Vz1Kn3u7ERCo-0o-ftL0TJydoxw&usqp=CAU',
                        price: 100,
                        name: "Sarah Patel",
                        title: "Phone Number: 347-295-4964",
                        subtitle: "Email: szhar@bmcc.cuny.edu",
                        call: TextButton(
                          onPressed: () async {
                            FlutterPhoneDirectCaller.callNumber(
                                "tel:3472954964");
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Call me",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                        color: const LinearGradient(
                            colors: [Colors.blue, Colors.teal]),
                        images:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBAxwq7QRdSO3rmF_yTwuR7yC_TG-vTxxNHw&usqp=CAU',
                        price: 100,
                        name: "Alex Johnson",
                        title: "Phone Number: 617-324-9382",
                        subtitle: "Email: ajohn@bmcc.cuny.edu",
                        call: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Call me",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: _bottomContainer(
                        color: const LinearGradient(
                            colors: [Colors.blue, Colors.teal]),
                        images:
                            'https://i0.wp.com/www.torontophotographerz.com/wp-content/uploads/2017/06/Linkedin-portraits-2.jpg?fit=800%2C1200&ssl=1',
                        price: 100,
                        name: "Sarah McDermott",
                        title: "Phone Number: 218-864-2853",
                        subtitle: "Email: smcdermott@bmcc.cuny.edu",
                        call: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Call me",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
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
