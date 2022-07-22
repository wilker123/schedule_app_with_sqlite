import 'package:get_it/get_it.dart';
import 'package:schedule_app/bd/database_helper.dart';

import '../models/contact.dart';

class ContactTable {
  Future<void> insertContact(Contact c) async {
    var db = await GetIt.I.get<DataBaseHelper>().getDB();

    await db.insert('contact', c.toMap());

    await db.close();
  }

  Future<List<Contact>> getContacts() async {
    var db = await GetIt.I.get<DataBaseHelper>().getDB();

    final List<Map<String, dynamic>> maps =
        await db.rawQuery("Select * from contact order by name");

    await db.close();

    return List.generate(maps.length, (index) => Contact.fromMap(maps[index]))
        .toList();
  }

  Future<void> updateContact(Contact c) async {
    var db = await GetIt.I.get<DataBaseHelper>().getDB();

    await db.update('contact', c.toMap(), where: 'id = ?', whereArgs: [c.id]);

    await db.close();
  }

  Future<void> deleteContact(int id) async {
    var db = await GetIt.I.get<DataBaseHelper>().getDB();

    await db.delete('contact', where: 'id = ?', whereArgs: [id]);

    await db.close();
  }
}
