import 'package:movie_task/all_utils.dart';

class MovieCard extends StatelessWidget {
  final void Function(BuildContext context) onPressed;
  final Widget icon;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onPressed,
    required this.icon,
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
                  Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () => onPressed(context),
                      icon: icon,
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
