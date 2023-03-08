import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gamewheel/%08provider_model/shared_preferences_provider.dart';
import 'package:gamewheel/%08provider_model/theme_provider.dart';
import 'package:gamewheel/generated/l10n.dart';
import 'package:gamewheel/home_page.dart';
import 'package:gamewheel/home_test.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPerferencesLocal _local = SharedPerferencesLocal();
  await _local.initSharePerferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => ThemeProvider(),
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              themeMode: value.mode, debugShowCheckedModeBanner: false,
              locale: value.isVI ? Locale("vi") : Locale("en"),
              theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Colors.blue[600],
                accentColor: Colors.amber[700],
                brightness: Brightness.light,

                backgroundColor: Colors.grey[100],
                //fontFamily: 'Karla',
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Colors.blue[300],
                accentColor: Colors.amber,
                brightness: Brightness.dark,
                backgroundColor: Colors.grey[900],
                // fontFamily: 'Karla',
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              // locale: const Locale('vi'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: const HomePage(),
            );
          },
        ));
  }
}
