part of 'widgets.dart';

class ShimmerCategory extends StatelessWidget {
  const ShimmerCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.black38,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 3 / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }
}
