class Wjwqud {
  final int id;
  final String majorClass;
  final String middleClass;
  final String minorClass;
  final String imageUrl;
  final String pageUrl;
  final String productName;
  final String brand;
  final String salesCom;
  final int price;
  final String madeIn;
  final String material;
  final String weight;
  final String size;
  final String color;

  Wjwqud({
    required this.id,
    required this.majorClass,
    required this.middleClass,
    required this.minorClass,
    required this.imageUrl,
    required this.pageUrl,
    required this.productName,
    required this.brand,
    required this.salesCom,
    required this.price,
    required this.madeIn,
    required this.material,
    required this.weight,
    required this.size,
    required this.color,
  });

  factory Wjwqud.fromMap(Map<String, dynamic> map) {
    return Wjwqud(
      id: map['id'] ?? 0,
      majorClass: map['majorClass'] ?? '-',
      middleClass: map['middleClass'] ?? '-',
      minorClass: map['minorClass'] ?? '-',
      imageUrl: map['imageUrl'] ?? '-',
      pageUrl: map['pageUrl'] ?? '-',
      productName: map['productName'] ?? '-',
      brand: map['brand'] ?? '-',
      salesCom: map['salesCom'] ?? '-',
      price: map['price'] ?? 0,
      madeIn: map['madeIn'] ?? '-',
      material: map['material'] ?? '-',
      weight: map['weight'] ?? '-',
      size: map['size'] ?? '-',
      color: map['color'] ?? '-',
    );
  }

  @override
  String toString() {
    return 'Wjwqud{id: $id, majorClass: $majorClass, middleClass: $middleClass, minorClass: $minorClass, imageUrl: $imageUrl, pageUrl: $pageUrl, productName: $productName, brand: $brand, salesCom: $salesCom, price: $price, madeIn: $madeIn, aterial: $material, weight: $weight, size: $size, color: $color}';
  }
}
