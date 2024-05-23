import 'dart:ui';

import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with WidgetsBindingObserver {
  AppLifecycleState? appLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(
        this); //? Dasturimizga ko'zatuvchi (Observer) qo'shmoqdamiz
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    appLifecycleState = state;
    setState(() {});
    print(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.amber,
            title: const Text("App Bar"),
          ),
          Expanded(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX:
                    appLifecycleState == AppLifecycleState.inactive ? 10 : 0,
                sigmaY:
                    appLifecycleState == AppLifecycleState.inactive ? 10 : 0,
              ),
              child: Center(
                child: appLifecycleState == AppLifecycleState.inactive
                    ? Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Telegram_2019_Logo.svg/2048px-Telegram_2019_Logo.svg.png",
                        width: 200,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
