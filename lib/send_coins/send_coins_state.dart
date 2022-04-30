part of 'send_coins_cubit.dart';

enum SendCoinsStatus { initial, success, fail }

class SendCoinsState extends Equatable {
  final String _selectedWalletName;
  final String _selectedWalletId;
  final int _selectedWalletBalance;
  final String _selectedRecipientName;
  final String _selectedRecipientId;
  final int _amount;
  final String _description;
  final SendCoinsStatus _status;
  bool walletSelected = false;
  bool validAmount = true;
  final List<WalletModel> _myWallets;
  final List<DefaultActiveWalletModel> _receivers;
  bool balanceVisible = false;

  SendCoinsState(
    this._selectedWalletName,
    this._selectedWalletId,
    this._selectedWalletBalance,
    this._selectedRecipientName,
    this._selectedRecipientId,
    this._amount,
    this._description,
    this._status,
    this.walletSelected,
    this.validAmount,
    this._myWallets,
    this._receivers,
    this.balanceVisible,
  );

  factory SendCoinsState.initial() {
    return SendCoinsState("", "", -1, "", "", -1, "", SendCoinsStatus.initial,
        false, true, List.empty(), List.empty(), false);
  }

  SendCoinsState copyWith({
    String? selectedWalletName,
    String? selectedWalletId,
    int? selectedWalletBalance,
    String? selectedRecipientName,
    String? selectedRecipientId,
    int? amount,
    String? description,
    SendCoinsStatus? status,
    bool? walletSelected,
    bool? validAmount,
    List<WalletModel>? myWallets,
    List<DefaultActiveWalletModel>? receivers,
    bool? balanceVisible,
  }) {
    return SendCoinsState(
      selectedWalletName ?? _selectedWalletName,
      selectedWalletId ?? _selectedWalletId,
      selectedWalletBalance ?? _selectedWalletBalance,
      selectedRecipientName ?? _selectedRecipientName,
      selectedRecipientId ?? _selectedRecipientId,
      amount ?? _amount,
      description ?? _description,
      status ?? _status,
      walletSelected ?? this.walletSelected,
      validAmount ?? this.validAmount,
      myWallets ?? _myWallets,
      receivers ?? _receivers,
      balanceVisible ?? this.balanceVisible,
    );
  }

  bool get isValid =>
      _selectedWalletName.isNotEmpty &&
      _selectedWalletId.isNotEmpty &&
      _selectedRecipientName.isNotEmpty &&
      _selectedRecipientId.isNotEmpty &&
      _amount > 0 &&
      _amount < _selectedWalletBalance &&
      _description.isNotEmpty;

  bool get isValidAmount => _amount < _selectedWalletBalance && _amount > 0;

  @override
  List<Object> get props => [
        _selectedWalletName, //0
        _selectedWalletId, //1
        _selectedWalletBalance, //2
        _selectedRecipientName, //3
        _selectedRecipientId, //4
        _amount, //5
        _description, //6
        _status, //7
        walletSelected, //8
        validAmount, //9
        _myWallets, //10
        _receivers, //11
        balanceVisible, //12
      ];
}
