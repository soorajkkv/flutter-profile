import 'package:flutter/material.dart';
import 'package:profile/colors.dart';
import 'package:profile/data/data.dart';
import 'package:profile/model/house_hold.dart';
import 'package:profile/widgets/app_bar.dart';
import 'package:profile/widgets/underline_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(top: 6.0, bottom: 20.0),
            padding: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0), bottom: Radius.circular(30.0)),
              color: Colors.white,
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _profileData(),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...socialIcons.map((e) => _socialIcon(e)).toList(),
                  ],
                ),
                _basicDetails(),
                Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: imageBackgroundColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(35))),
                  child: Column(
                    children: [
                      UnderlineText(
                        text: 'My Households',
                        fontSize: 14.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...houseHold
                              .map((e) => _houseHoldsItem(e))
                              .toList(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UnderlineText(
                        text: 'Birthdays',
                        fontSize: 14.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Wedding Anniversary',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black12),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.center,
                        tileMode: TileMode.mirror,
                        colors: [
                          Colors.white,
                          Colors.transparent,
                        ],
                        stops: [
                          0.0,
                          0.7,
                        ],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return _birthdayListItem();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20.0,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Column _profileData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            ClipOval(
              child: Image.asset(
                'assets/profile_pic.png',
                height: 110.0,
                width: 110.0,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.edit_sharp,
                    color: selectedRed,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          'Abraham Thomas',
          style: TextStyle(
            color: itemTextColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Peral Land East',
              style: TextStyle(
                color: detailsGrey,
                fontSize: 12.0,
                fontFamily: 'Archivo',
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '\u25C6',
              style: TextStyle(
                color: detailsGrey,
                fontSize: 10.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '#56566',
              style: TextStyle(
                color: detailsGrey,
                fontSize: 12.0,
                fontFamily: 'Archivo',
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '\u25C6',
              style: TextStyle(
                color: detailsGrey,
                fontSize: 10.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Male',
              style: TextStyle(
                color: detailsGrey,
                fontSize: 12.0,
                fontFamily: 'Archivo',
              ),
            ),
          ],
        ),
      ],
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      elevation: 0.0,
      selectedItemColor: itemSubTextColor,
      unselectedItemColor: itemSubTextColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              "assets/icons/home.png",
              height: 28.0,
              width: 28.0,
              fit: BoxFit.cover,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              "assets/icons/family.png",
              height: 28.0,
              width: 28.0,
              fit: BoxFit.cover,
            ),
          ),
          label: 'Family',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              "assets/icons/activity.png",
              height: 28.0,
              width: 28.0,
              fit: BoxFit.cover,
            ),
          ),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset(
              "assets/icons/contribution.png",
              height: 28.0,
              width: 28.0,
              fit: BoxFit.cover,
            ),
          ),
          label: 'Contribution',
        ),
      ],
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12, fontFamily: 'Archivo'),
      unselectedLabelStyle: TextStyle(fontSize: 12, fontFamily: 'Archivo'),
      type: BottomNavigationBarType.fixed,
    );
  }

  Container _socialIcon(String asset) {
    return Container(
      height: 25.0,
      width: 25.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: turquoiseBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      //padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Image.asset(
          asset,
          height: 13.0,
          width: 13.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Container _basicDetails() {
    return Container(
      margin: EdgeInsets.all(24.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 17.0,
                  width: 17.0,
                  decoration: BoxDecoration(
                    color: turquoiseBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Image.asset('assets/icons/location.png',
                      fit: BoxFit.fitHeight),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                            fontSize: 12.0, color: basicDetailsFontColor),
                      ),
                      Text(
                        '601 Lakeland Terrace',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: basicDetailsFontColor,
                            fontFamily:'Archivo'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          VerticalDivider(
            color: borderColor,
            thickness: 1,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 17.0,
                  width: 17.0,
                  decoration: BoxDecoration(
                    color: turquoiseBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Image.asset('assets/icons/phone.png',
                      fit: BoxFit.fitHeight),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Text(
                      '91 6456584156',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily:'Archivo'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _houseHoldsItem(HouseHoldItem itemData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.asset(
            itemData.image,
            height: 76.0,
            width: 76.0,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          itemData.name,
          style: TextStyle(
            fontSize: 13.0,
            color: itemTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          itemData.relation,
          style: TextStyle(
            fontSize: 10.0,
            color: itemSubTextColor,
            fontFamily: 'Archivo',
          ),
        ),
      ],
    );
  }

  Widget _birthdayListItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/person2.png',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
            Positioned(
              top: -5.0,
              right: -5.0,
              child: Container(
                height: 23.0,
                width: 23.0,
                decoration: BoxDecoration(
                  color: turquoiseBlue,
                  border: Border.all(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child:
                    Image.asset('assets/icons/hat.png', fit: BoxFit.fitHeight),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aby Thomas',
              style: TextStyle(
                color: itemTextColor,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Feb 25 2021, Monday',
              style: TextStyle(
                color: itemSubTextColor,
                fontSize: 10.0,
              ),
            )
          ],
        ),
      ],
    );
  }
}
