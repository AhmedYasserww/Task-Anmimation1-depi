import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
     const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SmartHotelBookingPage(),
    );
  }
}

class SmartHotelBookingPage extends StatefulWidget {
  const SmartHotelBookingPage({super.key});

  @override
  State<SmartHotelBookingPage> createState() => _SmartHotelBookingPageState();
}

class _SmartHotelBookingPageState extends State<SmartHotelBookingPage> {
  bool showReviews = false;
  double price = 1;

  final TextEditingController controller = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  CircleAvatar(radius: 20, child: Icon(Icons.arrow_back)),
                  Spacer(),
                  Text(
                    "Smart Hotel Booking",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  SizedBox(width: 40),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(image:
                        AssetImage("assets/images/Image.png")),
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xff2c3e50), Colors.black],
                        ),
                      ),

                    ),

                    const SizedBox(height: 15),

                    if (showReviews)
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Grand Hyatt Manila",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text("Deluxe King Room"),
                                    Text("Deluxe King Room a to din I Ansor"),
                                  ],
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                  Icon(Icons.star, color: Colors.orange),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(height: 15),

                    /// TAB SWITCH
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffe8eff7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 300),
                            alignment: showReviews
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .42,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color(0xff1e78d6),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showReviews = false;
                                    });
                                  },
                                  child: Text(
                                    "Offers",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: showReviews
                                          ? Colors.grey
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showReviews = true;
                                    });
                                  },
                                  child: Text(
                                    "Guest Reviews",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: showReviews
                                          ? Colors.white
                                          : Colors.grey,
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

                    const SizedBox(height: 20),

                    /// OFFERS / REVIEWS
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: showReviews
                          ? Column(
                        key: const ValueKey(2),
                        children: const [
                          ReviewCard(
                            name: "John D.",
                            review:
                            "Amazing stay, highly recommend the spa!",
                          ),
                          SizedBox(height: 10),
                          ReviewCard(
                            name: "Sarah K.",
                            review: "Great service, room was very clean.",
                          ),
                        ],
                      )
                          : Container(
                        key: const ValueKey(1),
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "20% off this weekend!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Book now and save big on your stay.",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// PRICE RANGE
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price Range",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// PRICE FIELD
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Text("\$"),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (v) {
                                double val = double.tryParse(v) ?? 1;
                                if (val > 10000) val = 10000;

                                setState(() {
                                  price = val;
                                });
                              },
                            ),
                          ),
                          const Icon(Icons.trending_up, color: Colors.blue),
                        ],
                      ),
                    ),

                    Slider(
                      value: price,
                      min: 1,
                      max: 10000,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          price = value;
                          controller.text = value.toInt().toString();
                        });
                      },
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            /// BOOK BUTTON
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  backgroundColor: const Color(0xff1e78d6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text("Book Now", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;

  const ReviewCard({super.key, required this.name, required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.green, size: 18),
                    Icon(Icons.star, color: Colors.green, size: 18),
                    Icon(Icons.star, color: Colors.green, size: 18),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(review),
          ],
        ),
      ),
    );
  }
}