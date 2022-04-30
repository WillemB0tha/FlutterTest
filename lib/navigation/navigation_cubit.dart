import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'constants/navigation_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavigationItems.home, 0));

  void getNavBarItem(NavigationItems navbarItem) {
    switch (navbarItem) {
      case NavigationItems.home:
        emit(NavigationState(NavigationItems.home, 0));
        break;
      case NavigationItems.wallets:
        emit(NavigationState(NavigationItems.wallets, 1));
        break;
      case NavigationItems.transfer:
        emit(NavigationState(NavigationItems.transfer, 2));
        break;
      case NavigationItems.history:
        emit(NavigationState(NavigationItems.history, 3));
        break;
      case NavigationItems.more:
        emit(NavigationState(NavigationItems.more, 4));
        break;
    }
  }
}
