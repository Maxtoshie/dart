import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterViewsApp());
}

class FlutterViewsApp extends StatelessWidget {
  const FlutterViewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Views Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const ViewsHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ViewsHome extends StatelessWidget {
  const ViewsHome({super.key});

  // image list
  List<String> get images => List.generate(
        16,
        (i) => 'assets/images/image${i + 1}.jpg',
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter View Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('1️⃣ Row'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: images.take(3).map((path) {
                return Image.asset(path, width: 100, height: 100, fit: BoxFit.cover);
              }).toList(),
            ),

            const SizedBox(height: 20),

            _sectionTitle('2️⃣ Column'),
            Column(
              children: images.take(3).map((path) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Image.asset(path, width: 200, height: 100, fit: BoxFit.cover),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            _sectionTitle('3️⃣ ListView (horizontal)'),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: images.map((path) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(path, width: 120, fit: BoxFit.cover),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            _sectionTitle('4️⃣ GridView'),
            SizedBox(
              height: 300,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: images.take(9).map((path) {
                  return Image.asset(path, fit: BoxFit.cover);
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            _sectionTitle('5️⃣ Stack'),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(images[0], height: 200, width: double.infinity, fit: BoxFit.cover),
                Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(12),
                  child: const Text('Stack Overlay', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _sectionTitle('6️⃣ Wrap'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: images.take(8).map((path) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(path, width: 100, height: 100, fit: BoxFit.cover),
                );
              }).toList(),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
      );
}