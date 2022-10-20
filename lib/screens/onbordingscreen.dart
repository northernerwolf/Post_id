import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:post_id/models/conttent_models.dart';
import 'package:post_id/screens/loginscreen.dart';

class OnebordingScreen extends StatefulWidget {
  const OnebordingScreen({Key? key}) : super(key: key);

  @override
  State<OnebordingScreen> createState() => _OnebordingScreenState();
}

class _OnebordingScreenState extends State<OnebordingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Container(
                            child: Image.asset(
                          contents[i].iamge,
                          width: 400.0,
                          height: 300.0,
                        )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 23,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => builtDec(index, context)),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: FlatButton(
                child: const Text('Get Started'),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  }
                  _controller.nextPage(
                      duration: Duration(microseconds: 100),
                      curve: Curves.bounceIn);
                },
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container builtDec(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? Colors.white : Colors.grey),
    );
  }
}
