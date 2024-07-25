import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const CVPage(),
    );
  }
}

class CVPage extends StatelessWidget {
  final String pdfUrl = 'assets/cv.pdf';
  final String websiteUrl = 'https://cv.vishalbalani.com/';
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Register the view factory
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'pdf-view',
      (int viewId) => html.IFrameElement()
        ..src = pdfUrl
        ..style.border = 'none',
    );

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.indigo.shade900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        size: 80, color: Colors.indigo.shade900),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Vishal Balani',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Software Developer',
                    style: TextStyle(color: Colors.amberAccent, fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  _buildSidebarButton(context, 'Download CV',
                      Icons.file_download, _downloadPDF),
                  SizedBox(height: 20),
                  _buildSidebarButton(context, 'Share CV', Icons.share,
                      () => _shareCV(context)),
                  SizedBox(height: 20),
                  _buildSidebarButton(context, 'Contact', Icons.email,
                      () => _contactMe(context)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                AppBar(
                  title: Text('Vishal Balani - CV'),
                  backgroundColor: Colors.indigo.shade800,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.print),
                      onPressed: _printCV,
                      tooltip: 'Print CV',
                    ),
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () => _showInfo(context),
                      tooltip: 'CV Information',
                    ),
                  ],
                ),
                Expanded(
                  child: HtmlElementView(viewType: 'pdf-view'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarButton(BuildContext context, String label, IconData icon,
      VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: Colors.indigo.shade900),
      label: Text(label, style: TextStyle(color: Colors.indigo.shade900)),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  void _downloadPDF() {
    html.window.open(pdfUrl, 'Download');
  }

  void _shareCV(BuildContext context) {
    Clipboard.setData(ClipboardData(text: websiteUrl));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('CV link copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _contactMe(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email: vishal@example.com'),
              Text('Phone: +1 234 567 8900'),
              Text('LinkedIn: linkedin.com/in/vishalbalani'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _printCV() {
    html.window.print();
  }

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('CV Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Last Updated: July 1, 2023'),
              Text('Version: 2.1'),
              Text('References: Available upon request'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
