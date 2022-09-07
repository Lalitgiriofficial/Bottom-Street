import 'dart:convert';

class OverviewModel {
  int ID;
  String Security;
  int IndustryID;
  String Industry;
  int SectorID;
  String Sector;
  double MCAP;
  double EV;
  double BookNavPerShare;
  double TTMPE;
  double Yield;
  String SectorSlug;
  String IndustrySlug;
  String SecuritySlug;
  double PEGRatio;

  OverviewModel({
    required this.ID,
    required this.Security,
    required this.IndustryID,
    required this.Industry,
    required this.SectorID,
    required this.Sector,
    required this.MCAP,
    required this.EV,
    required this.BookNavPerShare,
    required this.TTMPE,
    required this.Yield,
    required this.SectorSlug,
    required this.IndustrySlug,
    required this.SecuritySlug,
    required this.PEGRatio,
  });

  OverviewModel copyWith({
    int? ID,
    String? Security,
    int? IndustryID,
    String? Industry,
    int? SectorID,
    String? Sector,
    double? MCAP,
    double? EV,
    double? BookNavPerShare,
    double? TTMPE,
    double? Yield,
    String? SectorSlug,
    String? IndustrySlug,
    String? SecuritySlug,
    double? PEGRatio,
  }) {
    return OverviewModel(
      ID: ID ?? this.ID,
      Security: Security ?? this.Security,
      IndustryID: IndustryID ?? this.IndustryID,
      Industry: Industry ?? this.Industry,
      SectorID: SectorID ?? this.SectorID,
      Sector: Sector ?? this.Sector,
      MCAP: MCAP ?? this.MCAP,
      EV: EV ?? this.EV,
      BookNavPerShare: BookNavPerShare ?? this.BookNavPerShare,
      TTMPE: TTMPE ?? this.TTMPE,
      Yield: Yield ?? this.Yield,
      SectorSlug: SectorSlug ?? this.SectorSlug,
      IndustrySlug: IndustrySlug ?? this.IndustrySlug,
      SecuritySlug: SecuritySlug ?? this.SecuritySlug,
      PEGRatio: PEGRatio ?? this.PEGRatio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': ID,
      'Security': Security,
      'IndustryID': IndustryID,
      'Industry': Industry,
      'SectorID': SectorID,
      'Sector': Sector,
      'MCAP': MCAP,
      'EV': EV,
      'BookNavPerShare': BookNavPerShare,
      'TTMPE': TTMPE,
      'Yield': Yield,
      'SectorSlug': SectorSlug,
      'IndustrySlug': IndustrySlug,
      'SecuritySlug': SecuritySlug,
      'PEGRatio': PEGRatio,
    };
  }

  factory OverviewModel.fromMap(Map<String, dynamic> map) {
    return OverviewModel(
      ID: map['ID']?.toInt() ?? 0,
      Security: map['Security'] ?? '',
      IndustryID: map['IndustryID']?.toInt() ?? 0,
      Industry: map['Industry'] ?? '',
      SectorID: map['SectorID']?.toInt() ?? 0,
      Sector: map['Sector'] ?? '',
      MCAP: map['MCAP']?.toDouble() ?? 0.0,
      EV: map['EV']?.toDouble() ?? 0.0,
      BookNavPerShare: map['BookNavPerShare']?.toDouble() ?? 0.0,
      TTMPE: map['TTMPE']?.toDouble() ?? 0.0,
      Yield: map['Yield']?.toDouble() ?? 0.0,
      SectorSlug: map['SectorSlug'] ?? '',
      IndustrySlug: map['IndustrySlug'] ?? '',
      SecuritySlug: map['SecuritySlug'] ?? '',
      PEGRatio: map['PEGRatio']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OverviewModel.fromJson(String source) =>
      OverviewModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OverviewModel(ID: $ID, Security: $Security, IndustryID: $IndustryID, Industry: $Industry, SectorID: $SectorID, Sector: $Sector, MCAP: $MCAP, EV: $EV, BookNavPerShare: $BookNavPerShare, TTMPE: $TTMPE, Yield: $Yield, SectorSlug: $SectorSlug, IndustrySlug: $IndustrySlug, SecuritySlug: $SecuritySlug, PEGRatio: $PEGRatio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OverviewModel &&
        other.ID == ID &&
        other.Security == Security &&
        other.IndustryID == IndustryID &&
        other.Industry == Industry &&
        other.SectorID == SectorID &&
        other.Sector == Sector &&
        other.MCAP == MCAP &&
        other.EV == EV &&
        other.BookNavPerShare == BookNavPerShare &&
        other.TTMPE == TTMPE &&
        other.Yield == Yield &&
        other.SectorSlug == SectorSlug &&
        other.IndustrySlug == IndustrySlug &&
        other.SecuritySlug == SecuritySlug &&
        other.PEGRatio == PEGRatio;
  }

  @override
  int get hashCode {
    return ID.hashCode ^
        Security.hashCode ^
        IndustryID.hashCode ^
        Industry.hashCode ^
        SectorID.hashCode ^
        Sector.hashCode ^
        MCAP.hashCode ^
        EV.hashCode ^
        BookNavPerShare.hashCode ^
        TTMPE.hashCode ^
        Yield.hashCode ^
        SectorSlug.hashCode ^
        IndustrySlug.hashCode ^
        SecuritySlug.hashCode ^
        PEGRatio.hashCode;
  }
}
