import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart' as CustomColors;

class EBookDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.PRIMARY_COLOR,
          foregroundColor: CustomColors.TEXT_WHITE,
          title: Text(
            'Bhagavad Geeta',
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
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed '
                    'metus rutrum a tortor, donec pellentesque turpis enim a. Id '
                    'aliquam dictum in est fringilla nibh feugiat gravida orci. '
                    'Molestie curabitur etiam gravida cras. Neque, proin pharetra '
                    'quisque nunc purus adipiscing risus aliquam. At quis semper et '
                    'lorem. Lacus ut libero eu vitae suspendisse purus.\nConsectetur '
                    'mauris lacinia mi quis tortor parturient imperdiet. Quam '
                    'iaculis varius neque, vitae. Orci, mattis ac dignissim et, id '
                    'phasellus. Massa tortor vulputate vel adipiscing. Eu tortor '
                    'tincidunt in dignissim metus sit aenean quam. Non porta '
                    'pharetra quisque sit diam. In enim et congue arcu quis integer '
                    'cras. Egestas non orci dolor fames lectus. Augue dictum in '
                    'ornare ligula vitae.\nVolutpat nisi velit sed faucibus '
                    'elementum elementum. Sed habitasse curabitur suspendisse '
                    'ullamcorper'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed '
                    'metus rutrum a tortor, donec pellentesque turpis enim a. Id '
                    'aliquam dictum in est fringilla nibh feugiat gravida orci. '
                    'Molestie curabitur etiam gravida cras. Neque, proin pharetra '
                    'quisque nunc purus adipiscing risus aliquam. At quis semper et '
                    'lorem. Lacus ut libero eu vitae suspendisse purus.\nConsectetur '
                    'mauris lacinia mi quis tortor parturient imperdiet. Quam '
                    'iaculis varius neque, vitae. Orci, mattis ac dignissim et, id '
                    'phasellus. Massa tortor vulputate vel adipiscing. Eu tortor '
                    'tincidunt in dignissim metus sit aenean quam. Non porta '
                    'pharetra quisque sit diam. In enim et congue arcu quis integer '
                    'cras. Egestas non orci dolor fames lectus. Augue dictum in '
                    'ornare ligula vitae.\nVolutpat nisi velit sed faucibus '
                    'elementum elementum. Sed habitasse curabitur suspendisse '
                    'ullamcorper'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed '
                    'metus rutrum a tortor, donec pellentesque turpis enim a. Id '
                    'aliquam dictum in est fringilla nibh feugiat gravida orci. '
                    'Molestie curabitur etiam gravida cras. Neque, proin pharetra '
                    'quisque nunc purus adipiscing risus aliquam. At quis semper et '
                    'lorem. Lacus ut libero eu vitae suspendisse purus.\nConsectetur '
                    'mauris lacinia mi quis tortor parturient imperdiet. Quam '
                    'iaculis varius neque, vitae. Orci, mattis ac dignissim et, id '
                    'phasellus. Massa tortor vulputate vel adipiscing. Eu tortor '
                    'tincidunt in dignissim metus sit aenean quam. Non porta '
                    'pharetra quisque sit diam. In enim et congue arcu quis integer '
                    'cras. Egestas non orci dolor fames lectus. Augue dictum in '
                    'ornare ligula vitae.\nVolutpat nisi velit sed faucibus '
                    'elementum elementum. Sed habitasse curabitur suspendisse '
                    'ullamcorper',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: CustomColors.TEXT_BLACK,
                    ),
                  ),
                ),
              ),
            ),
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
                            value: 0.5,
                            backgroundColor: CustomColors.GREY,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              CustomColors.PRIMARY_COLOR.withOpacity(0.7),
                            ),
                          ),
                        ),
                        Text(
                          '5/42',
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
