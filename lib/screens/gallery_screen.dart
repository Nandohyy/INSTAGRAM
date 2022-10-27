import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  OverlayEntry _popupDialog;
  List<String> imageUrls = [
    'https://instagram.fsrg6-1.fna.fbcdn.net/v/t51.2885-19/277755496_157034656703702_1081714265984809469_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fsrg6-1.fna.fbcdn.net&_nc_cat=102&_nc_ohc=5VXwLUQhKm4AX9zOy2z&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfCmoQ4vjA161X5WVQpzHmnspOXk-SiFS2dASXfSGDn-Ag&oe=63601272&_nc_sid=8fd12b',
    'http://store-images.microsoft.com/image/apps.59682.9007199266251377.11eabd37-a0d4-4a98-a6dc-6cd4ec6a02e3.33ff95a5-12b9-4036-9843-957c1b44cdd8',
    'https://pyxis.nymag.com/v1/imgs/d6a/dc7/4a5001b7beea096457f480c8808572428b-09-roll-safe.2x.h473.w710.jpg',
    'https://awsimages.detik.net.id/community/media/visual/2022/08/09/anime-aesthetic-1.jpeg?w=533',
    'https://pict.sindonews.net/dyn/850/pena/news/2022/02/13/700/684669/10-karakter-anime-yang-selalu-menyembunyikan-matanya-jxr.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRThXoJiiiLfHTp9s16SlKb7jSdrbaHWR5bCw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe8usVzcEteNFIFkA_bW4UtGnX3BPwO8qwzQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF-nluleAHkOpwVqcKqSohF6BwI3f8OSwWCg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTV4zEAVnzgkgv_t3d8wvW1NdVziSnTQsbzw&usqp=CAU',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: imageUrls.map(_createGridTileWidget).toList(),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onLongPress: () {
            _popupDialog = _createPopupDialog(url);
            Overlay.of(context).insert(_popupDialog);
          },
          onLongPressEnd: (details) => _popupDialog?.remove(),
          child: Image.network(url, fit: BoxFit.cover),
        ),
      );

  OverlayEntry _createPopupDialog(String url) {
    return OverlayEntry(
      builder: (context) => AnimatedDialog(
        child: _createPopupContent(url),
      ),
    );
  }

  Widget _createPhotoTitle() => Container(
      width: double.infinity,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
         
        ),
      
        ),
      );

  Widget _createActionBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            Icon(
              Icons.chat_bubble_outline_outlined,
              color: Colors.black,
            ),
            Icon(
              Icons.send,
              color: Colors.black,
            ),
          ],
        ),
      );

  Widget _createPopupContent(String url) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _createPhotoTitle(),
              Image.network(url, fit: BoxFit.fitWidth),
              _createActionBar(),
            ],
          ),
        ),
      );
}

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
