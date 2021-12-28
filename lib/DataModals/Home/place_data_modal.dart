



class PlaceDataModal {
  String? placeName;
  String? placeId;

  PlaceDataModal(
      {
        this.placeName,
        this.placeId,

      });

  factory PlaceDataModal.fromJson(Map<String, dynamic> json) => PlaceDataModal(
    placeName: (json['placeName']??'').toString(),
    placeId: (json['placeId']??'').toString(),
  );


}