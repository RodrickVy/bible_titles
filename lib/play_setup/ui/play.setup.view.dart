import 'package:bibletiles/domain/models/adapt.view.dart';
import 'package:bibletiles/domain/models/bible.tiles.player.dart';
import 'package:bibletiles/domain/models/list.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/check.toggle.dart';
import 'package:bibletiles/domain/ui/heading.dart';
import 'package:bibletiles/home/controller/home.controller.dart';
import 'package:bibletiles/home/ui/appbar.view.dart';
import 'package:bibletiles/play_setup/ui/play.setup.view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaySetupPage<T extends PlaySetupViewModel> extends AView<T> {
  const PlaySetupPage({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Scaffold(
      appBar: const BibleTilesAppBar<HomeController>(),
      body: () {
        switch (controller.setupStage) {
          case SetUpStage.categoriesSetup:
            return CategoriesStageSetup<T>();
          case SetUpStage.playersSetup:
            return PlayersStageSetup<T>();
          case SetUpStage.typeSetup:
            return TypeStageSetup<T>();
          case SetUpStage.levelSetup:
            return LevelStageSetup<T>();
        }
      }(),
    );
  }
}

class CategoriesSelector<T extends PlaySetupViewModel> extends AView<T> {
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

class CategoriesStageSetup<T extends PlaySetupViewModel> extends AView<T> {
  const CategoriesStageSetup({super.key});

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

class LevelStageSetup<T extends PlaySetupViewModel> extends AView<T> {
  const LevelStageSetup({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextView(
              text: "How hard?",
              type: HeadingType.displaySmall,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                ...GameLevel.values.map2((val, index) {
                  return CheckToggle(
                      defaultState: controller.level == val,
                      label: val.name,
                      onStateChange: (bool state) {
                        controller.setLevel(index.toDouble());
                      });
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          OutlinedButton(
            onPressed: () {
              controller.nextStage();
            },
            child: const TextView(
              text: "Continue",
            ),
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
              ))
        ],
      ),
    );
  }
}

class PlayersStageSetup<T extends PlaySetupViewModel> extends AView<T> {
  const PlayersStageSetup({super.key});

  static final Rx<TextEditingController> playerNameSuggestedEditor = TextEditingController(text: '').obs;

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
      () => SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextView(
                text: "Time For the Players : ${controller.players.length}",
                type: HeadingType.displaySmall,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextView(
                text: "minimum 3 player and 7 max players",
                type: HeadingType.bodySmall,
              ),
            ),
            Container(
              width: adapt(phone: 200, tablet: 300, desktop: 420),
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: playerNameSuggestedEditor.value,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Add Player",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: IconButton(
                      padding: const EdgeInsets.all(7.0),
                      onPressed: () {
                        playerNameSuggestedEditor(TextEditingController(text: controller.suggestName()));
                      },
                      icon: const Icon(
                        Icons.loop,
                      ),
                    ),
                    suffixIcon: IconButton(
                      padding: const EdgeInsets.all(7.0),
                      onPressed: () {
                        controller.addPlayer(BibleTilePlayer(
                            name: playerNameSuggestedEditor.value.text,
                            image: 'image',
                            points: 0,
                            attemptedQuestions: []));
                      },
                      icon: const Icon(Icons.check),
                    )),
              ),
            ),
            ...controller.players.map2((player, index) {
              return Container(
                width: adapt(phone: 200, tablet: 300, desktop: 420),
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  title: TextView(
                    text: player.name,
                  ),
                  leading: IconButton(
                    padding: const EdgeInsets.all(7.0),
                    onPressed: () {
                      controller.removePlayer(player);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }).toList(),
            const SizedBox(
              height: 25,
            ),

              OutlinedButton(
                onPressed:controller.players.length > 2 ?( () {
                  controller.nextStage();
                }):null,

                child: const TextView(
                  text: "Continue",
                ),
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
                ))
          ],
        ),
      ),
    );
  }
}

class TypeStageSetup<T extends PlaySetupViewModel> extends AView<T> {
  const TypeStageSetup({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
      () => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextView(
                text: "Are you playing in teams or one by one?",
                type: HeadingType.displaySmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...GameType.values.map2((val, index) {
                  return CheckToggle(
                      defaultState: controller.gameType == val,
                      label: val.name,
                      onStateChange: (bool state) {
                        controller.selectGameType(val);
                      });
                }),
              ],
            ),
            const SizedBox(height: 25),
            OutlinedButton(
              onPressed: () {
                controller.nextStage();
              },
              child: const TextView(
                text: "Continue",
              ),
            )
          ],
        ),
      ),
    );
  }
}
