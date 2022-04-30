import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app/home/pages/home_page.dart';
import 'package:mobile_app/send_coins/pages/send_coins.dart';
import 'package:mobile_app/navigation/constants/navigation_items.dart';
import 'package:mobile_app/send_coins/send_coins_cubit.dart';
import 'package:mobile_app/wallet/pages/wallet_page.dart';

import '../../transaction/pages/transaction_page.dart';
import '../navigation_cubit.dart';

class RootPage extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                label: 'Wallets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.send),
                label: 'Send Coins',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/historyIcon.svg",
                  color: Colors.grey,),
                activeIcon: SvgPicture.asset("assets/icons/historyIcon.svg",
                  color: Colors.blue,
                ),
                label: 'History',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.more_horiz),
              //   label: 'More',
              // ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavigationItems.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavigationItems.wallets);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavigationItems.transfer);
              } else if (index == 3) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavigationItems.history);
              } else if (index == 4) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavigationItems.more);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavigationItems.home) {
          return HomePage();
        } else if (state.navbarItem == NavigationItems.transfer) {
          return BlocProvider(
            create: (context) => SendCoinsCubit(),
            child: SendCoinsPage()
          );
        } else if (state.navbarItem == NavigationItems.wallets) {
          return WalletPage();
        } else if (state.navbarItem == NavigationItems.history) {
          return TransactionPage(); 
        }
        // else if (state.navbarItem == NavigationItems.more) {
        //   return ;
        // }
        return Container();
      }),
    );
  }
}
