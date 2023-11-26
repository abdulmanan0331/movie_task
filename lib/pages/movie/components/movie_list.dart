import 'package:movie_task/all_utils.dart';
import 'package:movie_task/pages/movie/components/movie_card.dart';
import 'package:movie_task/utils/web_services/web_services.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>?>(
      future: WebServices.apiRequest(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final movieList = snapshot.data ?? [];
            if (movieList.isEmpty) {
              return const Text('not data found');
            }
            return ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                final movie = movieList[index];
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
