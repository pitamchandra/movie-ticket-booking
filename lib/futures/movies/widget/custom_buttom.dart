import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/movies/logic/movies_controller.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({super.key});
  final MoviesController controller = Get.put(MoviesController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(
              () => InkWell(
                onTap: () {
                  controller.switchTab('now');
                },
                child: Container(
                  height: 48,
                  width: 195,
                  decoration: BoxDecoration(
                    color:
                        controller.selectedTab.value == 'now'
                            ? Colors.amber
                            : Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'now_playing'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Obx(
              () => InkWell(
                onTap: () {
                  controller.switchTab('soon');
                },
                child: Container(
                  height: 48,
                  width: 195,
                  decoration: BoxDecoration(
                    color:
                        controller.selectedTab.value == 'soon'
                            ? Colors.amber
                            : Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'coming_Soon'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
