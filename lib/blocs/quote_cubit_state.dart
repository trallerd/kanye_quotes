import 'package:kenye_app/data/models/kenye_model.dart';

class QuoteState {
  KenyeModel get quote => KenyeModel('');
}

class InicialState extends QuoteState {
  @override
  KenyeModel get quote => KenyeModel('');
}

class LoadingState extends QuoteState {
  @override
  KenyeModel get quote => KenyeModel('');
}

class ErrorState extends QuoteState {
  @override
  KenyeModel get quote => KenyeModel('');
}

class SuccessState extends QuoteState {
  final KenyeModel quot;

  SuccessState(this.quot);

  @override
  KenyeModel get quote => quot;
}