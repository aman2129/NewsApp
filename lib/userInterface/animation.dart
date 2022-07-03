import 'package:flutter/material.dart';


class HomeAnimation extends StatelessWidget {
  const HomeAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Stack(
        children: [
          Skeleton(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.29,
          ),
          Positioned(
            left: 15.0,
            top: 173,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Skeleton(height: 15, width: 360),
                const SizedBox(
                  height: 11,
                ),
                const Skeleton(height: 15, width: 360),
                const SizedBox(
                  height: 11,
                ),
                const Skeleton(height: 15, width: 180),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  children: const [
                    Skeleton(height: 15, width: 70),
                    SizedBox(
                      width: 12,
                    ),
                    Skeleton(height: 15, width: 70),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, required this.height, required this.width})
      : super(key: key);

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}