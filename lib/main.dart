import 'package:flutter/material.dart';
import 'package:google_bday/widgets/scale_animation.dart';
import 'package:google_bday/widgets/slide_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleBdayScreen(),
    );
  }
}

class GoogleBdayScreen extends StatefulWidget {
  const GoogleBdayScreen({super.key});

  @override
  State<GoogleBdayScreen> createState() => _GoogleBdayScreenState();
}

class _GoogleBdayScreenState extends State<GoogleBdayScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _offsetAnimation1 = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.0, -0.5),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ),
  );

  @override
  void initState() {
    _controller.forward(from: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScaleAnimation(
                  scale: _offsetAnimation1,
                  child: Lottie.asset(
                    'assets/celebration.json',
                    height: 200,
                    width: context.screenWidth,
                  ),
                ),
                ScaleAnimation(
                  scale: _offsetAnimation1,
                  child: const Text(
                    'HAPPY BIRTHDAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ScaleAnimation(
                  scale: _offsetAnimation1,
                  child: Lottie.asset(
                    'assets/cake.json',
                    height: 200,
                    width: context.screenWidth,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideAnimation(
                      position: _offsetAnimation2,
                      child: const Text(
                        'G',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SlideAnimation(
                      position: _offsetAnimation2,
                      child: const Text(
                        'o',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SlideAnimation(
                      position: _offsetAnimation2,
                      child: const Text(
                        'o',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SlideAnimation(
                      position: _offsetAnimation2,
                      child: const Text(
                        'g',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SlideAnimation(
                      position: _offsetAnimation2,
                      child: const Text(
                        'l',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SlideAnimation(
                      position: _offsetAnimation2,
                      child: const Text(
                        'e',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 60,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Lottie.asset(
            'assets/celebration.json',
            height: MediaQuery.of(context).size.height,
            width: context.screenWidth,
          )
        ],
      ),
    );
  }
}
