import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/utils/redux/redux_bundle.dart';
import 'package:flireator/utils/redux/store_operation.dart';
import 'package:flireator/widgets/app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() {
  // Create the rdt middleware that connects to the rdt server.
  final _rdtMiddleware = RemoteDevToolsMiddleware<AppState>('localhost:8000');

  // Create an operation for the redux bundle to run on the store.
  // In this case, we give RemoteDevToolsMiddleware access to the store then
  // tell it to connect to the server.
  final _rdtOperation = StoreOperation((store) async {
    _rdtMiddleware.store = store;
    await _rdtMiddleware.connect();
  });

  // Setting the auth emulator must be done after Firebase has been initialized
  final _authEmulatorOperation = StoreOperation((store) async {
    await FirebaseAuth.instance.useEmulator('http://localhost:9099');
  });

  // Setup the redux bundle to use a different bucket and with an extra
  // middleware that sends each action and state to the rdt server for display.
  ReduxBundle.setup(
      bucketName: 'gs://profile-pics-prototyping',
      extraMiddlewares: [_rdtMiddleware],
      storeOperations: [_rdtOperation, _authEmulatorOperation],
      firestoreSettings: Settings(
          host: 'localhost:8080',
          sslEnabled: false,
          persistenceEnabled: false));

  runApp(AppWidget());
}
