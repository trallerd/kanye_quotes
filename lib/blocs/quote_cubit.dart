import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kenye_app/blocs/quote_cubit_state.dart';
import 'package:kenye_app/data/models/kenye_model.dart';
import 'package:kenye_app/data/repositories/quote_repository_interface.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final QuoteRepositoryInterface _repositoryInterface;

  QuoteCubit(this._repositoryInterface) : super(InicialState()) {
    getQuote();
  }

  Future<KenyeModel?> getQuote() async {
    try {
      emit(LoadingState());
      final quot = await _repositoryInterface.getKenyeQuote();
      emit(SuccessState(quot));
    } on Exception {
      emit(ErrorState());
    }
  }
}
