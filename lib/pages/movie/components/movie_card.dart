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
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius:
                    84 / 2, // Set the radius of the CircleAvatar based on size
              ),
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
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Expanded(
                          flex: 2,
                          child: Text(
                            ' ${movie.releaseDate}',
                            style: GoogleFonts.manrope(
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Text(
                      movie.overview,
                      textAlign: TextAlign.justify,
                      style:
                          GoogleFonts.manrope(fontSize: 12, letterSpacing: 0.3),
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
