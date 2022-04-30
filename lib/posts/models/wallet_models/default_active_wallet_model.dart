import 'package:equatable/equatable.dart';

class DefaultActiveWalletModel extends Equatable {
  String id;
  final String walletName;
  final String recipientName;

  DefaultActiveWalletModel(this.id, this.walletName, this.recipientName);

  factory DefaultActiveWalletModel.fromJson(dynamic data) {
    final _id = data['id'] as String;
    final _walletName = data['walletName'] as String;
    final _recipientName = data['recipientName'] as String;

    return DefaultActiveWalletModel(
      _id,
      _walletName,
      _recipientName,
    );
  }

  @override
  List<Object?> get props => [
        id,
        walletName,
        recipientName,
      ];
}
