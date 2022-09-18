part of 'widgets.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({Key? key, this.slider}) : super(key: key);
  final model.Slider? slider;

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
      child: Image.network(
        slider!.image.toString(),
        fit: BoxFit.contain,
      ),
    );
  }
}
