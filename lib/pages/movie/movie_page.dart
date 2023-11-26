import 'package:movie_task/all_utils.dart';
import 'package:movie_task/pages/movie/components/favoriate_container.dart';
import 'package:movie_task/pages/movie/components/movie_list.dart';

class MoviePage extends StatefulWidget {
  static const String routeName = '/MoviePage';
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie List',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
        actions: const [
          FavoriateContainer(),
        ],
      ),
      body: const MovieList(),
    );
  }
}
