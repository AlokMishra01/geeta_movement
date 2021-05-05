import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer_jk/pdf_viewer_jk.dart';

import '../../common/models/data_model.dart';
import '../../constants/colors.dart' as CustomColors;

class EBookDetail extends StatefulWidget {
  final Data data;

  const EBookDetail({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _EBookDetailState createState() => _EBookDetailState();
}

class _EBookDetailState extends State<EBookDetail> {
  late PageController _controller;
  PDFDocument? _doc;
  int _currentIndex = 1;
  int? _total;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(() {
      if (_controller.page!.round() != _currentIndex - 1) {
        setState(() {
          _currentIndex = _controller.page!.round() + 1;
        });
      }
    });
    _loadPDF();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.addListener(
      () => setState(() {}),
    );
    super.dispose();
  }

  _loadPDF() async {
    _doc = await PDFDocument.fromURL(widget.data.file);
    _total = _doc?.count;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.PRIMARY_COLOR,
          foregroundColor: CustomColors.TEXT_WHITE,
          title: Text(
            widget.data.title,
          ),
          actions: [
            IconButton(
              icon: Icon(
                CupertinoIcons.search,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.doc_text_fill,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: _doc == null
                  ? Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : PDFViewer(
                      controller: _controller,
                      document: _doc!,
                      scrollDirection: Axis.vertical,
                      showNavigation: false,
                      showIndicator: false,
                      showPicker: false,
                      navigationBuilder: (cxt, i, j, fun1, fun2) => SizedBox(),
                    ),
            ),
            if (_doc != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 66.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.PRIMARY_COLOR.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(66.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 8.0,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: LinearProgressIndicator(
                              value: _currentIndex / _total!,
                              backgroundColor: CustomColors.GREY,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                CustomColors.PRIMARY_COLOR.withOpacity(0.7),
                              ),
                            ),
                          ),
                          Text(
                            '$_currentIndex/$_total',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: CustomColors.TEXT_BLACK,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
