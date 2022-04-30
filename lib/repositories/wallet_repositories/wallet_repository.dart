import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../posts/models/wallet_models/default_active_wallet_model.dart';
import '../../posts/models/wallet_models/wallet_model.dart';

abstract class TransactionRepository {
  ///Throws [NetworkException]
  Future<WalletModel?> getWalllet(String wallet);

  Future<List<WalletModel?>?> getAllWallets();

  Future<List<DefaultActiveWalletModel?>?> getAllActiveRecipientWallets();

  Future<WalletModel?> postWallet(WalletModel wallet);

  Future<List<WalletModel?>?> getAllWalletsForSpecificUser();
}

class WalletRepositoryProvider implements TransactionRepository {
  final String _url =
      "https://app-gradcoin-api-uat.azurewebsites.net/api/Wallet";
  final Dio _dio = Dio();
  late SharedPreferences _prefs;

  WalletRepositoryProvider() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      var token = await getToken();
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
    }));
  }

  getToken() async {
    _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    return token;
  }

  @override
  Future<List<WalletModel?>?> getAllWallets() async {
    try {
      Response res = await _dio.get(_url);
      List<WalletModel> wallets = res.data
          .map((i) => WalletModel.fromJson(i))
          .toList()
          .cast<WalletModel>();
      return wallets;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<DefaultActiveWalletModel>?> getAllActiveRecipientWallets() async {
    try {
      Response res = await _dio.get('$_url/GetActiveDefaultRecipientDetails');
      List<DefaultActiveWalletModel> wallets = res.data
          .map((i) => DefaultActiveWalletModel.fromJson(i))
          .toList()
          .cast<DefaultActiveWalletModel>();
      return wallets;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<WalletModel>?> getAllWalletsForSpecificUser() async {
    _prefs = await SharedPreferences.getInstance();
    String? userId = _prefs.getString('userId');
    try {
      Response res = await _dio.get('$_url/GetWalletByUserId/${userId}');
      List<WalletModel> wallets = res.data
          .map((i) => WalletModel.fromJson(i))
          .toList()
          .cast<WalletModel>();
      return wallets;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<WalletModel?> getWalllet(String wallet) async {
    try {
      Response res = await _dio.get<WalletModel>('$_url/$wallet');
      WalletModel? wallets = res as WalletModel?;
      return wallets;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<WalletModel?> postWallet(wallet) async {
    WalletModel? _wallet = wallet;
    try {
      Response res = await _dio.post('$_url/', data: _wallet);
      WalletModel? transaction = res as WalletModel?;
      return transaction;
    } catch (e) {
      return null;
    }
  }
}
