import 'package:covid19_tracker/UI/data.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/Backend/BackendData.dart';
import 'package:http/http.dart'as http;
import 'package:covid19_tracker/UI/template.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data data = new  Data();
  List<String> statelist=
  ['Total', 'Maharashtra', 'Tamil Nadu', 'Delhi', 'Gujarat', 'Rajasthan', 'Madhya Pradesh',
   'Uttar Pradesh', 'West Bengal', 'State Unassigned', 'Bihar', 'Andhra Pradesh', 'Karnataka', 'Telangana', 'Punjab',
    'Jammu and Kashmir', 'Odisha', 'Haryana', 'Kerala', 'Assam', 'Uttarakhand', 'Jharkhand', 'Chhattisgarh', 'Himachal Pradesh',
     'Chandigarh', 'Tripura', 'Ladakh', 'Goa', 'Manipur', 'Puducherry', 'Nagaland', 'Andaman and Nicobar Islands', 'Meghalaya',
      'Arunachal Pradesh', 'Dadra & Nagar Haveli and Daman & Diu', 'Mizoram', 'Sikkim', 'Lakshadweep'];
  var currentItemSelected='Total';
  String confirmed='',active='',fatalities='',recovered='',date='';
  bool loading = true;

void fetch() async
{
  http.Response response =  await http.get('https://api.covid19india.org/data.json');
  String jsonString =  response.body;
  data = dataFromJson(jsonString);
  loading=false;
}

@override
  void initState() {
    super.initState();
    fetch();
  }
  @override
  Widget build(BuildContext context) 
  {
    return
      Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
      child: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            Neumorphic(
              
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
  style: NeumorphicStyle(
    shape: NeumorphicShape.concave,
    depth: 2,
    lightSource: LightSource.topLeft,
    color: AppColors.primaryWhite,
    
    
  ),
  child: SearchableDropdown.single
  (
    menuBackgroundColor: AppColors.primaryWhite,
    items:statelist.map
    (
      (String value){
            return DropdownMenuItem<String>
            (
              value: value,
              child: Text(value,style: TextStyle(fontWeight: FontWeight.w500),),
              );
                                }
                            ).toList(),
                            hint: "Select State",
                            searchHint: null,
                            onChanged: (String newItemSelected) {
                updateValue(statelist.indexOf(newItemSelected),newItemSelected);
                },
                value: currentItemSelected,

                dialogBox: false,
                isExpanded: true,
                displayClearIcon: false,
                menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
                ),
            ),
            
                     loading?
              Center(
                child: Expanded(
                                  child: Center(
                                    
                                    child: Container(
                                      height: 500,
                                      width: 100,
                    child: Center(
                      child: SpinKitSquareCircle
                        (
                          color: Colors.deepOrange,
                          size: 50.0,
                        ),
                    ),
                  ),
                                  ),
                ),
              )
            : StatusPanelContainer(active, confirmed, recovered, fatalities,date),
            
          ]
    ),
              ),
      ),
  );
  }

  updateValue(int index,String newItemSelected){

     setState(() {
       currentItemSelected=newItemSelected;
       confirmed=data.statewise[index].confirmed;
       active=data.statewise[index].active;
       fatalities=data.statewise[index].deaths;
       recovered=data.statewise[index].recovered;
       date=data.statewise[index].lastupdatedtime;
     });
      print('active: $active confirmed: $confirmed fatalities: $fatalities recovered: $recovered');
      print('as on :'+'${data.statewise[index].lastupdatedtime}');
  }
}