import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class IconScreen extends StatefulWidget {
  const IconScreen({super.key});

  @override
  State<IconScreen> createState() => _IconScreenState();
}

class _IconScreenState extends State<IconScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Package'),
      ),
      body: ListView(
        children: [
          /// AntDesign's Icon
          const Icon(AntDesign.gitlab_fill,color: Colors.orange,),
          /// Bootstrap's Icon
          const Icon(Bootstrap.google),
          /// BoxIcons' Icon
          const Icon(BoxIcons.bxl_apple),
          /// Brand's Logo
          Brand(Brands.apple_logo),
          /// Clarity's Icon
          const Icon(Clarity.map_outline_badged),
          /// EvaIcons' Icon
          const Icon(EvaIcons.clipboard),
          /// Flag's Logo
          Flag(Flags.india),
          /// FontAwesome's Icons
          const Icon(FontAwesome.angular_brand),
          /// HeroIcons' Icon
          const Icon(HeroIcons.printer),
          /// Iconsax's Icon
          const Icon(Iconsax.cake_bold),
          /// IonIcons' Icon
          const Icon(IonIcons.logo_bitcoin),
          /// LineAwesome's Icon
          const Icon(LineAwesome.amazon),
          /// MingCute's Icon
          const Icon(MingCute.knife_line),
          /// OctIcons'Icon
          const Icon(OctIcons.code_of_conduct),
          /// PixelArtIcons' Icon
          const Icon(PixelArtIcons.gif),
          /// TeenyIcons' Icon
          const Icon(TeenyIcons.google_play_store),
          /// ZondIcons' Icon
          const Icon(ZondIcons.shield),
        ],
      ),
    );
  }
}
