import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());


  int counter = 0;

  incrementCounter() {
    print(counter);
      counter++;


    emit(Increment());
  }


}
