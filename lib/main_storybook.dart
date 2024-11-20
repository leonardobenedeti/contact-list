import 'package:contact_list/constants/colors.dart';
import 'package:contact_list/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'constants/theme.dart';

part 'storybook/tokens/colors_story.dart';
part 'storybook/tokens/icons_story.dart';
part 'storybook/tokens/typography_story.dart';
part 'storybook/widgets/appbar_story.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Storybook',
      theme: CustomTheme.themeData,
      home: const StoryBook(),
    ),
  );
}

class StoryBook extends StatelessWidget {
  const StoryBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      initialStory: 'Widgets/CustomAppbar',
      plugins: [
        ThemeModePlugin(
          initialTheme: ThemeMode.light,
        ),
        DeviceFramePlugin(initialData: (
          isFrameVisible: true,
          device: Devices.ios.iPhone13,
          orientation: Orientation.portrait,
        )),
      ],
      stories: [
        colorsStory,
        iconsStory,
        typographyStory,
        appbarStory,
      ],
    );
  }
}
