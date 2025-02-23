import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:mobile_3d_renderer/model_one.dart';
import 'package:mobile_3d_renderer/model_two.dart';

class ModelRender extends StatefulWidget {
  const ModelRender({super.key, required this.title});
  final String title;

  @override
  State<ModelRender> createState() => _ModelRenderState();
}

class _ModelRenderState extends State<ModelRender> {
  Flutter3DController controller1 = Flutter3DController();
  Flutter3DController controller2 = Flutter3DController();
  bool changeModel = false;
  String srcGlb1 = 'assets/images/business_man.glb';
  String srcGlb2 = 'assets/images/business_man.glb';

  @override
  void initState() {
    super.initState();
    controller1.onModelLoaded.addListener(() {
      debugPrint('model is loaded : ${controller1.onModelLoaded.value}');
      if (controller1.onModelLoaded.value) {
        controller1.setCameraOrbit(
          -90,
          90,
          2.0,
        );
      }
    });
    controller2.onModelLoaded.addListener(() {
      debugPrint('model is loaded : ${controller2.onModelLoaded.value}');
      if (controller2.onModelLoaded.value) {
        controller2.setCameraOrbit(
          90,
          90,
          3.0,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ModelOne(
                modelOneController: controller1,
                pickerDialog: showPickerDialog),
          ),
          ModelTwo(
              modelTwoController: controller2, pickerDialog: showPickerDialog)
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 151, 204, 226),
              Color.fromARGB(255, 1, 155, 221),
            ],
            stops: [0.1, 1.0],
            radius: 0.7,
            center: Alignment.center,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Flutter3DViewer(
                activeGestureInterceptor: true,
                progressBarColor: Colors.orange,
                enableTouch: true,
                onProgress: (double progressValue) {
                  debugPrint('model loading progress : $progressValue');
                },
                onLoad: (String modelAddress) {
                  debugPrint('model loaded : $modelAddress');
                  controller1.playAnimation();
                },
                onError: (String error) {
                  debugPrint('model failed to load : $error');
                },
                controller: controller1,
                src: srcGlb1,
              ),
            ),
            Flexible(
              flex: 1,
              child: Flutter3DViewer(
                activeGestureInterceptor: true,
                progressBarColor: Colors.orange,
                enableTouch: true,
                onProgress: (double progressValue) {
                  debugPrint('model loading progress : $progressValue');
                },
                onLoad: (String modelAddress) {
                  debugPrint('model loaded : $modelAddress');
                  controller2.playAnimation();
                },
                onError: (String error) {
                  debugPrint('model failed to load : $error');
                },
                controller: controller2,
                src: srcGlb2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> showPickerDialog(String title, List<String> inputList,
      [String? chosenItem]) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: const Color.fromARGB(255, 68, 67, 67),
      builder: (ctx) {
        return SizedBox(
          height: 250,
          child: inputList.isEmpty
              ? Center(
                  child: Text('$title list is empty'),
                )
              : ListView.separated(
                  itemCount: inputList.length,
                  padding: const EdgeInsets.only(top: 16),
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context, inputList[index]);
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${index + 1}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(inputList[index],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Icon(
                              chosenItem == inputList[index]
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      color: Colors.grey,
                      thickness: 0.6,
                      indent: 10,
                      endIndent: 10,
                    );
                  },
                ),
        );
      },
    );
  }
}
