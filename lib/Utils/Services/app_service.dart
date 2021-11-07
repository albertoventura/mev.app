import 'package:mev_app/Utils/Helpers/api_helper.dart';
import 'package:mev_app/Utils/Models/exchange_model.dart';
import 'package:mev_app/Utils/Services/api_service.dart';
import 'package:mev_app/Utils/Services/coin_service.dart';
import 'package:mev_app/Utils/Models/coin_model.dart';
import 'package:mev_app/Utils/Services/exchange_service.dart';

class AppService {
  APIHelper apiResponse;
  APIService api = APIService();
  CoinService coins = CoinService();
  ExchangeService exchangeService = ExchangeService();
  List<Exchange> exchanges;

  startApp() {
    print('entrou start app');
    api.getData();
    //api.getDataFake();
  }

  getResponse() {
    return api.getHelper();
  }

  getCoins() {
    return coins.listAll();
  }

  /*
  getData() {
    //this.conversion = this.convertForm.conversion;
    exchangeService.getCurrencyValue();
    //exchanges = exchangeService.getAllConvertion(coins);
  }
  */
  List<Exchange> getExchanges(Coin choosedCoin, List<Coin> coins) {
    apiResponse = getResponse();
    //print(apiResponse.success);
    getConversion(choosedCoin, apiResponse);
    exchanges = exchangeService.getAllConvertion(coins);
    return exchanges;
  }

  getConversion(Coin choosedCoin, APIHelper response) {
    exchangeService.getCurrencyValue(choosedCoin, response);
  }

  /*
  List<Coin> filteringCoins(
      List<Coin> coins, String filterText, List<Coin> filteredCoins) {
    if (coins.isNotEmpty) {
      if (filterText.isNotEmpty) {
        filteredCoins = buildFilteredCoins(coins, filterText, filteredCoins);
      } else {
        filteredCoins = coins;
      }
      return filteredCoins;
    } else {
      return [];
    }
  }

  buildFilteredCoins(
      List<Coin> coins, String filterText, List<Coin> filteredCoins) {
    filteredCoins = [];
    for (Coin coin in coins) {
      String symbol = coin.symbol.toString().toLowerCase();
      String desc = coin.description.toString().toLowerCase();
      if (symbol.contains(filterText.toLowerCase()) ||
          desc.contains(filterText.toLowerCase())) {
        filteredCoins.add(coin);
      }
    }
    return filteredCoins;
  }

  List<Exchange> filteringExchanges(List<Exchange> exchanges, String filterText,
      List<Exchange> filteredExchanges) {
    if (exchanges.isNotEmpty) {
      if (filterText.isNotEmpty) {
        //filteredExchanges = buildFilteredExchanges(exchanges, filterText, filteredExchanges);
        filteredExchanges = buildFiltered(filterText,
            exchanges: exchanges, filteredExchanges: filteredExchanges);
      } else {
        //isEmpty = false;
        filteredExchanges = exchanges;
      }
      return filteredExchanges;
    } else {
      return [];
    }
  }

  buildFilteredExchanges(List<Exchange> exchanges, String filterText,
      List<Exchange> filteredExchanges) {
    filteredExchanges = [];
    for (Exchange exchange in exchanges) {
      String symbol = exchange.symbol.toString().toLowerCase();
      String desc = exchange.description.toString().toLowerCase();
      if (symbol.contains(filterText.toLowerCase()) ||
          desc.contains(filterText.toLowerCase())) {
        filteredExchanges.add(exchange);
      }
    }
    return filteredExchanges;
  }
  */

  filtering(String filterText,
      {List<Coin> coins,
      List<Coin> filteredCoins,
      List<Exchange> exchanges,
      List<Exchange> filteredExchanges}) {
    if (coins.isNotEmpty) {
      //print('@@@@@@@@@@@@@@@@@@@@@@');
      if (filterText.isNotEmpty) {
        filteredCoins = buildFiltered(filterText,
            coins: coins, filteredCoins: filteredCoins);
      } else {
        filteredCoins = coins;
      }
      return filteredCoins;
    } else if (exchanges.isNotEmpty) {
      //print('exchanges *********************');
      if (filterText.isNotEmpty) {
        filteredExchanges = buildFiltered(filterText,
            coins: [],
            exchanges: exchanges,
            filteredExchanges: filteredExchanges);
      } else {
        //isEmpty = false;
        filteredExchanges = exchanges;
      }
      return filteredExchanges;
    } else {
      return [];
    }
  }

  buildFiltered(String filterText,
      {List<Coin> coins,
      List<Coin> filteredCoins,
      List<Exchange> exchanges,
      List<Exchange> filteredExchanges}) {
    if (coins.isNotEmpty) {
      filteredCoins = [];
      for (Coin coin in coins) {
        String symbol = coin.symbol.toString().toLowerCase();
        String desc = coin.description.toString().toLowerCase();
        if (symbol.contains(filterText.toLowerCase()) ||
            desc.contains(filterText.toLowerCase())) {
          filteredCoins.add(coin);
        }
      }
      return filteredCoins;
    } else if (exchanges.isNotEmpty) {
      filteredExchanges = [];
      for (Exchange exchange in exchanges) {
        String symbol = exchange.symbol.toString().toLowerCase();
        String desc = exchange.description.toString().toLowerCase();
        if (symbol.contains(filterText.toLowerCase()) ||
            desc.contains(filterText.toLowerCase())) {
          filteredExchanges.add(exchange);
        }
      }
      return filteredExchanges;
    }
  }
}
