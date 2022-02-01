class KenyeModel {
  final String quote;

  KenyeModel(this.quote);

  factory KenyeModel.fromJson(Map<String, dynamic> json) {
    return KenyeModel(json['quote']!);
  }
}
