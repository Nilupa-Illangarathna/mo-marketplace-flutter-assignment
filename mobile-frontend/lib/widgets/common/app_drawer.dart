import 'package:flutter/material.dart';
import '../../screens/dummy/dummy_ui.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              isDark ?
                  'assets/images/drawer_dark_background.jpg'
                  : 'assets/images/drawer_light_background.jpg',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Row(
                    children: [
                      const Text(
                        'MENU',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                // expandable sections
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _expandable(
                        context,
                        title: 'Need Help',
                        children: [
                          _child(context, 'Contact Support'),
                          _child(context, 'Report an Issue'),
                        ],
                      ),
                      _expandable(
                        context,
                        title: 'Policies',
                        children: [
                          _child(context, 'Privacy Policy'),
                          _child(context, 'Terms & Conditions'),
                        ],
                      ),
                      _expandable(
                        context,
                        title: 'Guidelines',
                        children: [
                          _child(context, 'User Guidelines'),
                        ],
                      ),
                      _expandable(
                        context,
                        title: 'Delivery',
                        children: [
                          _child(context, 'Delivery Areas'),
                          _child(context, 'Delivery Charges'),
                        ],
                      ),
                      // not expandable FAQs section
                      ListTile(
                        title: Text('FAQs'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DummyPage(title: 'FAQs'),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: const [
                      Text(
                        'MO',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "That's More like it",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _expandable(
      BuildContext context, {
        required String title,
        required List<Widget> children,
      }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title),
        children: children,
      ),
    );
  }

  Widget _child(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      contentPadding: const EdgeInsets.only(left: 32),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DummyPage(title: title),
          ),
        );
      },
    );
  }

}
