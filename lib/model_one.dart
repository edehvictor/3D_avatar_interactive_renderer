import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class ModelOne extends StatelessWidget {
  const ModelOne({
    super.key,
    required this.modelOneController,
    required this.pickerDialog,
  });

  final Flutter3DController modelOneController;
  final Function(
    String title,
    List<String> inputList, [
    String? chosenItem,
  ]) pickerDialog;
  @override
  Widget build(BuildContext context) {
    String? animation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            modelOneController.playAnimation();
          },
          icon: const Icon(Icons.play_arrow),
        ),
        const SizedBox(
          height: 4,
        ),
        IconButton(
          onPressed: () {
            modelOneController.pauseAnimation();
          },
          icon: const Icon(Icons.pause),
        ),
        const SizedBox(
          height: 4,
        ),
        IconButton(
          onPressed: () {
            modelOneController.resetAnimation();
          },
          icon: const Icon(Icons.replay),
        ),
        const SizedBox(
          height: 4,
        ),
        IconButton(
          onPressed: () async {
            List<String> availableAnimations =
                await modelOneController.getAvailableAnimations();

            print(availableAnimations);
            animation = await pickerDialog(
              'Animations',
              availableAnimations,
            );
            modelOneController.playAnimation(animationName: animation);
            ;
          },
          icon: const Icon(Icons.format_list_bulleted_outlined),
        ),
        const SizedBox(
          height: 4,
        ),
        const SizedBox(
          height: 4,
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
