part of '../../main_storybook.dart';

final iconsStory = Story(
  name: 'Tokens/Icons',
  description: 'Ícones disponíveis pra uso',
  builder: (context) => Center(
    child: Container(
      color: context.knobs.options(
        label: 'Background Colors',
        initial: CustomColors.bluePrimary,
        options: CustomColors.palette.keys
            .map(
              (key) => Option(label: key, value: CustomColors.palette[key]),
            )
            .toList(),
      ),
      child: Icon(
        context.knobs.options(
          label: 'Icons',
          initial: Icons.search,
          options: [
            const Option(label: 'Search', value: Icons.search),
            const Option(label: 'Arrow Up', value: Icons.keyboard_arrow_up),
            const Option(label: 'Arrow Down', value: Icons.keyboard_arrow_down),
          ],
        ),
        size:
            context.knobs.slider(label: 'Size', initial: 60, min: 4, max: 100),
        color: context.knobs.options(
          label: 'Icon Colors',
          initial: CustomColors.white,
          options: CustomColors.palette.keys
              .map(
                (key) => Option(label: key, value: CustomColors.palette[key]),
              )
              .toList(),
        ),
      ),
    ),
  ),
);
