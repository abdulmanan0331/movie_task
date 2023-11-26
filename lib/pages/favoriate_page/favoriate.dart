import 'package:movie_task/all_utils.dart';

class FavoriatePage extends StatelessWidget {
  static const String routeName = '/FavoriatePage';

  const FavoriatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FavoriteMoviesScreen',
          style: GoogleFonts.manrope(),
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
                  ListTile(
                    leading: CachedNetworkImage(
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
                    title: Text(provider.favoriteItems[index].title),
                    trailing: IconButton(
                      onPressed: () {
                        provider.removeFromFavorites(movie);
                        EasyLoading.showInfo('Remove item from Favoriate List');
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                  SizedBox(height: 20.h)
                ],
              );
            },
          );
        },
      ),
    );
  }
}
