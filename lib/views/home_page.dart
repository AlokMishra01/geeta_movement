import 'package:flutter/material.dart';

import 'audio_book_detail.dart';
import 'e_book_detail.dart';
import 'like_dialog.dart';
import 'rate_dialog.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (cxt) => EBookDetail(),
                    ),
                  );
                },
                child: Text('E-Book Detail'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (cxt) => AudioBookDetail(),
                    ),
                  );
                },
                child: Text('Audio Book Detail'),
              ),
              TextButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (cxt) {
                      return LikeDialog();
                    },
                  );
                },
                child: Text('Like Dialog'),
              ),
              TextButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (cxt) {
                      return RateDialog();
                    },
                  );
                },
                child: Text('Rate Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
