part of 'widgets.dart';

class ShimmerCampaign extends StatelessWidget {
  const ShimmerCampaign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.black38,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }
}
