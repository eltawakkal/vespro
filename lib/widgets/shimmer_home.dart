import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(seconds: 3), //Default value
      interval: Duration(seconds: 0), //Default value: Duration(seconds: 0)
      color: Colors.black87, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: ShimmerDirection.fromLTRB(),
      child: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
          bottom: MediaQuery.of(context).viewPadding.top,
        ),
        child: Column(
          children: [
            loadingContainer(
                height: 200,
                width: double.infinity,
                borderRadius: 0
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: loadingContainer(
                      height: 100,
                      width: 100,
                      borderRadius: 10,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: loadingContainer(
                      height: 100,
                      width: 100,
                      borderRadius: 10,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
              ],
            ),
            SizedBox(height: 20,),
            loadingContainer(
                height: 20,
                width: 100,
                borderRadius: 10
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 10,),
                Expanded(
                  child: loadingContainer(
                    height: 200,
                    width: 100,
                    borderRadius: 10,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: loadingContainer(
                    height: 200,
                    width: 100,
                    borderRadius: 10,
                  ),
                ),
                SizedBox(width: 10,),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget loadingContainer({
    double? width,
    double? height,
    double? borderRadius,
  }) => Container(
    width: width ?? 100,
    height: height ?? 100,
    decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
    ),
  );

}
