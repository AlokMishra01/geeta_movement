import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart' as CustomColors;

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController _editingController = TextEditingController();
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback and Suggestion'),
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
                height: 36.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Text(
                  'Have something to say?',
                  style: TextStyle(
                    color: CustomColors.TEXT_BLACK.withOpacity(0.8),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              TextFormField(
                controller: _editingController,
                decoration: InputDecoration(
                  hintText: 'Lorem ipsum dolor sit amet, consectetur '
                      'adipiscing elit, sed do eiusmod tempor incididunt '
                      'ut labore et dolore magna aliqua....',
                  hintStyle: TextStyle(
                    color: CustomColors.TEXT_BLACK_SECONDARY,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  focusColor: Colors.red,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.TEXT_BLACK_SECONDARY,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.TEXT_BLACK_SECONDARY,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CustomColors.TEXT_BLACK_SECONDARY,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: CustomColors.TEXT_BLACK,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                minLines: 8,
                maxLines: 40,
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Text(
                  'Are you satisfied with app Functionality?',
                  style: TextStyle(
                    color: CustomColors.TEXT_BLACK.withOpacity(0.8),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildSatisfiedBox(
                      title: 'Less',
                      selected: _selected == 0,
                      onTab: () {
                        _selected = 0;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    buildSatisfiedBox(
                      title: 'Medium',
                      selected: _selected == 1,
                      onTab: () {
                        _selected = 1;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    buildSatisfiedBox(
                      title: 'Fully',
                      selected: _selected == 2,
                      onTab: () {
                        _selected = 2;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              // ignore: deprecated_member_use
              ElevatedButton(
                child: SizedBox(
                  height: 48.0,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: CustomColors.TEXT_WHITE,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                onPressed: () => print("it's pressed"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xccE40007),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildSatisfiedBox({
    required String title,
    required bool selected,
    required VoidCallback onTab,
  }) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: 60.0,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected
                ? CustomColors.PRIMARY_COLOR
                : CustomColors.TEXT_BLACK_SECONDARY,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    height: 1.1,
                  ),
                ),
                Text(
                  'Satisfied',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
