/*class dbService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    var ref = _db.collection('test');
    return ref.snapshots().map((event) { print(_db.collection('test'));return
      event.docs.map((e) => Product.fromJson(e.data())).toList();
     
    });
  }

  dbService();
}*/