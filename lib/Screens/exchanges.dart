import 'package:flutter/material.dart';
import 'package:mev_app/Utils/Models/coin_model.dart';
import 'package:mev_app/Utils/Models/exchange_model.dart';
import 'package:mev_app/Utils/Widgets/filter_widget.dart';
import 'package:mev_app/Utils/Widgets/empty_widget.dart';
import 'package:mev_app/Utils/Services/app_service.dart';

/**
  * This class provide a screen with choosed coin and your exchanges
  */
class Exchanges extends StatefulWidget {
  Coin choosedCoin;
  List<Exchange> exchanges;
  Exchanges(this.choosedCoin, this.exchanges);
  @override
  _ExchangesState createState() => _ExchangesState();
}

class _ExchangesState extends State<Exchanges> {
  AppService app = AppService();
  String filterText = '';
  List<Exchange> filteredExchanges = List<Exchange>();
  List<Exchange> exchanges;
  @override
  Widget build(BuildContext context) {
    exchanges = widget.exchanges;
    //filteredExchanges = app.filteringExchanges(exchanges, filterText, filteredExchanges);
    filteredExchanges = app.filtering(filterText,
        coins: [], exchanges: exchanges, filteredExchanges: filteredExchanges);
    String desc = widget.choosedCoin.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.choosedCoin.symbol + ' Exchange Values'),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Text('how much is \n$desc \nin other currency?',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          ),
          filteredExchanges.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      itemCount: filteredExchanges.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            margin: EdgeInsets.all(10.0),
                            child: Row(children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(20.0),
                                height: 20.0,
                                child: Text(filteredExchanges[index].symbol,
                                    style: TextStyle(fontSize: 20.0)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 3),
                                    height: 20.0,
                                    child: Text(
                                        filteredExchanges[index]
                                            .value
                                            .toString(),
                                        style: TextStyle(fontSize: 16.0)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(2, 0, 0, 5),
                                    height: 20.0,
                                    child: Text(
                                        filteredExchanges[index].description,
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.grey)),
                                  ),
                                ],
                              )
                            ]));
                      }))
              : Expanded(child: buildEmpty()),
          buildFilter()
        ],
      )),
    );
  }

  /**
   * This widget show a message when a search return empty
   * 
   * @param isCoin: bool // boolean to identify if the param came from a exchange or home screen
   */
  Widget buildEmpty() => EmptyWidget(false);
  Widget buildFilter() => FilterWidget(searchQuery);
  void searchQuery(String query) {
    setState(() {
      this.filterText = query;
    });
  }
}
