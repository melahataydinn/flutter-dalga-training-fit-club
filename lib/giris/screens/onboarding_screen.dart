import 'package:flutter/material.dart';
import 'package:Deneme/giris/component/onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboardingPage(
            image: Image.asset("asssets/diyet.png",height: 400,width: 400,alignment: Alignment.center,),
            title: "Kendini yeniden yaratmaya hazır mısın?",
            description:
                "Sağlıklı beslenme alışkanlıkları ve kalori takibi ile vücuduna hak ettiği özeni göster.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 0,
          ),
          OnboardingPage(
            image: Image.asset("asssets/spor.png",height: 400,width: 400,alignment: Alignment.center,),
            title: "Dilediğiniz her ortamda bizimle birlikte forma gir ve formda kal!",
            description:"Malzemelere ihtiyaç duymadan istediğin her yerde ve her koşulda seni burada bekliyoruz.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 1,
          ),
          //lets add 3rd screen
          OnboardingPage(
            image: Image.asset("asssets/erkek.png",height: 400,width: 400,alignment: Alignment.center,),
            
            
            title: "VÜCUDUNU TANI VE HAREKETE GEÇ!",
            description:
                "Vücut tipini tanı ve sana en uygun egzersizlerle kendi programını oluştur.",
            noOfScreen: 3,
            onNextPressed: changeScreen,
            currentScreenNo: 2,
          ),
        ],
      ),
    );
  }

  //Lets write function to change next onboarding screen
  void changeScreen(int nextScreenNo) {
    controller.animateToPage(nextScreenNo,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}