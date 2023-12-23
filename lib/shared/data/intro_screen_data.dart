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
      title: '3D + Costos = ¡Magia!',
      caption: 'Una nueva dimensión',
      assetUrl: 'assets/lottie/animation_printer2.json',
      dot: 1),
  IntroTutorial(
      title: 'Precisión en Segundos',
      caption: 'Calcula costos al instante.',
      assetUrl: 'assets/lottie/animation_money.json',
      dot: 2),
  IntroTutorial(
      title: 'Cotizaciones en un Clic',
      caption: 'Genera cotizaciones en PDF.',
      assetUrl: 'assets/lottie/animation_pdf.json',
      dot: 3),
  IntroTutorial(
      title: 'Todo lo nuevo en 3D',
      caption: 'Visualiza las últimas creaciones',
      assetUrl: 'assets/lottie/animation_rocket.json',
      dot: 4)
];
