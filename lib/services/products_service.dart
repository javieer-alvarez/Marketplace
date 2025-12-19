import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:productos_app/config/secret_config.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl =
      SecretConfig.baseUrl; // Firebase RTDB URL <- Paste here your firebase URL
  final List<Product> products = [];
  late Product selectedProduct;

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    loadProduts();
  }

  Future<List<Product>> loadProduts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = jsonDecode(resp.body);

    if (resp.statusCode != 200) {
      print('error al cargar los productos: ${resp.body}');
      return [];
    }

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      //Se crea el producto
      await createProduct(product);
    } else {
      //Se actualiza
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());

    final decodedData = resp.body;

    print(decodedData);

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());

    final decodedData = json.decode(resp.body);

    print(decodedData);

    product.id = decodedData['name'];

    products.add(product);

    return product.id!;
  }

  updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> updateImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dvbkgguf0/image/upload?upload_preset=ygn47d8s');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromString('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salió mal');
      print(resp.body);

      return null;
    }
    newPictureFile = null;

    final decodedData = jsonDecode(resp.body);
    return decodedData['secure_url'];
  }
}
