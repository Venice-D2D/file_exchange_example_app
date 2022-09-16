import 'package:file_exchange_example_app/channelTypes/bootstrap_channel_type.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File exchange example app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BootstrapChannelType _bootstrapChannelType = BootstrapChannelType.qrCode;

  void _setBootstrapChannelType(BootstrapChannelType type) {
    setState(() {
      _bootstrapChannelType = type;
    });
  }

  void _startFileExchange() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'Select bootstrap channel:',
              ),
            ),
            ListTile(
              title: const Text('QR code'),
              onTap: () => _setBootstrapChannelType(BootstrapChannelType.qrCode),
              trailing: Checkbox(
                  value: _bootstrapChannelType == BootstrapChannelType.qrCode,
                  onChanged: (v) => _setBootstrapChannelType(BootstrapChannelType.qrCode)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startFileExchange,
        tooltip: 'Start file exchange',
        backgroundColor: Colors.green,
        child: const Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
