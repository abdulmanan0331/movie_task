import 'package:movie_task/all_utils.dart';
import 'package:movie_task/pages/movie/components/movie_card.dart';
import 'package:movie_task/utils/movie_service/movie_service.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>?>(
      future: MovieServices.apiRequest(),
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
                return Consumer<MovieProvider>(
                  builder: (context, provider, child) {
                    return MovieCard(
                      movie: movie,
                      onPressed: (ct) => _favoriateItem(ct, movie),
                      icon: Icon(
                        provider.favoriteItems.contains(movie)
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    );
                  },
                );
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

  void _favoriateItem(BuildContext context, MovieModel movie) {
    final provider = Provider.of<MovieProvider>(context, listen: false);
    if (provider.favoriteItems.contains(movie)) {
      provider.removeFromFavorites(movie);
      EasyLoading.showInfo('Remove Successfully');
    } else {
      provider.addToFavorites(movie);
      EasyLoading.showInfo('Add favorite Successfully');
    }
  }
}
