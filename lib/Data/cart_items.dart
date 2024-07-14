import "package:grocery/features/home/models/home_product_data_model.dart";


Set<ProductDataModel> cartItems = {};

ProductDataModel? getProductById(String id) {
  return cartItems.firstWhere((product) => product.id == id, orElse: () => ProductDataModel());
}


void addProductToCart(ProductDataModel product) {
  ProductDataModel? existingProduct = getProductById(product.id ?? '');
  if (existingProduct?.id != null) {
    existingProduct?.incrementQuantity();
  } else {
    cartItems.add(product);
  }
}


void setProductQuantity(String id, int quantity) {
  ProductDataModel? product = getProductById(id);
  if (product?.id != null) {
    product?.setQuantity(quantity);
  }
}

int? getProductQuantity(String id) {
  ProductDataModel? product = getProductById(id);
  if (product?.id != null) {
    return product?.getQuantity();
  }
  return null;
}
