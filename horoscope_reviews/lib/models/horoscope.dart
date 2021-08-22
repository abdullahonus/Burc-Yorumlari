// ignore_for_file: unused_field, unnecessary_this

class Horoscope {
  final String _horoscopeName;
  final String _horoscopeDate;
  final String _horoscopeDetails;
  final String _horoscopeSmallImage;
  final String _horoscopeBigImage;
  get horoscopeName => this._horoscopeName;

  get horoscopeDate => this._horoscopeDate;

  get horoscopeDetails => this._horoscopeDetails;

  get horoscopeSmallImage => this._horoscopeSmallImage;

  get horoscopeBigImage => this._horoscopeBigImage;

  Horoscope(this._horoscopeName, this._horoscopeDate, this._horoscopeDetails,
      this._horoscopeSmallImage, this._horoscopeBigImage);
  @override
  String toString() {
    return "$_horoscopeName - $_horoscopeDate";
  }
}
