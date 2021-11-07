import 'package:flutter/cupertino.dart';
import 'package:mev_app/Constants/keys.dart';

/**
  * This class build a full url from key.dart
  */
class APIPath {
  final String _BASE_URL =
      'http://data.fixer.io/api/latest?access_key='; //base url for response
  String _KEY; // your key getted from  key class
  Keys key = Keys(); // instance of key class

  /**
   * This method build your full url and verify if has a key, else return ''
   * 
   * @Return String
   */
  String getURL() {
    // if the key is empty return empty, else return full url
    if (key.getKey() == '') {
      return '';
    } else {
      _KEY = key.getKey();
      String allUrl = this._BASE_URL + this._KEY;
      return allUrl;
    }
  }
}
