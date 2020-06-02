// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    List<CasesTimeSery> casesTimeSeries;
    List<Statewise> statewise;
    List<Tested> tested;

    Data({
        this.casesTimeSeries,
        this.statewise,
        this.tested,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        casesTimeSeries: List<CasesTimeSery>.from(json["cases_time_series"].map((x) => CasesTimeSery.fromJson(x))),
        statewise: List<Statewise>.from(json["statewise"].map((x) => Statewise.fromJson(x))),
        tested: List<Tested>.from(json["tested"].map((x) => Tested.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cases_time_series": List<dynamic>.from(casesTimeSeries.map((x) => x.toJson())),
        "statewise": List<dynamic>.from(statewise.map((x) => x.toJson())),
        "tested": List<dynamic>.from(tested.map((x) => x.toJson())),
    };
}

class CasesTimeSery {
    String dailyconfirmed;
    String dailydeceased;
    String dailyrecovered;
    String date;
    String totalconfirmed;
    String totaldeceased;
    String totalrecovered;

    CasesTimeSery({
        this.dailyconfirmed,
        this.dailydeceased,
        this.dailyrecovered,
        this.date,
        this.totalconfirmed,
        this.totaldeceased,
        this.totalrecovered,
    });

    factory CasesTimeSery.fromJson(Map<String, dynamic> json) => CasesTimeSery(
        dailyconfirmed: json["dailyconfirmed"],
        dailydeceased: json["dailydeceased"],
        dailyrecovered: json["dailyrecovered"],
        date: json["date"],
        totalconfirmed: json["totalconfirmed"],
        totaldeceased: json["totaldeceased"],
        totalrecovered: json["totalrecovered"],
    );

    Map<String, dynamic> toJson() => {
        "dailyconfirmed": dailyconfirmed,
        "dailydeceased": dailydeceased,
        "dailyrecovered": dailyrecovered,
        "date": date,
        "totalconfirmed": totalconfirmed,
        "totaldeceased": totaldeceased,
        "totalrecovered": totalrecovered,
    };
}

class Statewise {
    String active;
    String confirmed;
    String deaths;
    String deltaconfirmed;
    String deltadeaths;
    String deltarecovered;
    String lastupdatedtime;
    String recovered;
    String state;
    String statecode;
    String statenotes;

    Statewise({
        this.active,
        this.confirmed,
        this.deaths,
        this.deltaconfirmed,
        this.deltadeaths,
        this.deltarecovered,
        this.lastupdatedtime,
        this.recovered,
        this.state,
        this.statecode,
        this.statenotes,
    });

    factory Statewise.fromJson(Map<String, dynamic> json) => Statewise(
        active: json["active"],
        confirmed: json["confirmed"],
        deaths: json["deaths"],
        deltaconfirmed: json["deltaconfirmed"],
        deltadeaths: json["deltadeaths"],
        deltarecovered: json["deltarecovered"],
        lastupdatedtime: json["lastupdatedtime"],
        recovered: json["recovered"],
        state: json["state"],
        statecode: json["statecode"],
        statenotes: json["statenotes"],
    );

    Map<String, dynamic> toJson() => {
        "active": active,
        "confirmed": confirmed,
        "deaths": deaths,
        "deltaconfirmed": deltaconfirmed,
        "deltadeaths": deltadeaths,
        "deltarecovered": deltarecovered,
        "lastupdatedtime": lastupdatedtime,
        "recovered": recovered,
        "state": state,
        "statecode": statecode,
        "statenotes": statenotes,
    };
}

class Tested {
    String individualstestedperconfirmedcase;
    String positivecasesfromsamplesreported;
    String samplereportedtoday;
    String source;
    String testpositivityrate;
    String testsconductedbyprivatelabs;
    String testsperconfirmedcase;
    String testspermillion;
    String totalindividualstested;
    String totalpositivecases;
    String totalsamplestested;
    String updatetimestamp;

    Tested({
        this.individualstestedperconfirmedcase,
        this.positivecasesfromsamplesreported,
        this.samplereportedtoday,
        this.source,
        this.testpositivityrate,
        this.testsconductedbyprivatelabs,
        this.testsperconfirmedcase,
        this.testspermillion,
        this.totalindividualstested,
        this.totalpositivecases,
        this.totalsamplestested,
        this.updatetimestamp,
    });

    factory Tested.fromJson(Map<String, dynamic> json) => Tested(
        individualstestedperconfirmedcase: json["individualstestedperconfirmedcase"],
        positivecasesfromsamplesreported: json["positivecasesfromsamplesreported"],
        samplereportedtoday: json["samplereportedtoday"],
        source: json["source"],
        testpositivityrate: json["testpositivityrate"],
        testsconductedbyprivatelabs: json["testsconductedbyprivatelabs"],
        testsperconfirmedcase: json["testsperconfirmedcase"],
        testspermillion: json["testspermillion"],
        totalindividualstested: json["totalindividualstested"],
        totalpositivecases: json["totalpositivecases"],
        totalsamplestested: json["totalsamplestested"],
        updatetimestamp: json["updatetimestamp"],
    );

    Map<String, dynamic> toJson() => {
        "individualstestedperconfirmedcase": individualstestedperconfirmedcase,
        "positivecasesfromsamplesreported": positivecasesfromsamplesreported,
        "samplereportedtoday": samplereportedtoday,
        "source": source,
        "testpositivityrate": testpositivityrate,
        "testsconductedbyprivatelabs": testsconductedbyprivatelabs,
        "testsperconfirmedcase": testsperconfirmedcase,
        "testspermillion": testspermillion,
        "totalindividualstested": totalindividualstested,
        "totalpositivecases": totalpositivecases,
        "totalsamplestested": totalsamplestested,
        "updatetimestamp": updatetimestamp,
    };
}
