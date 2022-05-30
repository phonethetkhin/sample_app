import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/view/screens/home_screen.dart';
import 'package:sample_app/view/screens/posts_screen.dart';
import 'package:sample_app/viewmodel/user_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
    initialRoute: HomeScreen.routeName,
    routes: {
      HomeScreen.routeName: (_) => const HomeScreen(),
      PostsScreen.routeName: (_) =>  PostsScreen(),

    },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           const Center(child: const Text('Hello World'))
          ],
        ),
      ),
    );
  }
}
