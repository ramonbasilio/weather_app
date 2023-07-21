import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firebaseCloud = FirebaseFirestore.instance;

  Future<void> saveCitySearch(
      String dataCity) async {
    try {
      await _firebaseCloud
          .collection('CidadesPesquisadas')
          .doc('locais')
          .set({'cidade':dataCity});
    } on FirebaseException catch (e) {
      print('Erro ao adicionar dados: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCitySave() async {
    DocumentSnapshot documentSnapshot =
        await _firebaseCloud.collection('CidadesPesquisadas').doc('locais').get();
    final docMap = documentSnapshot.data() as Map<String, dynamic>;
    return docMap;
  }


}
