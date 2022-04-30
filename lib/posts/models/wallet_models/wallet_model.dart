import 'package:equatable/equatable.dart';

class WalletModel extends Equatable {
  String id;
  final String walletName;
  final int balance;
  final String walletStatus;
  final String walletType;
  final bool? isPublic;
  final bool? isDefault;

  WalletModel(this.id, this.walletName, this.balance, this.walletStatus,
      this.isDefault, this.walletType, this.isPublic);

  factory WalletModel.fromJson(dynamic data) {
    final _id = data['id'] as String;
    final _walletName = data['walletName'] as String;
    final _balance = data['balance'] as int;
    final _walletStatus = data['walletStatus'] as String;
    final _walletType = data['walletType'] as String;
    final _isPublic = data['isPublic'] as bool?;
    final _isDefault = data['isDefault'] as bool?;

    return WalletModel(
      _id,
      _walletName,
      _balance,
      _walletStatus,
      _isDefault,
      _walletType,
      _isPublic,
    );
  }

  @override
  List<Object?> get props => [
        id,
        walletName,
        balance,
        walletStatus,
        walletType,
        isPublic,
        isDefault,
      ];
}
