import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/Bloc/Notes/notes_bloc.dart';
import 'package:noteapp/Bloc/general/general_bloc.dart';
import 'package:noteapp/Models/NoteModels.dart';
import 'package:noteapp/Overview/Tabbarview.dart';
import 'package:noteapp/Overview/overview.dart';

import 'package:noteapp/routers/router.dart';
import 'package:noteapp/splash.dart';

// void main() {
//   // runApp(const MyApp());
//
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(), // Wrap your app
//     ),
//   );
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelsAdapter());
  await Hive.openBox<NoteModels>('keepNote');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesBloc()),
        BlocProvider(create: (context) => GeneralBloc()),
      ],
      child: MaterialApp(
        title: 'Keep Note - Fraved',
        debugShowCheckedModeBanner: false,
        home: MyStatelessWidget(),
      ),
    );
  }
}
