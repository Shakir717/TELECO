import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:telfoni/constants/colors_data.dart';



class CarouselCustomWidget extends StatefulWidget {
  final List<Widget> widgets;
  final double aspectRatio;

  const CarouselCustomWidget({Key? key, required this.widgets,this.aspectRatio=2.6}) : super(key: key);

  @override
  _CarouselCustomWidgetState createState() => _CarouselCustomWidgetState();
}

class _CarouselCustomWidgetState extends State<CarouselCustomWidget> {

  int currentIndex=0;

  @override
  void initState() {
    setState(() {
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "image",
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: widget.aspectRatio,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex=index;
                });
              },
            ),
            items: widget.widgets,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.widgets.map((url) {
              int index = widget.widgets.indexOf(url);
              return AnimatedContainer(
                width:currentIndex==index? 8: 8.0,
                height:currentIndex==index? 8:8.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:currentIndex==index?kLightBlueOpacity08:kDarkBlue),
                duration: const Duration(milliseconds: 500),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}


class CarouselWidget extends StatefulWidget {
  final List images;

  CarouselWidget({Key? key, required this.images}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String imageUrl = widget.images[_currentIndex];
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HeroPhotoViewRouteWrapper(
        //       image: imageUrl,
        //     ),
        //   ),
        // );
      },
      child: Column(
        children: [
          Hero(
            tag: "image",
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.2,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                viewportFraction: .6,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.images
                  .map((item) => Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(item, fit: BoxFit.cover,)),
                ],
              ))
                  .toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.map((url) {
                int index = widget.images.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                      Colors.brown),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  HeroPhotoViewRouteWrapper({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
              color:Colors.white
          ),
          automaticallyImplyLeading: true
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: NetworkImage(image),
          minScale: 0.0,
          heroAttributes: const PhotoViewHeroAttributes(tag: "image"),
        ),
      ),
    );
  }
}
