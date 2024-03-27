import 'package:test_technique/layers/presentation/shared/others/export.dart';

class UsersController extends GetxController {
  var searchText = "";

  var currentGender = RxString(User.allGender);

  var allUser = <User>[];

  var dynamicUsers = Rx<List<User>>([]);

  var fetchEnd = false.obs;

  var isShowAppBar = false.obs;

  var isShowFloatingButton = false.obs;

  var isShowBody = false.obs;

  var animateCard = false.obs;

  var loading = false.obs;

  var userRepository = UserRepositoryImpl();

  void search() async {
    loading.value = true;
    var searchResult =
        allUser.map((u) => u).where((user) => searchCondition(user)).toList();
    waitAfter(2000, () {
      dynamicUsers.value = searchResult;
      loading.value = false;
    });
  }

  bool genderCondition(
      {required String searchGender, required String elementGender}) {
    return searchGender == User.allGender
        ? true
        : elementGender == searchGender;
  }

  Future<void> fetchUsers() async {
    if (await LocalStorageImpl().localAvailable) {
      allUser = await userRepository.getLocalUsers();
    } else {
      allUser = (await userRepository.getOnlineUsers())!;
    }
    dynamicUsers.value = allUser;
    fetchEnd.value = true;
    waitAfter(1000, () {
      Routes.toHome();
    });
  }

  bool searchCondition(User element) {
    return genderCondition(
            elementGender: element.gender, searchGender: currentGender.value) &&
        (element.name.first.toLowerCase().contains(searchText) ||
            element.name.last.toLowerCase().contains(searchText) ||
            ("${element.name.first.toLowerCase()} ${element.name.last.toLowerCase()}")
                .contains(searchText));
  }

  void show() {
    isShowAppBar.value = true;
    waitAfter(900, () {
      isShowFloatingButton.value = true;
      waitAfter(1100, () {
        isShowBody.value = true;
        waitAfter(1000, () {
          animateCard.value = true;
        });
      });
    });
  }
}
