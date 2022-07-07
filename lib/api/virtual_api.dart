import 'dart:math';

class VirtualDB {
  List<Map<String, dynamic>> _items = [];
  static final VirtualDB _db = VirtualDB._privateConstructor();

  VirtualDB._privateConstructor();

  factory VirtualDB() {
    return _db;
  }

  Future<int> insert(Map<String, dynamic> item) async {
    item['id'] = Random().nextInt(1000);
    _items.add(item);
    return item['id'];
  }

  Future<void> remove(int id) async {
    _items.removeWhere((item) => item['id'] == id);
  }

  Future<void> update(Map<String, dynamic> updatedItem) async {
    int i = _items.indexWhere((item) => item['id'] == updatedItem['id']);
    _items[i] = updatedItem;
  }

  Future<List<Map<String, dynamic>>> list() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _items;
  }

  Future<Map<String, dynamic>?> findOne(int id) async {
    return _items.firstWhere((item) => item['id'] == id);
  }

  Future<Map<String, dynamic>?> findByUsername(String username) async {
    return _items.where((item) => item['username'] == username).first;
  }
}