import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/common/back_app_bar.dart';
import 'package:mobile_app/common/confirm_text.dart';
import 'package:mobile_app/common/confirm_title.dart';
import 'package:mobile_app/common/primary_button.dart';
import 'package:mobile_app/common/seperator.dart';
import 'package:mobile_app/home/pages/home_page.dart';

import '../../navigation/constants/navigation_items.dart';
import '../../navigation/navigation_cubit.dart';
import '../send_coins_cubit.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    final SendCoinsCubit sendCoinsCubit =
        BlocProvider.of<SendCoinsCubit>(context);
    return Scaffold(
      appBar: BackAppBar(),
      body: BlocBuilder<SendCoinsCubit, SendCoinsState>(
          bloc: sendCoinsCubit,
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 25, 16, 58),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SvgPicture.asset(
                            "assets/icons/sendCoinsIcon.svg",
                            height: 120,
                          ),
                        ),
                        SizedBox(height: 24),
                        Align(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Color.fromRGBO(10, 132, 255, 1),
                                fontWeight: FontWeight.w400,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'You are about to send'),
                                TextSpan(
                                  text: ' ' +
                                      state.props[5].toString() +
                                      ' Coins',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        _from(state.props[0].toString()),
                        _to(state.props[3].toString(),
                            state.props[5].toString()),
                        _description(state.props[6].toString()),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: PrimaryButton(caption: "Send Coins", onClick: () {send(context);}, buttonColor: Color.fromRGBO(10, 132, 255, 1), textColor: Color.fromRGBO(255, 255, 255, 1),),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }

  Widget _from(String sender) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConfirmTitle(text: "From"),
        ConfirmText(text: sender),
        Seperator(),
      ],
    );
  }

  Widget _to(String receiver, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConfirmTitle(text: "To"),
        ConfirmText(text: receiver),
        ConfirmTitle(text: "Amount"),
        Row(
          children: [
            Text(
              amount,
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(83, 83, 83, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 2,
            ),
            SvgPicture.asset(
              "assets/icons/currencyIcon.svg",
              height: 12,
            ),
          ],
        ),
        SizedBox(height: 24),
        Seperator(),
      ],
    );
  }

  Widget _description(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConfirmTitle(text: "Description",),
        ConfirmText(text: description),
        Seperator(),
      ],
    );
  }

//functions
  void send(BuildContext context) {
    final SendCoinsCubit sendCoinsCubit =
        BlocProvider.of<SendCoinsCubit>(context);
    sendCoinsCubit.sendCoins().toString();
    Navigator.pop(context);
    BlocProvider.of<NavigationCubit>(context)
        .getNavBarItem(NavigationItems.home);
  }
}
