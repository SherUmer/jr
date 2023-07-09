import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/homeBanner.dart';
import 'package:jr/screens/widgets/CustomBottomBar.dart';
import 'package:jr/screens/widgets/customDrawer.dart';
import 'package:jr/screens/widgets/homeCarousel.dart';
import 'package:jr/screens/widgets/homeForums.dart';
import 'package:jr/screens/widgets/homeTransformationPrograms.dart';
import 'package:jr/screens/widgets/homeMerchStore.dart';
import 'package:jr/screens/widgets/rightProfileIcon.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Colors.white,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: RightProfileIcon(),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<DataBase>(builder: (context, value, child) {
              return dbclass.islog
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_interpolation_to_compose_strings
                      child: Text(
                        'Welcome ' + dbclass.name.toString() + '...!',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    )
                  :
                  // const HomeCarousel();
                  const HomeBanner();
            }),
            const HomeTransformationPrograms(),
            const HomeForums(),
            const HomeMerchStore(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
