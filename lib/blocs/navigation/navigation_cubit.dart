import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upcarta_mobile_app/blocs/navigation/constants/nav_bar_items.dart';
import 'package:upcarta_mobile_app/ui/screens/screens.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationInitial(NavbarItem.home, 0));
        break;
      case NavbarItem.explore:
        emit(NavigationInitial(NavbarItem.explore, 1));
        break;
      case NavbarItem.newItem:
        emit(NavigationInitial(NavbarItem.newItem, 2));
        break;
      case NavbarItem.myLibrary:
        emit(NavigationInitial(NavbarItem.myLibrary, 3));
        break;
      case NavbarItem.search:
        emit(NavigationInitial(NavbarItem.search, 4));
        break;
      default:
    }
  }
}
