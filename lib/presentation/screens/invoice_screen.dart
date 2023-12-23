import 'package:flutter/material.dart';
import 'package:teka_3dclic/config/menus/app_invoices_menu.dart';

class InvoiceScreen extends StatelessWidget {
  static const String name = 'invoice_screen';
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          actions: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/3d_printing_2.png'),
            ),

            Container(
              width: 20,
              height: 20,
              color: Colors.white,
            ),

            //Image.asset(,'assets/images/3d_printing_2.png'),
          ],
          //leading: Image.asset('assets/images/3d_printing_2.png'),
          title: const Text('Cotizaciones'),
        ),
        body: ListView.builder(
          itemCount: appInvoicesMenuItems.length,
          itemBuilder: (context, index) {
            final invoicesMenuItem = appInvoicesMenuItems[index];
            return ListTile(
              title: Text(invoicesMenuItem.title),
              subtitle: Text(invoicesMenuItem.subtitle),
              leading: const Icon(
                Icons.abc,
                color: Colors.blueAccent,
              ),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {},
              splashColor: colors.primaryContainer,
            );
          },
        ));
  }
}
