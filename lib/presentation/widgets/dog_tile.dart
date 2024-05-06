import 'package:dog_ceo_api/presentation/pages/dog_breed_page.dart';
import 'package:flutter/material.dart';

class DogTile extends StatelessWidget {
  final String breed;
  final String image;

  const DogTile({
    super.key,
    required this.breed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DogBreedPage(breed: breed, image: image),
          ),
        );
      },
      child: SizedBox(
          width: size.width * 0.95,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 10, 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Hero(
                  tag: 'hero-$breed',
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 140),
                    width: size.width * 0.95,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.2 - 10, 20, 15, 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // DOG BREED NAME
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 15.0, bottom: 8.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxHeight: 40,
                              ),
                              child: Text(
                                breed,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // DOG IMAGE
                Positioned.fill(
                  left: -18,
                  top: -18,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 140,
                      width: size.width * 0.2,
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
