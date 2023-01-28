import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class News extends StatelessWidget {
  const News({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 60,
            child: Chip(
              label: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png"),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Title",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: myColors.darkgreen),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            width: 100,
            height: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: myColors.lightgreen),
                borderRadius: BorderRadius.circular(4)),
            child: Text(
              "Honestly, two weeks ago I would have said yes.But with GPU prices dropping off a cliff, multiple Radeon RX 6600 cards are sitting at 369 right now for a card that (with a few caveats) outperforms the 3050. With RX 6600 being marginally faster, marginally more efficient, and marginally cheaper than the the 3050, you need to weigh your options.If you play AMD games like AC:Valhalla and Far Cry 6 then the Radeon 6600 is practically a no-brainer. It also (for whatever reason) smokes the 3050 in Apex Legends, which has traditionally been the domain of Nvidia cards.This is what’s up.",
              overflow: TextOverflow.fade,
              style: TextStyle(fontSize: 10, color: myColors.darkgreen),
            ),
          )
        ],
      ),
    );
  }
}
