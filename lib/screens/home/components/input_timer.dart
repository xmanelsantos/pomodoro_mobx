import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/constants.dart';

class InputTimer extends StatelessWidget {
  final String title;
  final int time;

  const InputTimer({Key? key, required this.title, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green[400],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: Text(title,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Row(
            children: [
              IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle_outline)),
              Text(
                time.toString(),
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                ),
              ),
              IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline)),
            ],
          ),
        ],
      ),
    );
  }
}
