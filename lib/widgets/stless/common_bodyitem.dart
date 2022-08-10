import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';

class BodyItem extends StatelessWidget {
  BodyItem({
    Key? key,
    this.height = 0,
    this.widthImg = 0,
    this.assetName,
    this.radius = 10,
    this.mid,
    required this.right,
    this.child,
    this.onTap,
  }) : super(key: key);

  final double height, widthImg, radius;
  String? assetName;
  Widget? mid, child;
  Widget right;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: widthImg,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(assetName!),
                    ),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: child,
                ),
                SizedBox(
                  height: height,
                  child: mid,
                ),
                Expanded(child: right),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
