import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:teka_3dclic/presentation/dummy_data/app_invoices_menu.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final future = Supabase.instance.client.from('countries').select();
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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final countries = snapshot.data!;
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return ListTile(
                title: Text(country['name']),
              );
            },
          );
        },
      ),

      /*ListView.builder(
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
        )*/
    );
  }
}
