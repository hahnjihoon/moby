class Dbahck {
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
  final String spices;
  final String folding;
  final String material;
  final String weight;
  final String ceiling;
  final String wheel;
  final String size;
  final String busketSize;
  final String belt;
  final String lmtAge;
  final String lmtWet;
  final String color;

  Dbahck({
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
    required this.spices,
    required this.folding,
    required this.material,
    required this.weight,
    required this.ceiling,
    required this.wheel,
    required this.size,
    required this.busketSize,
    required this.belt,
    required this.lmtAge,
    required this.lmtWet,
    required this.color,
  });

  factory Dbahck.fromMap(Map<String, dynamic> map) {
    return Dbahck(
      id: map['id'] ?? 0,
      majorClass: map['major_class'] ?? '-',
      middleClass: map['middle_class'] ?? '-',
      minorClass: map['minor_class'] ?? '-',
      imageUrl: map['image_url'] ?? '-',
      pageUrl: map['page_url'] ?? '-',
      productName: map['product_name'] ?? '-',
      brand: map['brand'] ?? '-',
      salesCom: map['sales_com'] ?? '-',
      price: map['price'] ?? 0,
      madeIn: map['made_in'] ?? '-',
      spices: map['spices'] ?? '-',
      folding: map['folding'] ?? '-',
      material: map['material'] ?? '-',
      weight: map['weight'] ?? '-',
      ceiling: map['ceiling'] ?? '-',
      wheel: map['wheel'] ?? '-',
      size: map['size'] ?? '-',
      busketSize: map['busket_size'] ?? '-',
      belt: map['belt'] ?? '-',
      lmtAge: map['lmt_age'] ?? '-',
      lmtWet: map['lmt_wet'] ?? '-',
      color: map['color'] ?? '-',
    );
  }

  @override
  String toString() {
    return 'Dbahck{id: $id, majorClass: $majorClass, middleClass: $middleClass, minorClass: $minorClass, imageUrl: $imageUrl, pageUrl: $pageUrl, productName: $productName, brand: $brand, salesCom: $salesCom, price: $price, madeIn: $madeIn, spices: $spices, folding: $folding, material: $material, weight: $weight, ceiling: $ceiling, wheel: $wheel, size: $size, busketSize: $busketSize, belt: $belt, lmtAge: $lmtAge, lmtWet: $lmtWet, color: $color}';
  }
}
