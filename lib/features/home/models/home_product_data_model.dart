class ProductDataModel {
  String? id;
  String? name;
  String? description;
  int? quantity;
  double? price;
  String? imageUrl;

  ProductDataModel({
     this.id,
     this.name,
     this.description,
     this.quantity,
     this.price,
     this.imageUrl,
  });

  void incrementQuantity() {
    quantity = (quantity ?? 0) + 1 ;
  }

  void setQuantity(int newQuantity) {
    quantity = newQuantity;
  }

  int? getQuantity() {
    return quantity;
  }
}
