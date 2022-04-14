import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:myapp/tool/%20Bluetooth.dart';
import './widgets/new_glove.dart';
import './widgets/glove_list.dart';
// import './tool/ Bluetooth.dart';

import './model/glove.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finger Dance',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Gloves> _userGloves = [
    Gloves(id: 1231, name: "new shoes", status: 0, type: "piano"),
    Gloves(id: 1232, name: "new gloves", status: 0, type: "piano"),
  ];
  // // Initializing the Bluetooth connection state to be unknown
  // BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  // // Get the instance of the Bluetooth
  // FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  // // Track the Bluetooth connection with the remote device
  // late BluetoothConnection connection;

  // // To track whether the device is still connected to Bluetooth
  // bool get isConnected => connection != null && connection.isConnected;

  // late int _deviceState;

  // @override
  // void initState() {
  //   super.initState();
  //   // Get current state
  //   FlutterBluetoothSerial.instance.state.then((state) {
  //     setState(() {
  //       _bluetoothState = state;
  //     });
  //   });

//     _deviceState = 0; // neutral

//     // If the Bluetooth of the device is not enabled,
//     // then request permission to turn on Bluetooth
//     // as the app starts up
//     enableBluetooth();

//     // Listen for further state changes
//     FlutterBluetoothSerial.instance
//         .onStateChanged()
//         .listen((BluetoothState state) {
//       setState(() {
//         _bluetoothState = state;

//         // For retrieving the paired devices list
//         getPairedDevices();
//       });
//     });
//   }

//   Future<bool> enableBluetooth() async {
//     // Retrieving the current Bluetooth state
//     _bluetoothState = await FlutterBluetoothSerial.instance.state;

//     // If the Bluetooth is off, then turn it on first
//     // and then retrieve the devices that are paired.
//     if (_bluetoothState == BluetoothState.STATE_OFF) {
//       await FlutterBluetoothSerial.instance.requestEnable();
//       await getPairedDevices();
//       return true;
//     } else {
//       await getPairedDevices();
//     }
//     return false;
//   }

//   // main.dart
//   // Inside _BluetoothAppState class

//   // Define a new class member variable
//   // for storing the devices list
//   List<BluetoothDevice> _devicesList = [];

//   Future<void> getPairedDevices() async {
//     List<BluetoothDevice> devices = [];

//     // To get the list of paired devices
//     try {
//       devices = await _bluetooth.getBondedDevices();
//     } on PlatformException {
//       print("Error");
//     }

//     // It is an error to call [setState] unless [mounted] is true.
//     if (!mounted) {
//       return;
//     }

//     // Store the [devices] list in the [_devicesList] for accessing
//     // the list outside this class
//     setState(() {
//       _devicesList = devices;
//     });
//   }

// // Define a member variable to track
// // when the disconnection is in progress
//   bool isDisconnecting = false;

//   @override
//   void dispose() {
//     if (isConnected) {
//       isDisconnecting = true;
//       connection.dispose();
//     }

//     super.dispose();
//   }

//   late BluetoothDevice _device;

//   List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
//     List<DropdownMenuItem<BluetoothDevice>> items = [];
//     if (_devicesList.isEmpty) {
//       items.add(DropdownMenuItem(
//         child: Text('NONE'),
//       ));
//     } else {
//       _devicesList.forEach((device) {
//         items.add(DropdownMenuItem(
//           child: Text(device.name.toString()),
//           value: device,
//         ));
//       });
//     }
//     return items;
//   }

//   void _connect() async {
//     if (_device == null) {
//       print('No device selected');
//     } else {
//       // If a device is selected from the
//       // dropdown, then use it here

//       if (!isConnected) {
//         // Trying to connect to the device using
//         // its address
//         await BluetoothConnection.toAddress(_device.address)
//             .then((_connection) {
//           print('Connected to the device');
//           connection = _connection;

//           // Updating the device connectivity
//           // status to [true]
//           setState(() {
//             var _connected = true;
//           });

//           // This is for tracking when the disconnecting process
//           // is in progress which uses the [isDisconnecting] variable
//           // defined before.
//           // Whenever we make a disconnection call, this [onDone]
//           // method is fired.
//           connection.input?.listen(null).onDone(() {
//             if (isDisconnecting) {
//               print('Disconnecting locally!');
//             } else {
//               print('Disconnected remotely!');
//             }
//             if (this.mounted) {
//               setState(() {});
//             }
//           });
//         }).catchError((error) {
//           print('Cannot connect, exception occurred');
//           print(error);
//         });
//         print('Device connected');
//       }
//     }
//   }

  // Map<String, ScanResult> scanResults = new Map();
  // List allBlueNameAry = [];
  // late BluetoothCharacteristic mCharacteristic;
  // var device;

  void _addNewGlove(String txName, String txType) {
    final newTx = Gloves(
        id: Random.secure().nextInt(10), name: txName, status: 0, type: txType);

    setState(() {
      _userGloves.add(newTx);
    });
  }

  void _startAddNewGloves(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewGlove(_addNewGlove);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finger Dance"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewGloves(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              // child: DropdownButton(
              //   items: _getDeviceItems(),
              //   onChanged: (value) =>
              //       setState(() => _device = value as BluetoothDevice),
              //   value: _devicesList.isNotEmpty ? _device : null,
              // ),
              ),
          // Container(
          //   width: double.infinity,
          //   child: Card(
          //     child: Container(
          //       color: Colors.blue,
          //       width: double.infinity,
          //       child: Text("chart!"),
          //     ),
          //     elevation: 5,
          //   ),
          // ),
          GlovesList(_userGloves)
        ],
      ),
      // floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){

      // },),
    );
  }
}
