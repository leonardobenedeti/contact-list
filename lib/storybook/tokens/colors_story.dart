part of '../../main_storybook.dart';

final colorsStory = Story(
  name: 'Tokens/Colors',
  description: 'Cores disponíveis pra uso',
  builder: (context) => Center(
    child: Container(
      height: 200,
      width: 300,
      color: context.knobs.options(
        label: ' Colors',
        initial: CustomColors.bluePrimary,
        options: CustomColors.palette.keys
            .map(
              (key) => Option(label: key, value: CustomColors.palette[key]),
            )
            .toList(),
      ),
    ),
  ),
);
