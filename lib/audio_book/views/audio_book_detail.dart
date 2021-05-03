import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../../constants/colors.dart' as CustomColors;
import '../../constants/images.dart' as AssetImages;

class AudioBookDetail extends StatefulWidget {
  @override
  _AudioBookDetailState createState() => _AudioBookDetailState();
}

class _AudioBookDetailState extends State<AudioBookDetail> {
  late InfiniteScrollController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController(initialItem: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                CupertinoIcons.heart_fill,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '${_selectedIndex + 1} of 46',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12.0,
                  color: CustomColors.TEXT_BLACK,
                ),
              ),
            ),
            SizedBox(
              height: width * 0.7,
              child: InfiniteCarousel.builder(
                controller: _controller,
                itemCount: 46,
                itemExtent: width * 0.7,
                loop: true,
                center: true,
                onIndexChanged: (index) {
                  print(index);
                  if (_selectedIndex != index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }
                },
                itemBuilder: (context, itemIndex, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36.0),
                      child: GestureDetector(
                        onTap: () {
                          _controller.animateToItem(realIndex);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36.0),
                            boxShadow: kElevationToShadow[2],
                            image: DecorationImage(
                              image: AssetImage(AssetImages.IMAGE_ONE),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Observing The Armies',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.TEXT_RED,
                    ),
                  ),
                  Text(
                    '46 Shlokas',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: CustomColors.TEXT_BLACK,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            '0.20',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: CustomColors.TEXT_BLACK,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            '3.50',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: CustomColors.TEXT_BLACK,
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: CustomColors.GREY,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            CustomColors.PRIMARY_COLOR.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.arrow_2_squarepath,
                            color: CustomColors.TEXT_BLACK,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_selectedIndex > 0) {
                          _controller.animateToItem(_selectedIndex - 1);
                        } else {
                          _controller.animateToItem(45);
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.backward_end,
                            color: CustomColors.TEXT_BLACK,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: CustomColors.PRIMARY_COLOR,
                        radius: 24.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.play_arrow_solid,
                            color: CustomColors.TEXT_WHITE,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_selectedIndex < 45) {
                          _controller.animateToItem(_selectedIndex + 1);
                        } else {
                          _controller.animateToItem(0);
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.forward_end,
                            color: CustomColors.TEXT_BLACK,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 28.0,
                        child: Center(
                          child: Icon(
                            CupertinoIcons.alt,
                            color: CustomColors.TEXT_BLACK,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
