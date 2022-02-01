import 'package:kenye_app/data/models/kenye_model.dart';
import 'package:kenye_app/data/repositories/quote_repository_interface.dart';
import 'package:kenye_app/service/http_service.dart';
import 'package:kenye_app/shared/uris.dart';

class QuoteRepository extends QuoteRepositoryInterface {
  final HttpService _httpService;

  QuoteRepository(this._httpService);

  @override
  Future<KenyeModel> getKenyeQuote() async {
    var response = await _httpService.getRequest(Uris.url);
    if (response.success) {
      return KenyeModel.fromJson(response.content!);
    }
    return KenyeModel('quote');
  }
}
