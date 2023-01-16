import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> numbers = [];
  int counter = 0;

  bool showTitle = false;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClicked() {
    setState(() {
      numbers.add(numbers.length);
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const LargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.toggle_on),
              ),
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var n in numbers) Text('$n'),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LargeTitle extends StatefulWidget {
  const LargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<LargeTitle> createState() => _LargeTitleState();
}

class _LargeTitleState extends State<LargeTitle> {
  @override
  void initState() {
    print('initState!');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose!');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My large Title',
      style: TextStyle(
        fontSize: 40,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
