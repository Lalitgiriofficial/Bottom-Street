import 'package:bottom_street/Model/OverviewmModel.dart';
import 'package:bottom_street/Network/Network.dart';
import 'package:bottom_street/Widgets/OverviewCard.dart';
import 'package:bottom_street/Widgets/PerformanceCard.dart';
import 'package:bottom_street/Model/PerformanceModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<OverviewModel> overview;
  late Future<List<Performance>> performance;

  @override
  void initState() {
    // TODO: implement initState
    overview = Network().getOverview();
    performance = Network().getPerformance();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: overview,
              builder: (context, AsyncSnapshot<OverviewModel> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        overviewCard(snapshot),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "View More",
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.yellow.shade900),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  );
                }
              },
            ),
            FutureBuilder(
              future: performance,
              builder: (context, AsyncSnapshot<List<Performance>> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          performanceCard(snapshot),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "View More",
                              style: GoogleFonts.roboto(
                                  fontSize: 15, color: Colors.yellow.shade900),
                            ),
                          )
                        ],
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
