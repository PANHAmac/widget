import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1),
          brightness: Brightness.light,
        ),
      ),
      home: const FlutterWidgetsDashboard(),
    );
  }
}

class FlutterWidgetsDashboard extends StatefulWidget {
  const FlutterWidgetsDashboard({super.key});

  @override
  State<FlutterWidgetsDashboard> createState() =>
      _FlutterWidgetsDashboardState();
}

class _FlutterWidgetsDashboardState extends State<FlutterWidgetsDashboard> {
  bool _isCheckboxChecked = true;
  bool _isSwitchOn = true;
  double _sliderValue = 0.7;
  final TextEditingController _textController = TextEditingController(
    text: 'Hello Flutter',
  );

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              const Text(
                '10 Flutter Widgets',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D47A1),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Widget name · category ·',
                style: TextStyle(fontSize: 12, color: Colors.blue[600]),
              ),
              const SizedBox(height: 24),

              // 2-Column Grid for Widgets
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  // 1. Text
                  _buildWidgetCard(
                    '1',
                    'Text',
                    'Basic / Text-info',
                    const Center(
                      child: Text(
                        'Hello, Flutter!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // 2. Icon
                  _buildWidgetCard(
                    '2',
                    'Icon',
                    'Basic / Visual',
                    const Center(
                      child: Icon(
                        Icons.layers_outlined,
                        size: 48,
                        color: Color(0xFF0D47A1),
                      ),
                    ),
                  ),
                  // 3. ElevatedButton
                  _buildWidgetCard(
                    '3',
                    'ElevatedButton',
                    'Input / Action',
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.touch_app, size: 18),
                        label: const Text('Tap me'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D47A1),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // 4. TextField
                  _buildWidgetCard(
                    '4',
                    'TextField',
                    'Input / Form',
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 5. Checkbox
                  _buildWidgetCard(
                    '5',
                    'Checkbox',
                    'Input / Toggle',
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: _isCheckboxChecked,
                            onChanged: (val) => setState(
                              () => _isCheckboxChecked = val ?? false,
                            ),
                          ),
                          const Text('Checked'),
                        ],
                      ),
                    ),
                  ),
                  // 6. Switch
                  _buildWidgetCard(
                    '6',
                    'Switch',
                    'Input / Toggle',
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Switch(
                            value: _isSwitchOn,
                            onChanged: (val) =>
                                setState(() => _isSwitchOn = val),
                          ),
                          const SizedBox(width: 8),
                          Text(_isSwitchOn ? 'On' : 'Off'),
                        ],
                      ),
                    ),
                  ),
                  // 7. Slider
                  _buildWidgetCard(
                    '7',
                    'Slider',
                    'Input / Range',
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: Slider(
                          value: _sliderValue,
                          onChanged: (val) =>
                              setState(() => _sliderValue = val),
                        ),
                      ),
                    ),
                  ),
                  // 8. Card
                  _buildWidgetCard(
                    '8',
                    'Card',
                    'Layout / Surface',
                    const Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          child: Text('Card content'),
                        ),
                      ),
                    ),
                  ),
                  // 9. ListTile
                  _buildWidgetCard(
                    '9',
                    'ListTile',
                    'Layout / Unit',
                    const Center(
                      child: Card(
                        elevation: 0,
                        color: Colors.white,
                        child: ListTile(
                          leading: Icon(Icons.person_outline),
                          title: Text(
                            'HENRY',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Flutter developer',
                            style: TextStyle(fontSize: 12),
                          ),
                          dense: true,
                        ),
                      ),
                    ),
                  ),
                  // 10. CircleAvatar
                  _buildWidgetCard(
                    '10',
                    'CircleAvatar',
                    'Basic / Identity',
                    const Center(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFF0D47A1),
                        child: Text(
                          'DS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper template to generate the structured wrapper frame for each element
  Widget _buildWidgetCard(
    String number,
    String title,
    String category,
    Widget previewWidget,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[400],
                ),
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    category,
                    style: TextStyle(fontSize: 9, color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
          Expanded(child: previewWidget),
        ],
      ),
    );
  }
}
