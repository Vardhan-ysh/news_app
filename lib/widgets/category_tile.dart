import 'package:flutter/material.dart';
import 'package:news_app/screens/landing_page.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.categoryName,
    required this.image,
  }) : super(key: key);

  final String categoryName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      shadowColor: const Color.fromARGB(255, 255, 255, 255),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LandingPage(category: categoryName);
          }));
        },
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 170,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.7),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 34),
                child: Text(
                  categoryName,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
