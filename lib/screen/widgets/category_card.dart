part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, this.image, this.title}) : super(key: key);
  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40,
            child: Image.asset(
              image!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                title!,
                style: buttonTextStyle.copyWith(color: Colors.black),
                maxLines: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
