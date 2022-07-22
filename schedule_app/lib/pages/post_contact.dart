import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../bd/contact_table.dart';
import '../models/contact.dart';

class PostContact extends StatefulWidget {
  const PostContact({
    Key? key,
    required this.onUpdateList,
  }) : super(key: key);

  final VoidCallback onUpdateList;

  @override
  State<PostContact> createState() => _PostContactState();
}

class _PostContactState extends State<PostContact> {
  final name = TextEditingController();
  final phone = TextEditingController();
  var db = GetIt.I.get<ContactTable>();

  _cadastrarContact() async {
    var c = Contact(id: 0, name: name.text, phone: phone.text);
    await db.insertContact(c);
    widget.onUpdateList();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo contato"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Informe o nome do contato",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Informe o telefone do contato",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Salvar"),
                  onPressed: _cadastrarContact,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
