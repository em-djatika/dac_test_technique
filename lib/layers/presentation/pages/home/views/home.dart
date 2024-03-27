import 'package:test_technique/layers/presentation/shared/others/export.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UsersController controller;

  @override
  void initState() {
    controller = Get.find<UsersController>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      waitAfter(1000, () {
        controller.show();
      });
    });
    super.initState();
  }

  final _floatingButtonSize = 65.0;
  @override
  Widget build(BuildContext context) {
    return EScaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedSwitcher(
                duration: 999.milliseconds,
                child: !controller.isShowBody.value
                    ? 0.h
                    : controller.loading.value
                        ? Center(
                            child: SizedBox(
                              key: UniqueKey(),
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.5,
                                color: AppColors.purple,
                              ),
                            ),
                          )
                        : controller.dynamicUsers.value.isEmpty
                            ? const Empty()
                            : ListUsers(
                                controller: controller,
                              )),
          ),
          HomeAppBar(controller: controller)
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          var user = User.empty;
          Routes.toSetUser(user: user);
        },
        child: Container(
          alignment: Alignment.center,
          height: _floatingButtonSize,
          width: _floatingButtonSize,
          child: Hero(
            tag: 'float',
            child: BlurryContainer(
              child: Obx(
                () => AnimatedContainer(
                    duration: 999.milliseconds,
                    height: controller.isShowFloatingButton.value
                        ? _floatingButtonSize
                        : 0,
                    width: controller.isShowFloatingButton.value
                        ? _floatingButtonSize
                        : 0,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    decoration: BoxDecoration(
                        color: controller.isShowFloatingButton.value
                            ? AppColors.purple
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(21)),
                    child: const Icon(Icons.add, color: Colors.white)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
