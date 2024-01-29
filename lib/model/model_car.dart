class Product {
  String name;
  String weight;
  String height;
  String length;
  String width;
  String comfort;
  int price;

  Product({
    required this.name,
    required this.weight,
    required this.height,
    required this.length,
    required this.width,
    required this.comfort,
    required this.price,
  });

  // // Factory 메서드를 사용하여 Map에서 Product 객체를 생성하는 방법
  // factory Product.fromMap(Map<String, dynamic> map) {
  //   return Product(
  //     name: map['name'],
  //     weight: map['weight'],
  //     height: map['height'],
  //     length: map['length'],
  //     width: map['width'],
  //     comfort: map['comfort'],
  //     price: map['price'],
  //   );
  // }
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      weight: map['weight'] ?? '',
      height: map['height'] ?? '',
      length: map['length'] ?? '',
      width: map['width'] ?? '',
      comfort: map['comfort'] ?? '',
      price: map['price'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Product{name: $name, weight: $weight, height: $height, length: $length, width: $width, comfort: $comfort, price: $price}';
  }
}