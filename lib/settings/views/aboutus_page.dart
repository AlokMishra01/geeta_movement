import 'package:flutter/material.dart';

import '../../constants/colors.dart' as CustomColors;

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About us'),
        backgroundColor: CustomColors.PRIMARY_COLOR,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.0,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed '
                'metus rutrum a tortor, donec pellentesque turpis enim a. Id '
                'aliquam dictum in est fringilla nibh feugiat gravida orci. '
                'Molestie curabitur etiam gravida cras. Neque, proin pharetra '
                'quisque nunc purus adipiscing risus aliquam. At quis semper '
                'et lorem. Lacus ut libero eu vitae suspendisse purus. '
                'Consectetur mauris lacinia mi quis tortor parturient '
                'imperdiet. Quam iaculis varius neque, vitae. Orci, mattis ac '
                'dignissim et, id phasellus. Massa tortor vulputate vel '
                'adipiscing. Eu tortor tincidunt in dignissim metus sit aenean '
                'quam. Non porta pharetra quisque sit diam. In enim et congue '
                'arcu quis integer cras. Egestas non orci dolor fames lectus. '
                'Augue dictum in ornare ligula vitae. Volutpat nisi velit sed '
                'faucibus elementum elementum. Sed habitasse curabitur '
                'suspendisse ullamcorper',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: CustomColors.TEXT_BLACK.withOpacity(0.8),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
