import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x/core/utils/app_text_styles.dart';


// class SocialLoginButton extends StatelessWidget {
//   const SocialLoginButton({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.onPressed,
//   });
//   final String image;
//   final String title;
//   final VoidCallback onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 56,
//       child: TextButton(
//         style: TextButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             side: BorderSide(color: Color(0xFFDCDEDE), width: 1),
//             borderRadius: BorderRadiusGeometry.circular(16),
//           ),
//         ),
//         onPressed: onPressed,
//         child: ListTile(
//           visualDensity: VisualDensity(
//             vertical: VisualDensity.maximumDensity,
//           ),
//           leading: SvgPicture.asset(image),
//           title: Text(
//             title,
            
//             style: TextStyles.semiBold16,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }



class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
  });

  final String image;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFDCDEDE), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(image, width: 24, height: 24),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyles.semiBold16,
                ),
              ),
            ),
            const SizedBox(width: 24), // لحجز مساحة مساوية لصورة اليسار
          ],
        ),
      ),
    );
  }
}
