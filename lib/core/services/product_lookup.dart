class ProductLookup {
  static final Map<String, String> _products = {
    '8801045678901': 'Choco Pie – Contains: Wheat, Egg, Milk, Soy',
    '8809123456789': 'Banana Milk – Contains: Milk',
  };

  static String getInfo(String code) {
    return _products[code] ?? 'Product not found.';
  }
}
