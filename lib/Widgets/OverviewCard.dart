import 'dart:math';

import 'package:bottom_street/Model/OverviewmModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget overviewCard(AsyncSnapshot<OverviewModel> snapshot) {
  double mcap = snapshot.data!.MCAP;
  String denotion = "Cr.";
  if (mcap >= pow(10, 7)) {
    mcap = mcap / pow(10, 7);
    denotion = "Cr.";
  } else if (mcap < pow(10, 7) && mcap >= pow(10, 5)) {
    mcap = mcap / pow(10, 5);
    denotion = "Lakh";
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 50,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 17),
        child: Text(
          "Overview",
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
              fontSize: 22),
        ),
      ),
      const Divider(
        color: Colors.black,
        height: 1,
      ),
      const SizedBox(
        height: 10,
      ),
      RowCard("Sector", "🏦  ${snapshot.data!.Sector}"),
      RowCard("Industry", "🏦 ${snapshot.data!.Industry}"),
      RowCard("Market Cap.", "${mcap.toStringAsFixed(2)} $denotion"),
      RowCard("Enterprise Value(EV)", snapshot.data!.EV.toString()),
      RowCard("Book Value / Share",
          snapshot.data!.BookNavPerShare.toStringAsFixed(2)),
      RowCard(
          "Price-Earning ratio (PE)", snapshot.data!.TTMPE.toStringAsFixed(2)),
      RowCard("PEG Ratio", snapshot.data!.PEGRatio.toStringAsFixed(2)),
      RowCard("Dividend Yield", snapshot.data!.Yield.toStringAsFixed(2)),
    ],
  );
}

RowCard(String s, String val) {
  if (val == "0.0" || val == "0") {
    val = "-";
  }
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          s,
          style: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.blue.shade900,
              fontWeight: FontWeight.w400),
        ),
        Text(
          val,
          style: GoogleFonts.roboto(fontSize: 14, color: Colors.black),
        )
      ],
    ),
  );
}
