import 'package:flutter/material.dart';
import 'package:mev_app/Screens/exchanges.dart';
import 'package:mev_app/Utils/Models/coin_model.dart';
import 'package:mev_app/Utils/Models/exchange_model.dart';
import 'package:mev_app/Utils/Services/app_service.dart';
import 'package:mev_app/Utils/Widgets/filter_widget.dart';
import 'package:mev_app/Utils/Widgets/empty_widget.dart';

/**
  * This class provide a screen for choose a coin for see your exchanges
  */
class Home extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Home> {
  String filterText = '';
  //bool isFav = false;
  //bool isEmpty = false;
  AppService app = AppService();
  List<Coin> coins = List<Coin>();
  List<Coin> filteredCoins = List<Coin>();
  //final filterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    app.startApp();
    if (coins.isEmpty) {
      coins = app.getCoins();
    }
    //app.startApp();
    //filteredCoins = app.filteringCoins(coins, filterText, filteredCoins);
    filteredCoins =
        app.filtering(filterText, coins: coins, filteredCoins: filteredCoins);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("MEV app"),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        filteredCoins.isNotEmpty
            ? Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2.2),
                    itemCount: filteredCoins.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: Row(children: <Widget>[
                        Expanded(
                          child: buildCoin(index, false, filteredCoins),
                        ),
                        //favButton(index, false, coins: filteredCoins)
                      ]));
                    }),
              )
            : Expanded(child: buildEmpty()),
        buildFilter()
      ]),
    );
  }

  /**
   * This widget build the coins with values to show
   * 
   * @param index: number // index of GridView   
   * @param coins : Coin // list of coin or filtered coin
   */
  Widget buildCoin(int index, bool isFav, List<Coin> coins) => ListTile(
        title: Text(coins[index].symbol),
        subtitle: Text(coins[index].description),
        onTap: () {
          goToExchangeScreen(coins[index]);
        },
      );
  /**
   * This widget build a text field for search a coin/exchange
   * 
   * @param searchQuery: String // query
   */
  Widget buildFilter() => FilterWidget(searchQuery);

  /**
   * This widget show a message when a search return empty
   * 
   * @param isCoin: bool // boolean to identify if the param came from a exchange or home screen
   */
  Widget buildEmpty() => EmptyWidget(true);

  void searchQuery(String query) {
    setState(() {
      this.filterText = query;
    });
  }

  goToExchangeScreen(Coin choosedCoin) {
    List<Exchange> exchanges = List<Exchange>();
    exchanges = app.getExchanges(choosedCoin, coins);
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Exchanges(choosedCoin, exchanges)));
    });
  }
}
