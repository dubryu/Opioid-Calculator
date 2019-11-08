import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Opioid Calculator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: BarActionWidget(),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Center(
//            child: const Text(_title),
//          ),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.assignment),
//              onPressed: () {
//                _showDialog(context);
//              },
//              //onPressed: () => (_showDialog(context)),
//            ),
//          ],
//        ),
//        body: FormKeyboardActions(
//          child: MyStatefulWidget(),
//        ),
//        //body: MyStatefulWidget(),
//      ),
    );
  }
}

class BarActionWidget extends StatelessWidget {
  static const String _title = 'Opioid Calculator';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(_title),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment),
            onPressed: () {
              //_showDialog(context);
              _showDialog(context);
            },
            //onPressed: () => (_showDialog(context)),
          ),
        ],
      ),
      body: FormKeyboardActions(
        child: MyStatefulWidget(),
      ),
      //body: MyStatefulWidget(),
    );
  }
  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("用量について"),
          content: new Text("メサペイン最大初期量 45mg/日(分3) \n モルヒネ60~160mg/日→ メサペイン15mg/日 \n モルヒネ161~390mg/日→メサペイン30mg/日 \n モルヒネ391~600mg/日→メサペイン45mg/日 \n 高用量モルヒネ(>600mg)  →メサペイン換算比 20:1 \n モルヒネ600mg/日以下　  →メサペイン換算比5~10:1 \n\n 2019/3/120 ver 0.1 Developed By Dr.K.Katayama@TKH \n & KataRysk"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Next page'),
          ),
          body: const Center(
            child: Text(
              'This is the next page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    ));
  }
}
///cupatino picker
class MyStatefulWidget extends StatefulWidget {
  final Widget child;

  MyStatefulWidget({Key key, this.child}) : super(key: key);

  _PickerState createState() => _PickerState();
}

class _PickerState extends State<MyStatefulWidget> {

  String currentOpioid = "select opioid";
  String destOpioid = "select opioid";
  double currentDoseAmount = 0;
  double morAmount = 0;
  final txtController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();

