import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart' as CustomColors;
import '../../settings/views/privacy_policy.dart';
import 'aboutus_page.dart';
import 'feedback_suggestion_page.dart';
import 'terms_condtion_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _pushNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
        backgroundColor: CustomColors.PRIMARY_COLOR,
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 40,
          top: 25,
          right: 40,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              "General Settings",
              style: TextStyle(
                fontSize: 22.0,
                color: CustomColors.TEXT_BLACK_SECONDARY,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            buildNotificationOptionRow(
              title: "Push Notification",
              isActive: _pushNotification,
              onChanged: (bool val) {
                _pushNotification = val;
                setState(() {});
                return () {};
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            buildNotificationOptionRow(
              title: "Dark Mode",
              isActive:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark,
              onChanged: (bool val) async {
                if (val) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
                await AdaptiveTheme.of(context).persist();
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'Others',
              style: TextStyle(
                fontSize: 22.0,
                color: CustomColors.TEXT_BLACK_SECONDARY,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                );
              },
              child: _buildAccountOptionRow(
                context: context,
                title: "About us",
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicy(),
                  ),
                );
              },
              child: _buildAccountOptionRow(
                context: context,
                title: "Privacy Policy",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsCondition(),
                  ),
                );
              },
              child: _buildAccountOptionRow(
                context: context,
                title: "Terms and conditions",
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedBack(),
                  ),
                );
              },
              child: _buildAccountOptionRow(
                context: context,
                title: "Suggestion and Feedback",
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () {},
              child: _buildAccountOptionRow(
                context: context,
                title: "Credits",
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow({
    required String title,
    required bool isActive,
    required onChanged(bool value),
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: CustomColors.TEXT_BLACK,
          ),
        ),
        CupertinoSwitch(
          activeColor: CustomColors.PRIMARY_COLOR,
          value: isActive,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildAccountOptionRow({
    required BuildContext context,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: CustomColors.TEXT_BLACK,
            ),
          ),
          Icon(
            CupertinoIcons.chevron_forward,
            size: 24.0,
            color: CustomColors.TEXT_BLACK,
          ),
        ],
      ),
    );
  }
}
