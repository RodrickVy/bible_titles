import 'package:bibletiles/domain/models/structures/list.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/heading.dart';

import 'package:bibletiles/play_setup/interface/play.game.view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SetupCategories<T extends PlayGameViewModel> extends AView<T> {
  const SetupCategories({super.key});

  static final queryController = TextEditingController();

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
          () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          TextView(
            text: "Select 5 categories or auto-generate them: ${controller.selectedCategories.length}/5",
            type: HeadingType.displaySmall,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              ...controller.selectedCategories.map2((value, index) {
                return SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(value.image),
                        backgroundColor: Colors.yellow,
                      ),
                      TextView(
                        text: value.name,
                        type: HeadingType.overline,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              })
            ],
          ),
          Container(
            width: adapt(phone: 200, tablet: 300, desktop: 420),
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: queryController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Search category",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(Icons.search),
                  )),
              onChanged: (String value) {
                controller.searchCategories(value);
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: SizedBox(
                width: adapt(phone: 200, tablet: 300, desktop: 450),
                child: ListView(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    CategoriesSelector<T>(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          if (controller.selectedCategories.length == controller.categoryLimit)
            OutlinedButton(
              onPressed: () {
                controller.nextStage();
              },
              child: const TextView(
                text: "Continue",
              ),
            ),
          if (controller.selectedCategories.length < controller.categoryLimit)
            OutlinedButton.icon(
              onPressed: () {
                controller.autoSelectCategories();
              },
              label: const TextView(
                text: "Auto-select categories",
              ),
              icon: const Icon(Icons.auto_fix_high),
            ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
              onPressed: () {
                controller.previousStage();
              },
              child: const TextView(
                text: "Back",
              )),
          const Spacer(),
        ],
      ),
    );
  }
}


class CategoriesSelector<T extends PlayGameViewModel> extends AView<T> {
  static final RxInt _showMoreIndex = 75.obs;

  const CategoriesSelector({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
          () => Column(
        children: [
          ...controller.availableCategories.map2((category, index) {
            return Obx(
                  () => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextView(
                      text: category.name,
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        if (_showMoreIndex.value == index) {
                          _showMoreIndex(34399);
                        } else {
                          _showMoreIndex(index);
                        }
                      },
                      icon: Icon(_showMoreIndex.value == index ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)),

                  // CircleAvatar(radius: 15, backgroundImage: AssetImage(category.image)),
                  subtitle: _showMoreIndex.value == index
                      ? TextView(
                    text: category.description,
                  )
                      : null,
                  selected: controller.selectedCategories.contains(category),
                  selectedTileColor: Colors.yellow,
                  // shape: controller.selectedCategories.contains(category)
                  //     ? RoundedRectangleBorder(side: BorderSide(width: 1.0, color: Theme.of(context).colorScheme.primary))
                  //     : const Border.fromBorderSide(BorderSide.none),
                  onTap: () {
                    controller.selectCategory(category);
                  },
                  leading: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: controller.selectedCategories.contains(category)
                        ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.check_box),
                    )
                        : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.check_box_outline_blank),
                    ),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}