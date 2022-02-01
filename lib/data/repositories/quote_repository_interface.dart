import 'package:kenye_app/data/models/kenye_model.dart';

abstract class QuoteRepositoryInterface {
  Future<KenyeModel> getKenyeQuote();
}
