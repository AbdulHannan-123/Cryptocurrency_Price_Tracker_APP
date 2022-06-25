import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/diffcoins.dart';


const apikey='EE385860-6B85-410A-BD19-867981640C53';
const coinio='https://rest.coinapi.io/v1/exchangerate';




class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String curriencyRate;
  String curriencyRate1;
  String curriencyRate3;
  String selectecCurrency= 'USD';
  String currencycoin;

 


@override
  void initState() {
    super.initState();
    sendText();
    sendText1();
    sendText3();

  }

void sendText()async{
  NetworkArea networkarea = NetworkArea();
    
                  
  networkarea.currencyCoin='BTC';                             //change uooor here;
  networkarea.selectecCurrency=selectecCurrency;
  await networkarea.getData();
  setState(() {
    curriencyRate=networkarea.curriencyRate;
  });

}

void sendText1()async{
  NetworkArea networkarea = NetworkArea();
    
                  
  networkarea.currencyCoin='ETH';                             //change uooor here;
  networkarea.selectecCurrency=selectecCurrency;
  await networkarea.getData();
  setState(() {
    curriencyRate1=networkarea.curriencyRate;
  });

}
void sendText3()async{
  NetworkArea networkarea = NetworkArea();
    
                  
  networkarea.currencyCoin='LTC';                             //change uooor here;
  networkarea.selectecCurrency=selectecCurrency;
  await networkarea.getData();
  setState(() {
    curriencyRate3=networkarea.curriencyRate;
  });

}








  DropdownButton<String> androidDropDown(){

     List<DropdownMenuItem<String>> dropdownittems=[];
    for(String currenciesName in currenciesList){
    //  print(currenciesName);

    var newItem= DropdownMenuItem(child: 
     Text(currenciesName),
     value: currenciesName,
     );
      dropdownittems.add(newItem);
      
  



    }

    return DropdownButton<String>(
              value: selectecCurrency,
              
              items:dropdownittems,
               onChanged: (value){
                print(value);
                setState(() {
                  selectecCurrency=value;
                  sendText();
                  sendText1();
                  sendText3();
                  
                      
                });
               });
  }
   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                   '1 BTC =$curriencyRate  $selectecCurrency',
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
                   '1 ETH =$curriencyRate1  $selectecCurrency',
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
                   '1 LTC =$curriencyRate3 $selectecCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                  
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,




            //////////////////////////////////////////////for android
            child:androidDropDown(), 
          ),
        ],
      ),
    );
  }
}



