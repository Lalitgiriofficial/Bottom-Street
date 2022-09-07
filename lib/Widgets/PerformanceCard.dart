import 'package:bottom_street/Model/PerformanceModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget performanceCard(AsyncSnapshot<List<Performance>> snapshot) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 17),
        child: Text(
          "Performance",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
              fontSize: 22),
        ),
      ),
      const Divider(
        height: 1,
        color: Colors.black,
      ),
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var time = snapshot.data![index].label.toString();
            double? percent = snapshot.data![index].changePercent;
            bool Positive = true;
            double? maxpercent = snapshot.data![7].changePercent;
            double? resultpercent = percent! / maxpercent!;
            if (percent < 0) {
              Positive = false;
              resultpercent = (-1 * percent) / maxpercent;
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                      child: SizedBox(
                    height: 20,
                    width: 100,
                    child: Text(
                      time,
                      style: GoogleFonts.roboto(fontSize: 15),
                    ),
                  )),
                  SizedBox(
                    height: 25,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: LinearProgressIndicator(
                        value: resultpercent,
                        backgroundColor: const Color(0xffE3E3E3),
                        color: Positive ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  Positive
                      ? FittedBox(
                          child: SizedBox(
                              height: 20,
                              width: 80,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("▲${percent.toStringAsFixed(1)} %",
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.green.shade800)),
                              )))
                      : FittedBox(
                          child: SizedBox(
                              height: 20,
                              width: 80,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "▼${percent.toStringAsFixed(1)} %",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14, color: Colors.red),
                                  softWrap: false,
                                ),
                              )))
                ],
              ),
            );
          })

      // PRow(snapshot.data![0].label.toString(), snapshot.data![0].changePercent)
    ],
  );
}
