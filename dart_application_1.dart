import 'package:dart_application_1/dart_application_1.dart' as dart_application_1;

void main(List<String> arguments) {
  print('1 Printer Errors: ${printerError("aaaxbbbbyyhwawiwjjjwwm")}');

  print("2 Exes and Ohs: ${XO("sxdfafO")}");

  print("3 Remove Duplicates: ${caseNormalize('coDe')}");

  print("4 Fix String Case: ${removeDuplicates([3, 4, 4, 3, 6, 3])}");
  
  print("5 Valid Spacing: ${valid_spacing('as s d sd f')}");

  print("6 Row Weights: ${rowWeights([50, 60, 70, 80])}");

  print("7 Valid Spacing: ${duplicateCount("aabBcde")}");

  print("8 Cashier: ${getOrder("milkshakepizzachickenfriescokeburgerpizzasandwichmilkshakepizza")}");

  print("9 Meeting: ${meeting("Fred:Corwill;Wilfred:Corwill;Barney:Tornbull;Betty:Tornbull;Bjon:Tornbull;Raphael:Corwill;Alfred:Corwill")}");
}
// 1 Printer Errors
String printerError(String s){
  var error = [for (var i in s.split('')) if(!RegExp('[a-m]').hasMatch(i)){ i }];
  return error.length.toString() + '/' + s.length.toString();
}

// 2 Exes and Ohs
bool XO(String s){
  var counter = s.toLowerCase().split('').fold({}, (map, i) {
  map[i] = (map[i] ?? 0) + 1;
  return map;
  });
return counter['x'] == counter['o'] ;
}
int Function(int x) f = (int x) {return 1 + x;};

// 3 Remove Duplicates
List removeDuplicates(List input){
  var output = [];
  var mapper = input.fold({}, (map, i) {
  map[i] =  (map[i] ?? 0) + 1;
  return map;
  });
  for (var x in input){ if(mapper[x] > 1) mapper[x]--; else output.add(x); }
  return output;
}

// 4 Fix String Case
bool islowerCased(String s){
  return s == s.toLowerCase();
}

int capitalCounter(String s) {return s.replaceAll(' ', '').split('').fold(0, (counter, element) {
    if(islowerCased(element)) {counter--;} else {counter++; };
    return counter;
  });}

String caseNormalize(String s){
 if(capitalCounter(s) <= 0 ){ return s.toLowerCase();} else { return s.toUpperCase();}
}

// 5 Valid Spacing
bool valid_spacing(String text) => text.trim().split(RegExp(r"\s+")).join(" ") == text;


// 6 Row Weights
List<int> rowWeights(List<int> arr) { 
  List<int> output = [0,0];
  arr.asMap().forEach((key, value) {  ( key%2 != 0 ) ? output[1] = output[1] + value : output[0] = output[0] + value ;});
  return output;
}

// 7 Counting Duplicates
int duplicateCount(String text){
  var mapper = text.toLowerCase().split('').fold({}, (map, i) {
  map[i] =  (map[i] ?? 0) + 1;
  return map;
  });
  mapper.removeWhere((key, value) => value == 1 );
  return mapper.length;
}

// 8 Cashier
String getOrder(String input) {
  final menuDishes = [ "Burger", "Fries", "Chicken", "Pizza", "Sandwich", "Onionrings", "Milkshake", "Coke"].asMap();    
  var output = '';
   menuDishes.forEach((key, value) { var temp = input.replaceAll(value.toLowerCase()
   , ''); 
   if(temp != input){
    var count = ((input.length - temp.length) / (value.length)).floor(); 
    output = output + (value + ' ') * count ;
    input = temp;
   }});
  return output.trim();
}

// 9 Meeting
String meeting(String s) {
  return s.toUpperCase().split(';').fold<List<Map>>([], (list, item){
    list.add({'first':item.split(':')[1], 'second': item.split(':')[0]});
    return list..sort((a, b) => a['first'] != b['first'] ? a['first'].compareTo(b['first']) :  a['second'].compareTo(b['second']) );
  }).fold([], (meeting, pair){
    meeting.add(pair.values.toString());
    return meeting;
  }).join("");
}