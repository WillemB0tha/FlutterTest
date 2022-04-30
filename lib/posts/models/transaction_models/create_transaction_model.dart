class CreateTransactionModel {
  final int amounts;
  final String description;
  final String fromWalletID;
  final String toWalletID;
  final String transactionGroupID;

  CreateTransactionModel(this.amounts, this.description, this.fromWalletID,
      this.toWalletID, this.transactionGroupID);

  Map<String, dynamic> toJson() {
    List<int> amountList = [];
    amountList.insert(0, amounts);
    List<String> walletList = [];
    walletList.insert(0, toWalletID);
    return {
      'amounts': amountList,
      'description': description,
      'fromWalletID': fromWalletID,
      'toWalletIDs': walletList,
      'transactionGroupID': transactionGroupID,
    };
  }
}
