class IntroTutorial {
  final String title;
  final String caption;
  final String assetUrl;
  int dot = 1;

  IntroTutorial({
    required this.title,
    required this.caption,
    required this.assetUrl,
    required this.dot,
  });
}

final slidesIntroTutorial = <IntroTutorial>[
  IntroTutorial(
      title: '3DClic',
      caption:
          'An App to calculate every 3d printing, generate PDF invoices, see last 3d models in Thingiverse and Cults 3D',
      assetUrl: 'assets/lottie/animation_printer2.json',
      dot: 1),
  IntroTutorial(
      title: 'Generate invoice PDF',
      caption: 'You can generate invoices and generate a PDF if you want it',
      assetUrl: 'assets/lottie/animation_pdf.json',
      dot: 2),
];
