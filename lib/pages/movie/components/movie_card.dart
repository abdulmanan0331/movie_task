import 'package:movie_task/all_screen.dart';
import 'package:movie_task/all_utils.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://i0.wp.com/fanversation.com/wp-content/uploads/2021/10/MHA_WHM_Concept_KeyArt_TrailerPoster.jpeg?resize=1024%2C576&ssl=1',
              width: 60,
              height: 90,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ' ${movie.releaseDate}',
                          style: GoogleFonts.manrope(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .movieModel
                          .add(const FavoriatePage());
                    },
                    child: Text(
                      'Add a favorite ',
                      style: GoogleFonts.manrope(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
