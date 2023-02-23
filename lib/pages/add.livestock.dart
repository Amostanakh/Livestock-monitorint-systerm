import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:livestock_sms/controller/authentication.dart';
import 'package:livestock_sms/widgets/inputs.dart';

class AddLiveStock extends GetView<AuthController> {
  const AddLiveStock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Livestock'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/cow2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              TextFormFilds(
                  hintText: "Phone Number", controller: controller.phoneNumber),
              TextFormFilds(
                  hintText: "Tag. No", controller: controller.tagNumber),
              DateTextFormFilds(
                controller: controller.dateOfBirth,
                hintText: "Date of Birth",
              ),
              DateTextFormFilds(
                  hintText: "Date of entry on the Farm",
                  controller: controller.dateofEntryonFarm),
              TextFormFilds(
                  hintText: "Mothers Tag", controller: controller.mothersTag),
              Obx(
                () => Btton(
                  text: controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.black,
                        ))
                      : const Center(
                          child: Text(
                            'Add',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                  onTap: () async {
                    controller.addLiveStockData();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
