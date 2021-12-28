



class PanchangDataModal {
  String? day;
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? vedic_sunrise;
  String? vedic_sunset;
  TithiDataModal? tithi;
  NakshatraDataModal? nakshatra;

  PanchangDataModal(
      {
        this.day,
        this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.vedic_sunrise,
        this.vedic_sunset,
        this.tithi,
        this.nakshatra,

      });

  factory PanchangDataModal.fromJson(Map<String, dynamic> json) => PanchangDataModal(
    day: (json['day']??'').toString(),
    sunrise: (json['sunrise']??'').toString(),
    sunset: (json['sunset']??'').toString(),
    moonrise: (json['moonrise']??'').toString(),
    moonset: (json['moonset']??'').toString(),
    vedic_sunrise: (json['vedic_sunrise']??'').toString(),
    vedic_sunset: (json['vedic_sunset']??'').toString(),
    tithi: TithiDataModal(
      details: DetailsModal(
        tithi_name: json['tithi']['details']['tithi_name'],
        tithi_number: json['tithi']['details']['tithi_number'].toString(),
        special: json['tithi']['details']['special'],
        summary: json['tithi']['details']['summary'],
          deity: json['tithi']['details']['deity']
      ),
      end_time: json['tithi']['end_time']

    ),
    nakshatra: NakshatraDataModal(
        details: NakshatraDetailsModal(
            nak_number: json['nakshatra']['details']['nak_number'].toString(),
            nak_name: json['nakshatra']['details']['nak_name'].toString(),
            special: json['nakshatra']['details']['special'],
            summary: json['nakshatra']['details']['summary'],
            deity: json['nakshatra']['details']['deity']
        ),
        end_time: json['nakshatra']['end_time']

    ),
  );


}




class TithiDataModal {
  DetailsModal? details;
  Map? end_time;



  TithiDataModal(
      {
        this.details,
        this.end_time,



      });




}




class DetailsModal {
  String? tithi_number;
  String? tithi_name;
  String? special;
  String? summary;
  String? deity;

  DetailsModal(
      {
        this.tithi_number,
        this.tithi_name,
        this.special,
        this.summary,
        this.deity,

      });



}



class NakshatraDataModal {
  NakshatraDetailsModal? details;
  Map? end_time;



  NakshatraDataModal(
      {
        this.details,
        this.end_time,



      });
}

class NakshatraDetailsModal {
  String? nak_number;
  String? nak_name;
  String? ruler;
  String? summary;
  String? special;
  String? deity;

  NakshatraDetailsModal(
      {
        this.nak_number,
        this.nak_name,
        this.ruler,
        this.summary,
        this.special,
        this.deity,

      });



}


