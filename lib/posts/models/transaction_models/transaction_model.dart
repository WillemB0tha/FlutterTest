class TransactionModel {
  final String id;
  final String fromName;
  final String fromSurname;
  final String toName;
  final String toSurname;
  final String fromWalletId;
  final String toWalletId;
  final String amount;
  final String transactionDate;
  final String transactionGroupID;

  TransactionModel(
      this.id,
      this.fromName,
      this.fromSurname,
      this.toName,
      this.toSurname,
      this.fromWalletId,
      this.toWalletId,
      this.amount,
      this.transactionDate,
      this.transactionGroupID);
}
