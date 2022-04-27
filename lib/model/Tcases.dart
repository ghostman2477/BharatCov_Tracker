class Tcases
{
  var total;
  var discharged;
  var deaths;
  var confirmedCasesIndian;
  var confirmedCasesForeign;
  var confirmedButLocationUnidentified;

  Tcases({this.total,this.discharged,this.deaths,this.confirmedCasesIndian,this.confirmedCasesForeign,this.confirmedButLocationUnidentified});



  factory Tcases.fromJson(final json)
  {
    return Tcases(

        total:json["total"],
        discharged : json["discharged"],
        deaths : json["deaths"],
        confirmedCasesIndian : json["confirmedCasesIndian"],
        confirmedCasesForeign : json["confirmedCasesForeign"],
        confirmedButLocationUnidentified :json["confirmedButLocationUnidentified"]

    );
  }



}