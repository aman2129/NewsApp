import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:grevity/blocs/internetbloc/internet_bloc.dart';
import 'package:grevity/blocs/newsbloc/news_bloc.dart';
import 'package:grevity/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grevity/screens/home_screen.dart';
import 'package:grevity/services/news_services_api.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.init(directory.path);
  Hive.registerAdapter<ArticleModel>(ArticleModelAdapter());
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc( NewsApiServices()),
        ),

      ],
      child: BlocProvider(
        create: (context) => InternetBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          home : HomeScreen(articleModel : ArticleModel()),
        ),
      ),

    );
  }
}
