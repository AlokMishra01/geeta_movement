import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart' as CustomColors;
import '../providers/setting_provider.dart';

class TermsCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setting = context.watch<SettingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: CustomColors.PRIMARY_COLOR,
        centerTitle: true,
      ),
      body: setting.termsError
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
                onPressed: () => setting.fetchTerms(false),
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
              onRefresh: () => setting.fetchTerms(false),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
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
                        setting.terms == null ? '' : setting.terms!.content,
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
            ),
    );
  }
}
