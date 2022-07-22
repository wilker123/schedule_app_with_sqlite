import 'package:flutter/material.dart';

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
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Informe o nome do contato",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
