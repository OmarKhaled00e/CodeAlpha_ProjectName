import 'package:x/core/utils/app_images.dart';

class BottomNavigationBarEntitey {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntitey({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntitey> get bottomNavigationBarItems => [
  BottomNavigationBarEntitey(
    activeImage: Assets.imagesVuesaxBoldHome,
    inActiveImage: Assets.imagesVuesaxOutlineHome,
    name: 'الرئسية',
  ),
  BottomNavigationBarEntitey(
    activeImage: Assets.imagesVuesaxBoldProducts,
    inActiveImage: Assets.imagesVuesaxOutlineProducts,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntitey(
    activeImage: Assets.imagesVuesaxBoldShoppingCart,
    inActiveImage: Assets.imagesVuesaxOutlineShoppingCart,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntitey(
    activeImage: Assets.imagesVuesaxBoldUser,
    inActiveImage: Assets.imagesVuesaxOutlineUser,
    name: 'حسابي',
  ),
];
