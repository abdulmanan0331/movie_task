import 'package:movie_task/all_utils.dart';
import 'package:movie_task/pages/favoriate_page/favoriate.dart';

class FavoriateContainer extends StatelessWidget {
  const FavoriateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, FavoriatePage.routeName);
        },
        icon: const Icon(Icons.favorite),
      ),
    );
  }
}
