import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class IndipeAvatar extends StatelessWidget {
  final Color? bgColor;
  final double radius;
  final double fontSize;
  final String? imageUrl;
  final String? userName;
  final Color alphabetColor;

  const IndipeAvatar({
    super.key,
    this.bgColor,
    this.imageUrl,
    this.userName,
    this.radius = 32,
    this.fontSize = 16,
    this.alphabetColor = Colors.white,
  }) : assert(imageUrl != null || (userName != null && bgColor != null));

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return CircularImageAvatar(
        radius: radius,
        imageUrl: imageUrl!,
      );
    }

    return AlphabetAvatar(
      radius: radius,
      bgColor: bgColor!,
      fontSize: fontSize,
      userName: userName,
      alphabetColor: alphabetColor,
    );
  }
}

class CircularImageAvatar extends StatelessWidget {
  final double radius;
  final String imageUrl;

  const CircularImageAvatar({
    super.key,
    required this.radius,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }
}

class AlphabetAvatar extends StatelessWidget {
  final Color bgColor;
  final double radius;
  final double fontSize;
  final String? userName;
  final Color alphabetColor;

  const AlphabetAvatar({
    super.key,
    required this.radius,
    required this.bgColor,
    required this.fontSize,
    required this.userName,
    required this.alphabetColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: Center(
        child: Text(
          (userName != null && userName!.isNotEmpty)
              ? userName!.characters
                      .firstWhereOrNull(
                        (char) => char.contains(
                          RegExp(r'[A-Za-z]'),
                        ),
                      )
                      ?.toUpperCase() ??
                  ''
              : '',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: radius - (radius / 3),
                color: alphabetColor,
              ),
        ),
      ),
    );
  }
}