  List<String> items = ["select opioid","経口モルヒネ","モルヒネ注射液原液" ,"モルヒネ注射液2倍希釈",
    "経口オキシコドン","オキファスト原液","オキファスト2倍希釈","オキファスト4倍希釈","フェンタニル原液","フェンタニル5倍希釈","フェントステープ","ナルベイン2倍希釈","ナルベイン5倍希釈","ナルベイン10倍希釈","ナルベイン20倍希釈","経口メサペイン"];
  List<String> destItems = ["select opioid", "モルヒネ注射液原液", "モルヒネ注射液2倍希釈", "経口オキシコドン", "オキファスト原液", "オキファスト2倍希釈", "オキファスト4倍希釈", "フェンタニル原液", "フェンタニル5倍希釈", "フェントステープ", "ナルベイン2倍希釈", "ナルベイン5倍希釈", "ナルベイン10倍希釈", "ナルベイン20倍希釈","経口メサペイン"];

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: _nodeText1,
        ),
      ],
    );
  }
  @override
  void initState(){
    FormKeyboardActions.setKeyboardActions(context, _buildConfig(context));
    super.initState();
  }

  String morCalculate () {
    double _resultNum = 0;
      if( currentOpioid == "select opioid" ){
        _resultNum = 0;
      }else if( currentOpioid == "経口モルヒネ" ){
        _resultNum = currentDoseAmount;
      }else if( currentOpioid == "モルヒネ注射液原液" ){
        _resultNum = currentDoseAmount*480;
      }else if( currentOpioid == "モルヒネ注射液2倍希釈" ){
        _resultNum = currentDoseAmount*240;
      }else if( currentOpioid == "経口オキシコドン" ){
        _resultNum = currentDoseAmount*1.5;
      }else if( currentOpioid == "オキファスト原液" ){
        _resultNum = currentDoseAmount*480;
      }else if( currentOpioid == "オキファスト2倍希釈" ){
        _resultNum = currentDoseAmount*240;
      }else if( currentOpioid == "オキファスト4倍希釈" ){
        _resultNum = currentDoseAmount*120;
      }else if( currentOpioid == "フェンタニル原液" ){
        _resultNum = currentDoseAmount*120;
      }else if( currentOpioid == "フェンタニル5倍希釈" ){
        _resultNum = currentDoseAmount*24;
      }else if( currentOpioid == "フェントステープ" ){
        _resultNum = currentDoseAmount*30;
      }else if( currentOpioid == "ナルベイン2倍希釈" ){
        _resultNum = currentDoseAmount*3000;
      }else if( currentOpioid == "ナルベイン5倍希釈" ){
        _resultNum = currentDoseAmount*1200;
      }else if( currentOpioid == "ナルベイン10倍希釈" ){
        _resultNum = currentDoseAmount*600;
      }else if( currentOpioid == "ナルベイン20倍希釈" ){
        _resultNum = currentDoseAmount*300;
      }else if( currentOpioid == "経口メサペイン" ){
        //_resultNum = currentDoseAmount*20;
        if (currentDoseAmount > 15) {
          _resultNum = pow((currentDoseAmount - 15), 2)/2.3; //元々の20倍から大分ずれてる問題
        }else{
          _resultNum = 0;
        }
      }
    morAmount = _resultNum;
    print("in mor func current opi is $currentOpioid, and morAmount is $morAmount");
    return _resultNum.toString();
  }
  String setCurrentUnit() {
    String unit = '';
    if( currentOpioid == "select opioid" ){
      unit = "mg/day";
    }else if( currentOpioid == "経口モルヒネ" ){
      unit = "mg/day";
    }else if( currentOpioid == "モルヒネ注射液原液" ){
      unit = "ml/hr";
    }else if( currentOpioid == "モルヒネ注射液2倍希釈" ){
      unit = "ml/hr";
    }else if( currentOpioid == "経口オキシコドン" ){
      unit = "mg/day";
    }else if( currentOpioid == "オキファスト原液" ){
      unit = "ml/hr";
    }else if( currentOpioid == "オキファスト2倍希釈" ){
      unit = "ml/hr";
    }else if( currentOpioid == "オキファスト4倍希釈" ){
      unit = "ml/hr";
    }else if( currentOpioid == "フェンタニル原液" ){
      unit = "ml/hr";
    }else if( currentOpioid == "フェンタニル5倍希釈" ){
      unit = "ml/hr";
    }else if( currentOpioid == "フェントステープ" ){
      unit = "mg/day";
    }else if( currentOpioid == "ナルベイン2倍希釈" ){
      unit = "ml/hr";
    }else if( currentOpioid == "ナルベイン5倍希釈" ){
      unit = "ml/hr";
    }else if( currentOpioid == "ナルベイン10倍希釈" ){
      unit = "ml/hr";
    }else if( currentOpioid == "ナルベイン20倍希釈" ){
      unit = "ml/hr";
    }else if( currentOpioid == "経口メサペイン" ){
      unit = "mg/day";
    }
    return unit;
  }
  String doseCalculate () {
    double _resultNum = 0;
    if( destOpioid == "select opioid" ){
      _resultNum = 0;
    }else if( destOpioid == "モルヒネ注射液原液" ){
      _resultNum = morAmount/480;
    }else if( destOpioid == "モルヒネ注射液2倍希釈" ){
      _resultNum = morAmount/240;
    }else if( destOpioid == "経口オキシコドン" ){
      _resultNum = morAmount/1.5;
    }else if( destOpioid == "オキファスト原液" ){
      _resultNum = morAmount/480;
    }else if( destOpioid == "オキファスト2倍希釈" ){
      _resultNum = morAmount/240;
    }else if( destOpioid == "オキファスト4倍希釈" ){
      _resultNum = morAmount/120;
    }else if( destOpioid == "フェンタニル原液" ){
      _resultNum = morAmount/120;
    }else if( destOpioid == "フェンタニル5倍希釈" ){
      _resultNum = morAmount/24;
    }else if( destOpioid == "フェントステープ" ){
      _resultNum = morAmount/30;
    }else if( destOpioid == "ナルベイン2倍希釈" ){
      _resultNum = morAmount/3000;
    }else if( destOpioid == "ナルベイン5倍希釈" ){
      _resultNum = morAmount/1200;
    }else if( destOpioid == "ナルベイン10倍希釈" ){
      _resultNum = morAmount/600;
    }else if( destOpioid == "ナルベイン20倍希釈" ){
      _resultNum = morAmount/300;
    }else if( destOpioid == "経口メサペイン" ){
      //_resultNum = morAmount/20;
      if(morAmount > 0){
        _resultNum = sqrt(morAmount*2.3) + 15;
      }else{
        _resultNum = 0;
      }
    }
    return _resultNum.toString();
  }
  String setDestUnit() {
    String unit = '';
    if( destOpioid == "select opioid" ){
      unit = "mg/day";
    }else if( destOpioid == "経口モルヒネ" ){
      unit = "mg/day";
    }else if( destOpioid == "モルヒネ注射液原液" ){
      unit = "ml/hr";
    }else if( destOpioid == "モルヒネ注射液2倍希釈" ){
      unit = "ml/hr";
    }else if( destOpioid == "経口オキシコドン" ){
      unit = "mg/day";
    }else if( destOpioid == "オキファスト原液" ){
      unit = "ml/hr";
    }else if( destOpioid == "オキファスト2倍希釈" ){
      unit = "ml/hr";
    }else if( destOpioid == "オキファスト4倍希釈" ){
      unit = "ml/hr";
    }else if( destOpioid == "フェンタニル原液" ){
      unit = "ml/hr";
    }else if( destOpioid == "フェンタニル5倍希釈" ){
      unit = "ml/hr";
    }else if( destOpioid == "フェントステープ" ){
      unit = "mg/day";
    }else if( destOpioid == "ナルベイン2倍希釈" ){
      unit = "ml/hr";
    }else if( destOpioid == "ナルベイン5倍希釈" ){
      unit = "ml/hr";
    }else if( destOpioid == "ナルベイン10倍希釈" ){
      unit = "ml/hr";
    }else if( destOpioid == "ナルベイン20倍希釈" ){
      unit = "ml/hr";
    }else if( destOpioid == "経口メサペイン" ){
      unit = "mg/day";
    }
    return unit;
  }
  Widget _buildCurrentItemPicker() {
    return CupertinoPicker(
      itemExtent: 60.0,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (index) {
        setState(() {
          currentOpioid = items[index];
        });
        //一行でかく方法
        //setState(() => currentOpioid = items[index]);
        print(index);
      },

      children: new List<Widget>.generate(items.length, (index) {
        return new Center(child:
        Text(items[index],style: TextStyle(fontSize: 22.0),),
        );
      }),
    );
  }
  Widget _buildDestItemPicker() {
    return CupertinoPicker(
      itemExtent: 60.0,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (index) {
        setState(() {
          destOpioid = destItems[index];
        });
        print(index);
      },
      children: new List<Widget>.generate(destItems.length, (index) {
        return new Center(child:
        Text(destItems[index],style: TextStyle(fontSize: 22.0),),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    //////////////////Cupertino Navigation
    return Center(
      child: Column(
        children:<Widget>[
          SizedBox(
            height: 30.0,
          ),
          Text("現在投与中のオピオイドを選択"),
          SizedBox(
            height: 5.0,
          ),
          CupertinoButton(
            child: Text(currentOpioid),
            color: const Color(0xff6FAFAA),
            onPressed: ()async{
              await showModalBottomSheet<int>(
                context: context,
                builder: (BuildContext context) {
                  return _buildCurrentItemPicker();
                },
              );
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "現在の投与量を入力",
                      hintText: "",
                    ),
                    controller: txtController,
                    keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                    textInputAction: TextInputAction.done,
                    focusNode: _nodeText1,
                    onChanged: (text) {
                      if (text.length > 0) {
                        setState(() {
                          try {
                            this.currentDoseAmount = double.parse(text.toString());
                            print('in text field currentDoseAmount is $currentDoseAmount');
                          } catch (exception) {
                            print(exception);
                          }
                        });
                      }
                      else {
                        setState(() {
                          this.currentDoseAmount = 0;
                          print("input valid amount");
                        });
                      }
                    },
                    onSubmitted: (text) {
//                      if (text.length > 0) {
//                      } else {
//                        print("input valid amount");
//                      }
                    },
                  ),
                ),
                Text(setCurrentUnit()),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "経口モルヒネ換算量",
            //style: TextStyle(fontSize: 25),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    //'Hello, $morAmount! How are you? and another ways is...',
                    morCalculate(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                  "mg",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
//          Text.rich(
//            TextSpan(
//              text: morCalculate(), // default text style
//              children: <TextSpan>[
//                TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
//              ],
//            ),
//          ),
          SizedBox(
            height: 130.0,
          ),
          Text("知りたい等力価オピオイドの種類を選択"),
          SizedBox(
            height: 5.0,
          ),
          CupertinoButton(
            child: Text(destOpioid),
            color: CupertinoColors.activeGreen,
            onPressed: ()async{
              await showModalBottomSheet<int>(
                context: context,
                builder: (BuildContext context) {
                  return _buildDestItemPicker();
                },
              );
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("計算された等力価投与量"),
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(100, 0, 100, 50),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    doseCalculate(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Text(
                  setDestUnit(),
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ] ,
      ),
    );
  }
}