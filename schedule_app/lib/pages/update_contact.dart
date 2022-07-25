import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../bd/contact_table.dart';
import '../models/contact.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact({
    Key? key,
    required this.onUpdateList,
    required this.contact,
  }) : super(key: key);
  final Contact contact;
  final VoidCallback onUpdateList;

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.contact.name;
    phone.text = widget.contact.phone;
  }

  final name = TextEditingController();
  final phone = TextEditingController();
  var db = GetIt.I.get<ContactTable>();

  _updateContact() async {
    var c = Contact(id: widget.contact.id, name: name.text, phone: phone.text);
    await db.updateContact(c);
    widget.onUpdateList();
    Navigator.of(context).pop();
  }

  _removeContact() async {
    await db.deleteContact(widget.contact.id);
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
                  onPressed: _updateContact,
                  child: const Text("Atualizar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
