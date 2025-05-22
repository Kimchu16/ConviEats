class Product {
  final String name;
  final String barcode;
  final String ingredients;
  final List<String> allergens;

  const Product({
    required this.name,
    required this.barcode,
    required this.ingredients,
    required this.allergens,
  });
}
