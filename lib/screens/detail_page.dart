import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          backgroundColor: Colors.white,
          iconSize: 30,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.black,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return const Tiles();
          },
        ),
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  const Tiles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircularProfile(
                  outline: 55,
                  size: 60,
                  image: 'assets/images/aku.jpeg',
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Nando.hy',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/images/pet.jpg',
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.comment_outlined,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.send,
                          size: 25,
                        )
                      ],
                    ),
                    const Icon(
                      Icons.bookmark_outline,
                      size: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  '1M Likes',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: const [
                    Text(
                      'Nando.hy',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'MY pet :)',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  '16 Maret 2022',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularProfile extends StatelessWidget {
  const CircularProfile(
      {Key key,
       this.outline,
       this.size,
       this.image})
      : super(key: key);

  final double outline;
  final double size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: outline,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.amber.shade300,
            Colors.purple.shade600,
          ],
        ),
      ),
      child: Container(
        width: size,
        height: size - 10,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: CircleAvatar(
          backgroundImage: AssetImage(
            image,
          ),
          radius: size,
        ),
      ),
    );
  }
}

class required {
}
