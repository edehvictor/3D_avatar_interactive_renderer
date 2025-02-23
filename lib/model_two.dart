import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class ModelTwo extends StatelessWidget {
  const ModelTwo({
    super.key,
    required this.modelTwoController,
    required this.pickerDialog,
  });
  final Flutter3DController modelTwoController;
  final Function(
    String title,
    List<String> inputList, [
    String? chosenItem,
  ]) pickerDialog;

  @override
  Widget build(BuildContext context) {
    String? chooseAnimationTwo;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            modelTwoController.playAnimation();
          },
          icon: const Icon(Icons.play_arrow),
        ),
        const SizedBox(
          height: 4,
        ),
        IconButton(
          onPressed: () {
            modelTwoController.pauseAnimation();
          },
          icon: const Icon(Icons.pause),
        ),
        const SizedBox(
          height: 4,
        ),
        IconButton(
          onPressed: () {
            modelTwoController.resetAnimation();
          },
          icon: const Icon(Icons.replay),
        ),
        const SizedBox(
          height: 4,
        ),
        IconButton(
          onPressed: () async {
            List<String> availableAnimations =
                await modelTwoController.getAvailableAnimations();

            print(availableAnimations);
            chooseAnimationTwo = await pickerDialog(
                'Animations', availableAnimations, chooseAnimationTwo);
            modelTwoController.playAnimation(animationName: chooseAnimationTwo);
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
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
