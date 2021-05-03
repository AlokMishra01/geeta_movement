import 'package:flutter/material.dart';

import '../../constants/colors.dart' as CustomColors;
import '../../constants/images.dart' as AssetImages;
import 'e_book_detail.dart';

class EBook extends StatelessWidget {
  final chapter = List<String>.generate(
    1000,
    (i) => 'Chapter ${i + 1}',
  );
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: chapter.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (cxt) => EBookDetail(),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: width * 0.36,
                        width: width * 0.33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              80.0,
                            ),
                          ),
                          elevation: 0,
                          color: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            child: Image.asset(
                              AssetImages.IMAGE_TWO,
                              height: width * 0.36,
                              width: width * 0.33,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chapter[index],
                            style: TextStyle(
                              fontSize: 14.0,
                              color: CustomColors.TEXT_BLACK_SECONDARY,
                            ),
                          ),
                          Text(
                            'Observing the Armies',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.TEXT_BLACK,
                            ),
                          ),
                          Text(
                            '46 shlokas',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: CustomColors.TEXT_BLACK_SECONDARY,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
