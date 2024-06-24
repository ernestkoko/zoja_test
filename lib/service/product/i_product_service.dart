import '../../model/model.dart';
import './product_service.dart';

interface class IProductService {
  static IProductService _instance = ProductService();

  static IProductService get instance => _instance;

  static set instance(IProductService productService) =>
      _instance = productService;

  Future<List<Product>> fetchProducts() {
    throw UnimplementedError('fetchProducts not implemented');
  }

  Future<Product?> getProductById(String id) {
    throw UnimplementedError('getProductById not implemented');
  }

  Future<bool> addProduct(Product product) {
    throw UnimplementedError('addProduct not implemented');
  }

  Future<bool> updateProduct(Product product) {
    throw UnimplementedError('updateProduct not implemented');
  }

  Future<bool> deleteProduct(String id) {
    throw UnimplementedError('deleteProduct not implemented');
  }
}
