import 'package:flutter/material.dart';
import 'package:geeta_movement/constants/images.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart' as CustomColors;
import '../providers/setting_provider.dart';

class CreditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setting = context.watch<SettingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits'),
        backgroundColor: CustomColors.PRIMARY_COLOR,
        centerTitle: true,
      ),
      body: setting.creditError
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
                onPressed: () => setting.fetchCredit(false),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xccE40007),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: () => setting.fetchCredit(false),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var c in setting.credit!.data)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 40.0,
                            ),
                            Stack(
                              children: [
                                Positioned(
                                  bottom: 0.0,
                                  top: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        R_BLUE,
                                      ),
                                      Image.asset(
                                        R_BLUE,
                                      ),
                                      Image.asset(
                                        R_YELLOW,
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    R_PURPLE,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              c.fullName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CustomColors.TEXT_BLACK,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              c.designation,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CustomColors.TEXT_BLACK,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      // Text(
                      //   setting.credit == null
                      //       ? ''
                      //       : setting.credit!.toJson().toString(),
                      //   textAlign: TextAlign.justify,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK.withOpacity(0.8),
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // Stack(
                      //   children: [
                      //     Positioned(
                      //       bottom: 0.0,
                      //       top: 0.0,
                      //       left: 0.0,
                      //       right: 0.0,
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Image.asset(
                      //             R_BLUE,
                      //           ),
                      //           Image.asset(
                      //             R_BLUE,
                      //           ),
                      //           Image.asset(
                      //             R_YELLOW,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     Center(
                      //       child: Image.asset(
                      //         R_PURPLE,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
                      // Text(
                      //   'John Doe',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                      // Text(
                      //   'User Interface Design',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 40.0,
                      // ),
                      // Image.asset(
                      //   R_YELLOW_B,
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
                      // Text(
                      //   'John Doe',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                      // Text(
                      //   'Android Development',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 40.0,
                      // ),
                      // Image.asset(
                      //   R_BLUE_B,
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
                      // Text(
                      //   'John Doe',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                      // Text(
                      //   'Graphic Design',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 40.0,
                      // ),
                      // Image.asset(
                      //   R_ORANGE,
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
                      // Text(
                      //   'John Doe',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                      // Text(
                      //   'SEO',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 40.0,
                      // ),
                      // Image.asset(
                      //   R_GREEN,
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
                      // Text(
                      //   'John Doe',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                      // Text(
                      //   'Web Designer',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: CustomColors.TEXT_BLACK,
                      //     fontSize: 16.0,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      SizedBox(
                        height: 60.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
