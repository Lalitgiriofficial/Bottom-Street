import '../Model/PerformanceModel.dart';
import 'package:bottom_street/Model/OverviewmModel.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<OverviewModel> getOverview() async {
    String finalUrl =
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en";
    final response = await http.get(Uri.parse(finalUrl));
    if (response.statusCode == 200) {
      return OverviewModel.fromJson(response.body);
    } else {
      throw Exception("ERROR");
    }
  }

  Future<List<Performance>> getPerformance() async {
    String finalUrl =
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en";
    final response = await http.get(Uri.parse(finalUrl));
    try {
      if (response.statusCode == 200) {
        final List<Performance> list = performanceFromJson(response.body);
        return list;
      } else {
        throw Exception("ERROR");
      }
    } catch (e) {
      return <Performance>[];
    }
  }
}
