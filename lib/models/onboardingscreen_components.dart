// ignore_for_file: non_constant_identifier_names

class OnBoarding {
  final String title;
  final String Description;
  final String image;

  OnBoarding({
    required this.title,
    required this.Description,
    required this.image,
  });
}

List<OnBoarding> onboarding_data = [
  OnBoarding(
    title: 'Scan and Verify Currency with Ease!',
    image: "assets/images/scanner.json",
    Description:
        "With a simple scan, you can verify your currency notes.  Say goodbye to Fake currency and secure your financial transactions with confidence.",
  ),
  OnBoarding(
    title: 'Currency Information at Your Fingertips',
    image: "assets/images/info.json",
    Description:
        "We provide you with valuable insights and information about the currency notes you hold. From security feat- -ures to historical significance, our app empowers you with knowledge about your money",
  ),
  OnBoarding(
    title: 'Your Data, Your Shield',
    image: "assets/images/safe.json",
    Description:
        "we ensure that your data remains safe. Enjoy a worry-free experience while using our app. Your trust is our commitment.",
  ),
];


