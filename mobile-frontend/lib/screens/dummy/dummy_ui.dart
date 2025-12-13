import 'package:flutter/material.dart';

  class DummyPage extends StatelessWidget {
  final String title;

  const DummyPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final bool isBottom = Navigator.canPop(context); // This make sure UI stack has At least one more rendered page bottom
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$title\n\nUnder construction',
              textAlign: TextAlign.center,
            ),
            if (isBottom)? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Go back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
