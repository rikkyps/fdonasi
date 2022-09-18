part of 'widgets.dart';

class ShimmerHistory extends StatelessWidget {
  const ShimmerHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.black38,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }
}
