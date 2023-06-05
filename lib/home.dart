import 'package:flutter/material.dart';
import 'package:practice/provider.dart';
import 'package:practice/second.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      //consumers listening to the provider
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            value.add();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: SizedBox(
          child: Column(
            children: [
              Text(
                value.numbers.last.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      value.numbers[index].toString(),
                      style: const TextStyle(fontSize: 25),
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ));
                  },
                  child: const Text('Second Screen'))
            ],
          ),
        ),
      ),
    );
  }
}
