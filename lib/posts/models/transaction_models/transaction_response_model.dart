class TransactionResponseModel {
  final bool isSuccess;
  final String description;
  final String transactionId;

  TransactionResponseModel(
      this.isSuccess,
      this.description,
      this.transactionId,
  );  

  factory TransactionResponseModel.fromJson(dynamic data) {
    final _isSuccess = data['isSuccess'] as bool;
    final _description = data['description'] as String;
    final _transactionId = data['transactionId'] as String;

    return TransactionResponseModel(
      _isSuccess,
      _description,
      _transactionId,  
    );
  }
}
