import 'package:zoja_test/model/model.dart';
import './i_product_service.dart';

class ProductService implements IProductService {
  @override
  Future<List<Product>> fetchProducts() async {
    // await simulateNetworkDelay();

    return [
      Product(id: '1', name: 'Product 1', price: 19.99),
      Product(id: '2', name: 'Product 2', price: 29.99),
      Product(id: '3', name: 'Product 3', price: 39.99),
    ];
  }

  @override
  Future<Product?> getProductById(String id) async {
    // await simulateNetworkDelay(1);

    List<Product> products = await fetchProducts();
    return products.firstWhere(
      (product) => product.id == id,
    );
  }

  @override
  Future<bool> addProduct(Product product) async {
    // await simulateNetworkDelay();
    return true;
  }

  @override
  Future<bool> updateProduct(Product product) async {
    // await simulateNetworkDelay();
    return true;
  }

  @override
  Future<bool> deleteProduct(String id) async {
    // await simulateNetworkDelay(1);
    return true;
  }
}
