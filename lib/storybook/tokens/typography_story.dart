part of '../../main_storybook.dart';

final typographyStory = Story(
    name: 'Tokens/Typography',
    description: 'Estilos de texto disponíveis',
    builder: (context) {
      final textTheme = Theme.of(context).textTheme;
      return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          color: context.knobs.options(
            label: 'Background Colors',
            initial: CustomColors.white,
            options: CustomColors.palette.keys
                .map(
                  (key) => Option(label: key, value: CustomColors.palette[key]),
                )
                .toList(),
          ),
          child: Text(
            context.knobs.text(
              label: 'Try out',
              initial: 'Typography',
            ),
            style: context.knobs.options(
              label: 'Typography',
              initial: textTheme.headlineLarge,
              options: [
                Option(label: 'H1', value: textTheme.headlineLarge),
                Option(label: 'H2', value: textTheme.headlineMedium),
                Option(label: 'H3', value: textTheme.headlineSmall),
              ],
            ),
          ),
        ),
      );
    });
