part of 'widgets.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({Key? key, this.image}) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 3 / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Image.asset(
        image!,
        fit: BoxFit.contain,
      ),
    );
  }
}
