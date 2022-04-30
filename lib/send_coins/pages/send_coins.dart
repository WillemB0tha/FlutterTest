import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/common/app_bar.dart';
import 'package:mobile_app/common/integer_input.dart';
import 'package:mobile_app/common/primary_button.dart';
import 'package:mobile_app/common/text_input.dart';
import 'package:mobile_app/common/form_title.dart';
import 'package:mobile_app/send_coins/pages/confirm.dart';
import 'package:mobile_app/send_coins/send_coins_cubit.dart';

import '../../posts/models/wallet_models/default_active_wallet_model.dart';
import '../../posts/models/wallet_models/wallet_model.dart';

class SendCoinsPage extends StatefulWidget {
  const SendCoinsPage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SendCoinsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendCoinsCubit, SendCoinsState>(
        bloc: context.read<SendCoinsCubit>(),
        builder: (context, state) {
          context.read<SendCoinsCubit>().getMyWallets();
          context.read<SendCoinsCubit>().getReceiverWallets();
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 66, 16, 32),
                  child: Column(
                    children: [
                      PageAppBar(
                          title: "Send Coins",
                          path: "assets/icons/sendCoinsIcon.svg"),
                      SizedBox(height: 24),
                      _myWallet(),
                      SizedBox(
                        height: 36,
                      ),
                      _recipient(),
                      SizedBox(
                        height: 36,
                      ),
                      _description(),
                      SizedBox(
                        height: 36,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: PrimaryButton(
                            caption: "Next",
                            onClick:
                                context.read<SendCoinsCubit>().state.isValid
                                    ? () {
                                        confirm(context);
                                      }
                                    : null,
                            buttonColor: Color.fromRGBO(10, 132, 255, 1),
                            textColor: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget _myWallet() {
    final SendCoinsCubit _coinsCubit = BlocProvider.of<SendCoinsCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Wallet",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(83, 83, 83, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            Visibility(
                visible: _coinsCubit.state.walletSelected,
                child: Row(
                  children: [
                    Visibility(
                      visible: _coinsCubit.state.walletSelected &&
                          _coinsCubit.state.balanceVisible,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(255, 159, 10, 1),
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: _coinsCubit.state.props[2].toString() +
                                  ' Coins',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            TextSpan(text: ' Avaialble'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    IconButton(
                      icon: (_coinsCubit.state.balanceVisible)
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      alignment: Alignment.center,
                      iconSize: 20,
                      color: Color.fromRGBO(255, 159, 10, 1),
                      padding: const EdgeInsets.all(1.1),
                      constraints:
                          new BoxConstraints(minWidth: 20, maxHeight: 20),
                      onPressed: () {
                        context.read<SendCoinsCubit>().balanceVisibilityChange(
                            _coinsCubit.state.balanceVisible);
                      },
                    ),
                  ],
                )),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        _dropdownWallets(
            "Select wallet", _coinsCubit.state.props[10] as List<WalletModel>),
      ],
    );
  }

  Widget _recipient() {
    final SendCoinsCubit _coinsCubit = BlocProvider.of<SendCoinsCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitle(text: "Recipient"),
        _dropdownReceivers("Select recipient",
            _coinsCubit.state.props[11] as List<DefaultActiveWalletModel>),
        SizedBox(height: 26),
        Visibility(
            visible: !_coinsCubit.state.validAmount &&
                _coinsCubit.state.walletSelected,
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'Insufficient Balance',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
        IntegerInput(
          hint: "Amount",
          onchange: (value) {
            context.read<SendCoinsCubit>().amountChange(value);
          },
        ),
      ],
    );
  }

  Widget _description() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      FormTitle(text: "Transaction Detail"),
      TextInput(
        hint: "Decription",
        onchange: (value) {
          context.read<SendCoinsCubit>().descriptionChange(value);
        },
      )
    ]);
  }

//components:
  Widget _dropdownWallets(String hint, List<WalletModel> dropdownItems) {
    return SingleChildScrollView(
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.5),
        )),
        hint: Text(
          hint,
        ),
        icon: const Icon(
          Icons.expand_more,
          color: Color.fromRGBO(151, 151, 151, 1),
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5),
        ),
        items: dropdownItems
            .map((item) => DropdownMenuItem<WalletModel>(
                  value: item,
                  child: Text(
                    item.walletName,
                  ),
                ))
            .toList(),
        onChanged: (value) {
          context.read<SendCoinsCubit>().sendWalletChange(value as WalletModel);
        },
      ),
    );
  }

  Widget _dropdownReceivers(
      String hint, List<DefaultActiveWalletModel> dropdownItems) {
    return SingleChildScrollView(
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.5),
        )),
        hint: Text(
          hint,
        ),
        icon: const Icon(
          Icons.expand_more,
          color: Color.fromRGBO(151, 151, 151, 1),
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5),
        ),
        items: dropdownItems
            .map((item) => DropdownMenuItem<DefaultActiveWalletModel>(
                  value: item,
                  child: Text(
                    item.recipientName,
                  ),
                ))
            .toList(),
        onChanged: (value) {
          context
              .read<SendCoinsCubit>()
              .recipientWalletChange(value as DefaultActiveWalletModel);
        },
      ),
    );
  }

//functions
  void confirm(BuildContext context) {
    final SendCoinsCubit _coinsCubit = BlocProvider.of<SendCoinsCubit>(context);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            BlocProvider.value(value: _coinsCubit, child: ConfirmPage())));
  }
}
