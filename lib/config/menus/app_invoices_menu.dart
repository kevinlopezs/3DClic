import 'package:flutter/material.dart';

class AppInvoicesMenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const AppInvoicesMenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appInvoicesMenuItems = <AppInvoicesMenuItem>[
  AppInvoicesMenuItem(
      title: 'Ipad buttons',
      subtitle: '111111',
      link: '/link',
      icon: Icons.abc_outlined),
  AppInvoicesMenuItem(
      title: 'Ipad buttons2',
      subtitle: '222222',
      link: '/link',
      icon: Icons.abc_outlined),
  AppInvoicesMenuItem(
      title: 'Ipad buttons3',
      subtitle: '333333',
      link: '/link',
      icon: Icons.abc_outlined),
  AppInvoicesMenuItem(
      title: 'Ipad buttons4',
      subtitle: '444444',
      link: '/link',
      icon: Icons.abc_outlined),
  AppInvoicesMenuItem(
      title: 'Ipad button5',
      subtitle: '55555',
      link: '/link',
      icon: Icons.abc_outlined),
];
