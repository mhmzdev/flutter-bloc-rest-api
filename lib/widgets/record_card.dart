import 'package:bloc_app/model/country.dart';
import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  final Country country;
  const RecordCard({
    Key key,
    @required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final gapLarge = SizedBox(
      height: _size.height * 0.03,
    );

    final gap = SizedBox(
      height: _size.height * 0.015,
    );

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: _size.width * 0.03,
        vertical: _size.height * 0.015,
      ),
      padding: const EdgeInsets.all(12.0),
      height: _size.height * 0.32,
      width: _size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.flag,
                size: 30,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                country.country,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              )
            ],
          ),
          gapLarge,
          Text(
            "Total Cases: ${country.cases}",
            style: kStyle,
          ),
          gap,
          Text(
            "Active Cases: ${country.active}",
            style: kStyle,
          ),
          gap,
          Text(
            "Critical Cases: ${country.critical}",
            style: kStyle,
          ),
          gap,
          Text(
            "Recovered: ${country.recovered}",
            style: kStyle,
          ),
          gap,
          Text(
            "Deaths: ${country.deaths}",
            style: kStyle,
          ),
        ],
      ),
    );
  }
}

const kStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);
