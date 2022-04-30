import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app/posts/models/transaction_models/create_transaction_model.dart';
import 'package:mobile_app/repositories/transaction_repositories/transaction_repository.dart';
import 'package:mobile_app/repositories/wallet_repositories/wallet_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../posts/models/wallet_models/default_active_wallet_model.dart';
import '../posts/models/wallet_models/wallet_model.dart';
part 'send_coins_state.dart';

class SendCoinsCubit extends Cubit<SendCoinsState> {
  late SharedPreferences _prefs;

  SendCoinsCubit() : super(SendCoinsState.initial());

  void sendWalletChange(WalletModel wallet) {
    emit(state.copyWith(
      selectedWalletName: wallet.walletName,
      selectedWalletId: wallet.id,
      selectedWalletBalance: wallet.balance,
      walletSelected: true,
      balanceVisible: false,
    ));
  }

  void recipientWalletChange(DefaultActiveWalletModel receiver) {
    emit(state.copyWith(
      selectedRecipientName: receiver.recipientName,
      selectedRecipientId: receiver.id,
    ));
  }

  void balanceVisibilityChange(bool visibility) {
    if (visibility) {
      emit(state.copyWith(
        balanceVisible: false,
      ));
    } else {
      emit(state.copyWith(
        balanceVisible: true,
      ));
    }
  }

  void amountChange(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(
        amount: -1,
      ));
      return;
    }
    emit(state.copyWith(
      amount: int.parse(value),
      validAmount: int.parse(value) < state._selectedWalletBalance,
    ));
  }

  void descriptionChange(String value) {
    emit(state.copyWith(
      description: value,
    ));
  }

  void getMyWallets() async {
    final List<WalletModel>? _myWallets =
        await WalletRepositoryProvider().getAllWalletsForSpecificUser();
    emit(state.copyWith(
      myWallets: _myWallets,
    ));
  }

  void getReceiverWallets() async {
    final List<DefaultActiveWalletModel>? _receivers =
        await WalletRepositoryProvider().getAllActiveRecipientWallets();
    emit(state.copyWith(
      receivers: _receivers,
    ));
  }

  sendCoins() async {
    bool? isSuccess = false;
    if (!state.isValid) return;
    try {
      _prefs = await SharedPreferences.getInstance();
      var userId = _prefs.getString('userId');
      isSuccess = await TransactionRepositoryProvider().postTransaction(
          CreateTransactionModel(
              state._amount,
              state._description,
              state._selectedWalletId,
              state._selectedRecipientId,
              '00000000-0000-0000-0000-000000000000'));
      emit(
        state.copyWith(status: SendCoinsStatus.success),
      );
      return isSuccess;
    } catch (_) {
      return false;
    }
  }
}
