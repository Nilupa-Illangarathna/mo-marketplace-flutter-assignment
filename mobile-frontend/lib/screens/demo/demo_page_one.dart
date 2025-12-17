import 'package:flutter/material.dart';
import '../../core/utils/api_caller.dart';
import '../../core/theme/theme_controller.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String responseText = 'Loading...';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final res = await apiCaller.get('/');
    setState(() {
      responseText = res?['status'] ?? 'API error';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: ThemeController.toggleTheme,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(responseText, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              child: const Text('Go to Page Two'),
            ),
          ],
        ),
      ),
    );
  }
}
