import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Mortar extends StatelessWidget {
  final TextEditingController _noteController = TextEditingController();

  void _addNote() async {
    if (_noteController.text.isNotEmpty) {
      await FirebaseFirestore.instance.collection('notes').add({
        'text': _noteController.text,
      });
      _noteController.clear();
    }
  }

  void _deleteNote(DocumentReference docRef) async {
    await docRef.delete();
  }

  void _updateNote(DocumentReference docRef, String newText) async {
    await docRef.update({
      'text': newText,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara membuat mortar untuk pasangan batu bata, plester tembok'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              'assets/1.jpeg', // Ganti dengan URL gambar yang sesuai
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'langkah - langkah :\n'
              '• Ambil satu bagian semen\n'
              '• Ambil 6 bagian pasir\n'
              '• tambahkan air dengan volume menyesuaikan tekstur adukan mortar yang diinginkan\n'
              '• aduk dengan seksama\n\n'
              'Ikuti langkah berikut untuk lebih jelasnya',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Aksi membuka tautan YouTube
              },
              child: Text(
                'https://youtu.be/tZcQGJ7RIcY?feature=shared',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('notes').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var note = snapshot.data!.docs[index];

                      return ListTile(
                        title: Text(note['text']),
                        trailing: PopupMenuButton<String>(
                          onSelected: (String result) {
                            if (result == 'delete') {
                              _deleteNote(note.reference);
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'delete',
                              child: Text('Hapus'),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Memunculkan dialog untuk memperbarui catatan
                          showDialog(
                            context: context,
                            builder: (context) {
                              TextEditingController _updateController = TextEditingController();
                              _updateController.text = note['text'];
                              return AlertDialog(
                                title: Text('Update Note'),
                                content: TextField(
                                  controller: _updateController,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _updateNote(note.reference, _updateController.text);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Update'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _noteController,
                decoration: InputDecoration(
                  hintText: 'note',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addNote,
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
