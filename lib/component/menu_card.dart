import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 画像
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset("assets/images/chige.png")),
          // メニュータグ
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 4.0,
                children: _menuTagList,
              ),
            ),
          ),
          // タイトル
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "キムチチゲ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RatingBar.builder(
                itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                itemCount: 5,
                itemSize: 20.0,
                initialRating: 3,
                onRatingUpdate: (rating) {}),
          )
        ],
      ),
    );
  }
}

final List<Widget> _menuTagList = [
  _buildChip("さっぱり", Colors.blue),
  _buildChip("こってり", Colors.orange),
  _buildChip("かんたん", Colors.yellow),
];

Widget _buildChip(String label, Color color) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Chip(
        label: Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 8),
        ),
        backgroundColor: color,
        materialTapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // 追加：上下の余計なmarginを削除
        labelPadding:
            EdgeInsets.symmetric(horizontal: 1), // 追加：文字左右の多すぎるpaddingを調整
        visualDensity: VisualDensity(horizontal: 0.0, vertical: -4)),
  );
}
