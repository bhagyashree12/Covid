class Cases_countries {
  String country;
  int TotalConfirmed, TotalDeaths, TotalRecovered;

  Cases_countries(
      {this.country,
      this.TotalRecovered,
      this.TotalDeaths,
      this.TotalConfirmed});

  factory Cases_countries.fromjson(Map<String, dynamic> json) {
    return Cases_countries(
      country: json['Country'],
      TotalRecovered: json['TotalRecovered'],
      TotalDeaths: json['TotalDeaths'],
      TotalConfirmed: json['TotalConfirmed'],
    );
  }
}
