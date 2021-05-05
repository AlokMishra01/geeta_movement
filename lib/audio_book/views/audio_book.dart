import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../audio_book/provider/audio_book_provider.dart';
import '../../constants/colors.dart' as CustomColors;
import 'audio_book_detail.dart';

class AudioBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final aBook = context.watch<AudioBookProvider>();
    return Column(
      children: [
        Expanded(
          child: aBook.error
              ? Center(
                  child: ElevatedButton(
                    child: SizedBox(
                      height: 48.0,
                      width: 160.0,
                      child: Center(
                        child: Text(
                          "Reload",
                          style: TextStyle(
                            color: CustomColors.TEXT_WHITE,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () => aBook.loadData(false),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xccE40007),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                )
              : aBook.model != null
                  ? RefreshIndicator(
                      onRefresh: () => aBook.loadData(false),
                      child: GridView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: aBook.model?.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (cxt, index) {
                          final e = aBook.model?.data[index];
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: CachedNetworkImage(
                                      imageUrl: e!.thumbnail,
                                      fit: BoxFit.cover,
                                      placeholder: (cxt, placeholder) =>
                                          Material(
                                        color:
                                            CustomColors.TEXT_BLACK.withOpacity(
                                          0.5,
                                        ),
                                      ),
                                    ),
                                    // child: Image.asset(
                                    //   AssetImages.IMAGE_TWO,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 80.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          end: const Alignment(0.0, -1),
                                          begin: const Alignment(0.0, 0.4),
                                          colors: [
                                            CustomColors.TEXT_BLACK
                                                .withOpacity(0.6),
                                            CustomColors.TEXT_BLACK
                                                .withOpacity(0.0)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                        size: 48.0,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (cxt) => AudioBookDetail(
                                              index: index,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: 16.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.title,
                                            style: TextStyle(
                                              color: CustomColors.TEXT_WHITE,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            e.excerpt,
                                            style: TextStyle(
                                              color: CustomColors.TEXT_WHITE,
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
        )
      ],
    );
  }
}
