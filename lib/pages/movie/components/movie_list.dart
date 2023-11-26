import 'package:movie_task/all_utils.dart';
import 'package:movie_task/pages/movie/components/movie_card.dart';
import 'package:movie_task/utils/web_services/web_services.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: WebServices.apiRequest(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final data = snapshot.data ?? {};
            if (data.isEmpty) return const Text('Data Not Found');
            List<dynamic> movieList = data['results'] ?? [];
            if (movieList.isEmpty) {
              return const Text('not data found');
            }
            final movieModel =
                movieList.map((e) => MovieModel.fromJson(e)).toList();
            return ListView.builder(
              itemCount: movieModel.length,
              itemBuilder: (context, index) {
                final movie = movieModel[index];
                return MovieCard(movie: movie);
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Something is Wrong');
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
