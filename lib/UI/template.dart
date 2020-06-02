import 'package:flutter/material.dart';
import 'package:covid19_tracker/UI/data.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:covid19_tracker/Backend/BackendData.dart';



class StatusPanelContainer extends StatelessWidget {
 final String active,confirmed,recovered,fatalities,date;
 StatusPanelContainer(this.active,this.confirmed,this.recovered,this.fatalities,this.date);
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      margin: EdgeInsets.all(10),
  style: NeumorphicStyle(
    shape: NeumorphicShape.concave,
    depth: 2,
    lightSource: LightSource.topLeft,
    color: AppColors.primaryWhite,
    
    
  ),
      child: Column(
       children: <Widget>
          [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>
                  [
                    StatusPanels('Confirmed',confirmed, Colors.deepOrange),
                    StatusPanels('Active', active, Colors.red),
                    StatusPanels('Recovered',recovered,Colors.green),
                    StatusPanels('Fatalities',fatalities, Colors.grey),
                  ]
          ),
            ),
            Neumorphic
            (
                  boxShape: NeumorphicBoxShape.circle(),
                  margin: EdgeInsets.all(30),
                  style: NeumorphicStyle
                  (
                    shape: NeumorphicShape.convex,
                    depth: 2,
                    lightSource: LightSource.topLeft,
                    color: AppColors.primaryWhite,
                  ),
              child: Chart(confirmed, active, recovered, fatalities)
            ),
            Text('As on -'),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0,10),
              child: Text(date,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            
          ]
      ),
    );
  }
}

class StatusPanels extends StatelessWidget {
  final String status;
  final String number;
  final Color background;
  StatusPanels(this.status,this.number,this.background);
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
     
  style: NeumorphicStyle(
    shape: NeumorphicShape.concave,
    depth: 2,
    lightSource: LightSource.topLeft,
    color: background,
    //intensity: 0.2,
    
  ),
          child: Container(
        height: 120,
        width: 70,
          
          decoration: 
      BoxDecoration
      (
        //boxShadow:AppColors.neumorpShadow,
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
          child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>
      [
        Text(
          '$status',
          style: TextStyle
          (
            color: Colors.indigo[50],
            fontWeight: FontWeight.w500,
            fontSize: 13
          ),
        ),
        Text(
          '$number',
          style: TextStyle
          (
            color: Colors.indigo[50],
            fontWeight: FontWeight.w100,
            fontSize: 20
          )
          ),
      ],
          )
        ),
    );
  }
}

class Chart extends StatelessWidget {
 final String active,confirmed,recovered,fatalities;
 Chart( this.confirmed,this.active,this.recovered, this.fatalities);

List<PieChartSectionData> get() {
  List<PieChartSectionData> sections=List<PieChartSectionData>();
    return  sections = 
            [
              sectionMaker(active, Colors.red,78),
              sectionMaker(confirmed, Colors.deepOrange,82),
              sectionMaker(recovered, Colors.green,75),
              sectionMaker(fatalities, Colors.grey,70),
            ];
}

PieChartSectionData sectionMaker(String value,Color fillcolor,double radius)
{
  return PieChartSectionData
  (
    color: fillcolor,
    value: double.parse(value),
    title: '',
    radius: radius
  );


}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData
          (
            sections: get(),
            borderData: FlBorderData(show: false),
            centerSpaceRadius: 50,
            sectionsSpace: 0,
          ),
          swapAnimationDuration: Duration(seconds: 1),
          
        ),
      ),
    );
  }
}




