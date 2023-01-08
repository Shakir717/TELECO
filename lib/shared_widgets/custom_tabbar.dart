import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teleco/constants/colors_data.dart';
import '../constants/app_size.dart';
import 'custom_drawar.dart';
import 'custom_gradient.dart';

class CustomTabBar extends ConsumerStatefulWidget {
  final List<Widget> tabs,tabIcons;

  const CustomTabBar({Key? key,required this.tabs,required this.tabIcons}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<CustomTabBar> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void  initState() {
    _tabController=TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }
  final key=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration:const Duration(milliseconds: 1000),
      length: widget.tabs.length,
      child: SafeArea(
        child: Scaffold(
          key: key,
          endDrawer: const MainDrawer(),
          body: Column(
            children: [

              Container(
                width: double.maxFinite,
                height: Sizes.p48,
                decoration: BoxDecoration(
                    gradient: CustomGradient.customGradient(Colors.lightBlue.shade100, kNavyBlue)
                ),

                child: TabBar(
                  controller: _tabController,
                  tabs:widget.tabIcons,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: widget.tabs,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

