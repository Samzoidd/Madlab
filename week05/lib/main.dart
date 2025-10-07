import 'package:flutter/material.dart';

void main() => runApp(const TravelExplorerApp());

class TravelExplorerApp extends StatelessWidget {
  const TravelExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      routes: {'/details': (context) => const DetailsPage()},
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> destinations = [
    {
      'name': 'Paris',
      'desc': 'The city of lights, famous for Eiffel Tower & art museums.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Paris_Night.jpg'
    },
    {
      'name': 'Tokyo',
      'desc': 'A vibrant city blending tradition with futuristic technology.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/1/15/Tokyo_Tower_and_around_Skyscrapers.jpg'
    },
    {
      'name': 'New York',
      'desc': 'The city that never sleeps — iconic skyline & culture.',
      'image': 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Manhattan_from_Hudson_River_Park.jpg'
    },
  ];

  int currentIndex = 0;

  void _onSwipe(DragEndDetails details) {
    setState(() {
      if (details.primaryVelocity! < 0) {
        // Swipe left
        currentIndex = (currentIndex + 1) % destinations.length;
      } else if (details.primaryVelocity! > 0) {
        // Swipe right
        currentIndex = (currentIndex - 1 + destinations.length) % destinations.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final destination = destinations[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Travel Explorer"), centerTitle: true),
      body: GestureDetector(
        onHorizontalDragEnd: _onSwipe,
        onDoubleTap: () {
          Navigator.pushNamed(context, '/details', arguments: destination);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: destination['name']!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(destination['image']!, height: 250, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 20),
              Text(destination['name']!, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(destination['desc']!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 40),
              const Text(
                "➡ Swipe left/right to explore\n👆 Double-tap for details",
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final destination = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text(destination['name']!)),
      body: Column(
        children: [
          Hero(
            tag: destination['name']!,
            child: Image.network(destination['image']!, height: 300, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              destination['desc']!,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}
