import 'package:becos_kitchen/common/material_color.dart';
import 'package:becos_kitchen/component/menu_tag.dart';
import 'package:becos_kitchen/model/menu_model.dart';
import 'package:becos_kitchen/screen/common/row_padding.dart';
import 'package:becos_kitchen/view_model/menu_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({Key? key, required this.menu}) : super(key: key);
  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        menuDetailViewModelProvider
            .overrideWithProvider(menuDetailViewModelFamily(menu))
      ],
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              '詳細',
              style: TextStyle(color: Color(textColor)),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset('assets/icons/backArrow.svg'))),
        body: _MenuDetailBody(),
      ),
    );
  }
}

class _MenuDetailBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menu = ref.watch(menuDetailViewModelProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            menu.image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              menu.name,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 16.0,
                children: menu.tag.map((tag) => MenuTag(label: tag)).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _MenuDetailRating(),
                const RowPadding(width: 16.0),
                _MenuDetailRating(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MenuDetailRating extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menu = ref.watch(menuDetailViewModelProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/icon_baek.jpg'),
            ),
          ),
        ),
        RatingBar.builder(
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Color(starYellow),
          ),
          itemCount: 5,
          itemSize: 24,
          initialRating: menu.rate.toDouble(),
          ignoreGestures: true,
          onRatingUpdate: (_) {},
        )
      ],
    );
  }
}
