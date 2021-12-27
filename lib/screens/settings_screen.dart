import 'package:color_flood/assets/constants.dart';
import 'package:color_flood/models/game_data.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:color_flood/components/setting_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.black12),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        title: const Text(
          'SETTINGS',
          style: TextStyle(color: kTextColor),
        ),
      ),
      backgroundColor: kMainColor,
      body: Center(
        child: Consumer<GameData>(
          builder: (context, brain, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SettingItem(
                name: 'Sound',
                value: brain.isSoundOn,
                onChanged: () {
                  brain.toggleSound();
                },
              ),
              const SizedBox(
                height: 25,
              ),
              SettingItem(
                name: 'Haptic',
                value: brain.isHapticOn,
                onChanged: () {
                  brain.toggleHaptic();
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
