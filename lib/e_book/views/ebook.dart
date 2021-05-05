import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/models/data_model.dart';
import '../../constants/colors.dart' as CustomColors;
import '../../constants/images.dart' as AssetImages;
import '../../e_book/provider/e_book_provider.dart';
import 'e_book_detail.dart';

class EBook extends StatelessWidget {
  final String query;
  final List<Data> eBooks;

  const EBook({
    Key? key,
    required this.query,
    required this.eBooks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final eBook = context.watch<EBookProvider>();
    return Column(
      children: [
        Expanded(
          child: eBook.error
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
                    onPressed: () => eBook.loadData(false),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xccE40007),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                )
              : eBook.model != null
                  ? RefreshIndicator(
                      onRefresh: () => eBook.loadData(false),
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: eBook.model?.data
                            .where((e) => e.title
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                            .toList()
                            .length,
                        itemBuilder: (context, index) {
                          final e = eBook.model?.data[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (cxt) => EBookDetail(
                                      data: e!,
                                    ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Chapter ${index + 1}',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color:
                                              CustomColors.TEXT_BLACK_SECONDARY,
                                        ),
                                      ),
                                      Text(
                                        e!.title,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColors.TEXT_BLACK,
                                        ),
                                      ),
                                      Text(
                                        e.excerpt,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color:
                                              CustomColors.TEXT_BLACK_SECONDARY,
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
                    )
                  : Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
        ),
      ],
    );
  }
}
