import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uran_company_test/models/exhibit.dart';
import 'package:uran_company_test/modules/widgets/shimmer.dart';

class ExhibitItem extends StatelessWidget {
  final Exhibit exhibit;
  const ExhibitItem({required this.exhibit, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemCount: exhibit.images.length,
        itemBuilder: (context, index) {
          final image = exhibit.images[index];
          return _item(image);
        },
      ),
    );
  }

  Widget _item(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            child: _image(image),
          ),
          Container(
            height: 30,
            width: 180,
            color: Colors.black.withOpacity(0.7),
            child: Center(
              child: Text(
                exhibit.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image(String image) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return _error();
      },
      placeholder: (context, url) {
        return const ShimmerPlaceholder();
      },
    );
  }

  Widget _error() {
    return Image.asset("assets/png/exhibit_error.png");
  }
}
