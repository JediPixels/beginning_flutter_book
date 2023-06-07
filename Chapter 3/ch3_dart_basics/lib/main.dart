import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dart Basics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dart Basics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _log = '';

  void _updateLog(String finalLog) {
    setState(() {
      _log = finalLog;
    });
  }

  void _dartFun() {
    // Clear _log and show the Date and Time, just for fun
    _log = '\n' + DateTime.now().toString();

    // Lists - In Dart List is an array
    List listOfFilters = ['company', 'city', 'state'];
    listOfFilters.forEach((filter) {
      _log += '\n$filter'; // \n is a Carriage Return to place value in next line
      print('filter: $filter');
    });

    // Key: Value - 'KeyValue': 'Value'
    Map mapOfFilters = {'id1': 'company', 'id2': 'city', 'id3': 'state'};
    mapOfFilters['id3'] = 'my filter';
    _log += '\nGet filter with id1: ${mapOfFilters['id3']}';
    print('Get filter with id1: ${mapOfFilters['id3']}');

    for (int i = 0; i < listOfFilters.length; i++) {
      _log += '\nlistOfFilters: ${listOfFilters[i]}';
      print('listOfFilters: ${listOfFilters[i]}');
    }

    List listOfNumbers = [10, 20, 30];
    for (int number in listOfNumbers) {
      _log += '\nnumber: $number';
      print('number: $number');
    }

//      String coffee = 'espresso';
//      switch (coffee) {
//        case 'flavored':
//          orderFlavored();
//          break;
//        case 'dark-roast':
//          orderDarkRoast();
//          break;
//        case 'espresso':
//          orderEspresso();
//          break;
//        default:
//          orderNotAvailable();
//      }

    // Function - pass value and return value
    bool orderEspresso(int howManyCups) {
      _log += '\nCups #: $howManyCups';
      print('Cups #: $howManyCups');
      return true;
    }
    bool isOrderDone = orderEspresso(3);
    _log += '\nOrder Done: $isOrderDone';
    print('Order Done: $isOrderDone');

    // Function - pass optional value and return value
    bool orderEspresso1([int howManyCups]) {
      _log += '\nCups #: $howManyCups';
      print('Cups #: $howManyCups');
      bool ordered = false;
      if (howManyCups != null) {
        ordered = true;
      }
      return ordered;
    }
    bool isOrderDone1 = orderEspresso1();
    _log += '\nOrder Done1: $isOrderDone1';
    print('Order Done1: $isOrderDone1');


    // Create Class without Constructor
    BaristaNoConstructor baristaNoConstructor = BaristaNoConstructor();
    baristaNoConstructor.experience = 10;
    _log += '\nbaristaNoConstructor.experience: ${baristaNoConstructor.experience}';
    print('baristaNoConstructor.experience: ${baristaNoConstructor.experience}');

    // Create Class with Constructor and return value
    BaristaWithConstructor barista = BaristaWithConstructor(name: 'Sandy', experience: 10);
    int experienceByProperty = barista.experience;
    int experienceByFunction = barista.whatIsTheExperience();
    _log += '\nexperienceByProperty: $experienceByProperty';
    _log += '\nexperienceByFunction: $experienceByFunction';
    print('experienceByProperty: $experienceByProperty');
    print('experienceByFunction: $experienceByFunction');

    // Inheritance - extend
    BaristaLevel baristaLevel = BaristaLevel(name: 'Hey', level: 15); // Pass name because we made it in the parent class @required :)
    _log += '\nbaristaLevel.level: ${baristaLevel.level}';
    _log += '\nbaristaLevel.experience: ${baristaLevel.experience}';
    print('baristaLevel.level: ${baristaLevel.level}');
    print('baristaLevel.experience: ${baristaLevel.experience}');

    // Update Log File
    _updateLog(_log);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Log:',
              ),
              Text(
                '$_log',
                style: Theme.of(context).textTheme.body1,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _dartFun,
        tooltip: 'Dart Fun - See Results in Console',
        child: Icon(Icons.functions),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Dart Playground Classes
Widget _customThemeUnique() {
  return Theme(
    // Unique theme with ThemeData - Overwrite
    data: ThemeData(
      cardColor: Colors.deepOrange,
    ),
    child: Card(child: Text('Unique ThemeData'),),
  );
}

Widget _customThemeExtend(BuildContext context) {
  return Theme(
    // copyWith Theme - Inherit
    data: Theme.of(context).copyWith(cardColor: Colors.deepOrange),
    child: Card(child: Text('copyWith Theme'),),
  );
}

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('When using a StatelessWidget...');
  }
}

class MaximumBid extends StatefulWidget {
  @override
  _MaximumBidState createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  double _maxBid = 0.0;

  void _increaseMyMaxBid() {
    setState(() {
      // Add $50 to my current bid
      _maxBid += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('My Maximum Bid: $_maxBid'),
        FlatButton.icon(
          onPressed: () => _increaseMyMaxBid(),
          icon: Icon(Icons.add_circle),
          label: Text('Increse Bid'),
        ),
      ],
    );
  }
}

// Class Default Constructor
class BaristaNoConstructor {
  String name;
  int experience;
}

// Class with Named Constructor
class BaristaWithConstructor {
  String name;
  int experience;

  // Constructor
  BaristaWithConstructor({this.name, this.experience}) : assert(name != null);

  // Method - return value
  int whatIsTheExperience() {
    return experience;
  }
}

class BaristaLevel extends BaristaWithConstructor {
  int level;

  BaristaLevel({name, experience, this.level}) : super(name: name, experience: experience);
}

// Async
Future<int> totalCookiesCount() async {
  int cookiesCount = await lookupTotalCookiesCountDatabase(); // Returns 33
  return 33;
}

// Async method to call web server
Future lookupTotalCookiesCountDatabase() async {
  // In a real world app we call the web server to retrieve live data
  return 33;
}

// Below are the Console Log Results when you press the
//flutter: filter: company
//flutter: filter: city
//flutter: filter: state
//flutter: Get filter with id1: my filter
//flutter: listOfFilters: company
//flutter: listOfFilters: city
//flutter: listOfFilters: state
//flutter: number: 10
//flutter: number: 20
//flutter: number: 30
//flutter: Cups #: 3
//flutter: Order Done: true
//flutter: Cups #: null
//flutter: Order Done1: false
//flutter: baristaNoConstructor.experience: 10
//flutter: experienceByProperty: 10
//flutter: experienceByFunction: 10
//flutter: baristaLevel.level: 15
//flutter: baristaLevel.experience: null // It's null because we did not enter a value
//Application finished.