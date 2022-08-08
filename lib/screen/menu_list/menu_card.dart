import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/component/menu_tag.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/screen/menu_detail/menu_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.menu,
  }) : super(key: key);
  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => MenuDetailPage(menu: menu),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 画像
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: SizedBox(
                    width: size.width / 2,
                    height: size.width / 2,
                    child: Image.network(
                      menu.image,
                      fit: BoxFit.cover,
                      errorBuilder: (c, o, s) {
                        return const Image(
                            image: AssetImage("assets/images/noImage.png"),
                            fit: BoxFit.cover);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
                      itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(starYellow),
                          ),
                      itemCount: 5,
                      itemSize: 16.0,
                      initialRating: menu.rate.toDouble(),
                      ignoreGestures: true,
                      onRatingUpdate: (_) {}),
                )
              ],
            ),
            // メニュータグ
            Container(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 4.0,
                children: menu.tag.map((tag) => MenuTag(label: tag)).toList(),
              ),
            ),
            // タイトル
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                menu.name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
