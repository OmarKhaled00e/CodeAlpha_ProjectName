import 'package:flutter/material.dart';
import 'package:x/features/home/domain/entites/bottom_navigation_bar_entitey.dart';
import 'package:x/features/home/presentation/views/widgets/In_active_item.dart';
import 'package:x/features/home/presentation/views/widgets/active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntitey,
  });
  final bool isSelected;
  final BottomNavigationBarEntitey bottomNavigationBarEntitey;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntitey.activeImage,
            text: bottomNavigationBarEntitey.name,
          )
        : InActiveItem(image: bottomNavigationBarEntitey.inActiveImage);
  }
}
