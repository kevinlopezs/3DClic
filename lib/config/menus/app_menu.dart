class AppMenus {
  final String title;
  final String icon;
  final String link;

  const AppMenus({required this.title, required this.icon, required this.link});
}

//This is an Menu objects in a List
const appMenus = <AppMenus>[
  //HomeScreen route

  //Calculator screen route
  AppMenus(
      title: 'Calculadora 3D',
      link: '/calculator_screen',
      icon: 'assets/images/calculator.png'),

  //Invoices screen route
  AppMenus(
      title: 'Cotizaciones',
      link: '/invoice_screen',
      icon: 'assets/images/invoices.png'),

  //New 3D objects screen
  AppMenus(
      title: 'Modelos 3D',
      link: '/models_3d_screen',
      icon: 'assets/images/3d_printing.png'),
];

//This is an Menu objects in a Map
const cards = <Map<String, dynamic>>[
  {
    'title': 'Calculadora 3D',
    'title2': 'Cotizaciones',
    'title3': 'Modelos 3D',
    'link': '/calculator',
    'link2': '/invoices',
    'link3': '/3dmodels',
    'icon': 'assets/images/calculator.png',
    'icon2': 'assets/images/invoices.png',
    'icon3': 'assets/images/3d_printing.png',
  }
];
