part of '../../main_storybook.dart';

final appbarStory = Story(
  name: 'Widgets/CustomAppbar',
  description: 'Cores disponíveis pra uso',
  builder: (context) => const Scaffold(
    appBar: CustomAppbar(),
    body: SizedBox.shrink(),
  ),
);
