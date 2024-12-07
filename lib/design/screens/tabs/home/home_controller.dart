import 'package:get/get.dart';

class HomeController extends GetxController{
bool isLoading = false;
@override
  void onInit() {
    Init();
    super.onInit();
  }
Future<void>Init()async{
  getDashboard();
}
Future<void>getDashboard()async{
  isLoading=true;
  update();
  await Future.delayed(Duration(seconds: 3));
  isLoading=false;
  update();
}
}
