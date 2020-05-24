import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  double rate = 0;
  double ethrate = 0;
  double ltcrate = 0;

  CoinData coinData = CoinData();


  DropdownButton<String> getDropDown() {
    List<DropdownMenuItem<String>> itemDropDown = [];

    for (String currency in currenciesList) {
      var itemWidget = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      itemDropDown.add(itemWidget);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: itemDropDown,
        onChanged: (value) {
          print(value);
          setState(() {
            selectedCurrency = value;
            getCoinRate();
          });
        });
  }

  CupertinoPicker getIosPicker() {
   List<Text> pickerItems = [];
   for (String currency in currenciesList) {
     var items = Text(currency);
     pickerItems.add(items);
   }
   return CupertinoPicker(
       itemExtent: 45,
       onSelectedItemChanged: (selectedIndex) {
         print(selectedIndex);
         setState(() {
           selectedCurrency = currenciesList[selectedIndex];
           getCoinRate();
         });
       },
       children: pickerItems
   );
 }

  Future getCoinRate() async{
    try{
      var coinRate = await coinData.getCoinData(selectedCurrency);
      var coinRate2 = await coinData.getCoinData2(selectedCurrency);
      var coinRate3 = await coinData.getCoinData3(selectedCurrency);


      print(coinRate['rate']);
      setState(() {
        rate = coinRate['rate'];
        ethrate = coinRate2['rate'];
        ltcrate = coinRate3['rate'];
      });
    }catch(e){
      print(e);
    }

  }


  @override
  void initState() {
    getCoinRate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $rate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $ethrate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $ltcrate $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: (Platform.isIOS) ? getIosPicker() : getDropDown(),
          ),
        ],
      ),
    );
  }
}
