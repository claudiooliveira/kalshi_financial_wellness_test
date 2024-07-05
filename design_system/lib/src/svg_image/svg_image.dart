import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';

class SvgImage extends StatelessWidget {
  const SvgImage.network(
    this.url, {
    Key? key,
    this.width,
    this.height,
  })  : assetName = null,
        package = null,
        file = null,
        super(key: key);

  const SvgImage.asset(
    this.assetName, {
    Key? key,
    this.package,
    this.width,
    this.height,
  })  : url = null,
        file = null,
        super(key: key);

  const SvgImage.file(
    this.file, {
    Key? key,
    this.package,
  })  : url = null,
        assetName = null,
        width = null,
        height = null,
        super(key: key);

  final String? url;
  final String? assetName;
  final File? file;
  final String? package;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if ((url?.isNotEmpty ?? false) && Uri.parse(url!).isAbsolute) {
      return SvgPicture.network(
        url!,
        width: width,
        height: height,
        placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(16),
          child: const CircularProgressIndicator(),
        ),
      );
    }

    if ((assetName?.isNotEmpty ?? false)) {
      return SvgPicture.asset(
        _assetName,
        width: width,
        height: height,
      );
    }

    if (file != null) {
      return SvgPicture.file(file!);
    }

    return const SizedBox();
  }

  String get _assetName {
    return package != null ? 'packages/$package/$assetName' : assetName!;
  }
}
