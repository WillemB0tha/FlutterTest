import 'package:dio/dio.dart';
import 'package:mobile_app/posts/models/transaction_models/create_transaction_model.dart';
import 'package:mobile_app/posts/models/transaction_models/transaction_model.dart';
import 'package:mobile_app/posts/models/transaction_models/transaction_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TransactionRepository {
  ///Throws [NetworkException]
  Future<TransactionModel?> getTransaction(String transactionId);

  Future<List<TransactionModel?>?> getAllTransaction();

  Future<bool?> postTransaction(CreateTransactionModel transaction);

  Future<List<TransactionModel?>?> getAllTransactionsForSpecificUser();
}

class TransactionRepositoryProvider implements TransactionRepository {
  final String _url =
      "https://app-gradcoin-api-uat.azurewebsites.net/api/CoinTransaction";
  final Dio _dio = Dio();
  late SharedPreferences _prefs;

  TransactionRepositoryProvider() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      var token = await getToken();
      options.headers['Authorization'] = 'Bearer $token';
      return handler.next(options);
      // }, onError: (DioError error, handler) async {
      //   if ((error.response?.statusCode == 401 &&
      //       error.response?.data['message'] == "Invalid JWT")) {
      //     print("Token expired");
      //   }
    }));
  }

  getToken() async {
    _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    return token;
  }

  //Get All The Transactions
  @override
  Future<TransactionModel?> getTransaction(String transactionId) async {
    try {
      Response res = await _dio.get<TransactionModel>(_url);
      TransactionModel transactions = res as TransactionModel;
      return transactions;
    } catch (e) {
      return null;
    }
  }

  //Get All The Transactions
  @override
  Future<List<TransactionModel?>?> getAllTransaction() async {
    try {
      Response res = await _dio.get<TransactionModel>('$_url/GeneralLedger');
      List<TransactionModel?> transactions = res as List<TransactionModel?>;
      return transactions;
    } catch (e) {
      return null;
    }
  }

  //Get All The Transactions for a Specific User
  @override
  Future<List<TransactionModel?>?> getAllTransactionsForSpecificUser() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      String userId = _prefs.getString('userId').toString();
      Response res =
          await _dio.get('$_url/GetCoinTransactionsByUserId?id=$userId');
      List<TransactionModel?> transactions = res as List<TransactionModel?>;
      return transactions;
    } catch (e) {
      return null;
    }
  }

  //Create a transaction
  @override
  Future<bool?> postTransaction(CreateTransactionModel transaction) async {
    try {
      Response res = await _dio.post(_url, data: transaction.toJson());
    } catch (e) {
      return null;
    }
  }
}
