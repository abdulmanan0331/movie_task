import 'package:movie_task/all_utils.dart';

class FavoriatePage extends StatelessWidget {
  static const String routeName = '/FavoriatePage';

  const FavoriatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.favoriteItems.isEmpty) {
            return const Center(
              child: Text('No item'),
            );
          }
          return ListView.builder(
            itemCount: provider.favoriteItems.length,
            itemBuilder: (context, index) {
              final movie = provider.favoriteItems[index];

              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        visualDensity: const VisualDensity(horizontal: -4),
                        contentPadding: EdgeInsets.zero,
                        leading: CachedNetworkImage(
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 64 /
                                2, // Set the radius of the CircleAvatar based on size
                          ),
                          imageUrl:
                              'https://i0.wp.com/fanversation.com/wp-content/uploads/2021/10/MHA_WHM_Concept_KeyArt_TrailerPoster.jpeg?resize=1024%2C576&ssl=1',
                          width: 60,
                          height: 90,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        title: Text(
                          provider.favoriteItems[index].title,
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            provider.removeFromFavorites(movie);
                            EasyLoading.showInfo('Remove Successfully');
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
