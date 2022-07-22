import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_app/pages/post_contact.dart';

import '../bd/contact_table.dart';
import '../models/contact.dart';

class ListContacts extends StatefulWidget {
  const ListContacts({Key? key}) : super(key: key);

  @override
  State<ListContacts> createState() => _ListContactsState();
}

class _ListContactsState extends State<ListContacts> {
  var bd = GetIt.I.get<ContactTable>();

  late Future<List<Contact>> items;

  @override
  void initState() {
    super.initState();

    items = bd.getContacts();
  }

  atualizarDados() {
    setState(() {
      items = bd.getContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: FutureBuilder<List<Contact>>(
                  future: items,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Contact> data = snapshot.data!;

                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(data[index].name),
                            onTap: () {},
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PostContact(onUpdateList: atualizarDados),
                        ),
                      );
                    },
                    child: const Text("Novo contato"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
