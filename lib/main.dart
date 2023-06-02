import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initializing the stream controller
  StreamController<String> streamController = StreamController();

  // Initializing the text editing controller
  TextEditingController textEntered = TextEditingController();

  // making the Init state and initializing as BroadCastStream
  // Returns a multi-subscription stream that produces the same events as this.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stream Concept Understand '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Padding(padding: EdgeInsets.all(50)),

              const Text(
                'The Text in the Input Feild :->',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              // It is Initializing the Streambuilder to use the stream controller

              StreamBuilder<String>(
                  stream: streamController.stream, // value captured
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text(
                        'NO Data',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      );
                    } else {
                      return Text(
                        snapshot.data ?? 'NUll Value...',
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      );
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: textEntered,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  streamController.add(textEntered.text);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
