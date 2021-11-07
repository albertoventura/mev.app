import 'package:mev_app/Utils/Helpers/api_helper.dart';
import 'package:mev_app/Utils/Models/coin_model.dart';
import 'package:mev_app/Utils/Models/exchange_model.dart';

class ExchangeService {
  List<Exchange> exchanges;
  double currencyValue;
  String choosedCurrency;
  APIHelper responseBase;
  String _currentDescription;

  setCurrency(String currency) {
    choosedCurrency = currency;
  }

  /**
   * This method is responsible get the conversion from getCurrencyValue in ConverterService
   */
  getCurrencyValue(Coin choosedCoin, APIHelper responseBase) {
    this.responseBase = responseBase;
    currencyValue = _getCurrencyValue(choosedCoin.symbol, responseBase);
    //print('AAAAA $currencyValue');
    //currencyValue = _getCurrencyValue(choosedCurrency, responseBase);
    //console.log('1 '+ this.conversion.baseCurrency +' = '+this.currencyValue+' EUR');
  }

  /**
   * This method is responsible get a value of choosed currency from Euro base
   * Ex: How much is 1 BRL value(choose currency) in Euro?
   *
   * @param baseCurrency string
   * @param response ConversionResponse
   * @return double
   */
  double _getCurrencyValue(String baseCurrency, APIHelper response) {
    return (1 / response.rates.toJson()[baseCurrency]);
  }

  /**
   * This method is responsible to get a value of choose currency multiplying with Euro based rate
   *
   * @param currencyValue number
   * @param rateValue number
   * @return double
   */
  double _getCurrencyValueConverter(double currencyValue, double rateValue) {
    //print('%%%%%%%%%%%%');
    return (currencyValue * rateValue);
  }

  /**
   * This method is responsible to build all rates choosed currency from Euro base calculation
   */
  List<Exchange> getAllConvertion(List<Coin> coins) {
    //print('!!!');
    exchanges = [];
    for (int index = 0; index < coins.length; index++) {
      //print('@@@@');
      Exchange exchange = new Exchange();
      exchange.symbol = coins[index].symbol;
      //print('###');
      exchange.description = coins[index].description;
      //print('%%%');
      //print(responseBase.rates.toJson()[coins[index].symbol]);
      //print('%%%');
      exchange.value = _getCurrencyValueConverter(this.currencyValue,
          this.responseBase.rates.toJson()[coins[index].symbol]);
      //print(exchange);
      exchanges.add(exchange);

      if (coins[index].symbol == choosedCurrency)
        _currentDescription = coins[index].description;
    }
    return exchanges;
  }

  String getChoosedCurrencyDescription() {
    return _currentDescription;
  }
}
