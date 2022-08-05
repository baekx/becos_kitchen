import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuListHeader extends StatelessWidget {
  const MenuListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: Row(
        children: [
          Expanded(
            child: Container(
              width: 280,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          iconSize: 24),
                      hintText: "今日はなに食べよう？"),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/filter.svg',
                width: 16,
                height: 16,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/sort.svg',
                width: 16,
                height: 16,
              )),
        ],
      ),
    );
  }
}
