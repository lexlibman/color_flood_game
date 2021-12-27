import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:color_flood/assets/constants.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    required this.name,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final String name;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: kNeumorphicStyle,
      child: SizedBox(
        height: 50,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25, color: kTextColor),
              ),
              NeumorphicSwitch(
                value: value,
                isEnabled: true,
                onChanged: (value) {
                  onChanged();
                },
                style: const NeumorphicSwitchStyle(
                    activeThumbColor: kMainColor,
                    inactiveThumbColor: kMainColor),
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
