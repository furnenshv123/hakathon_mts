import 'package:flutter/material.dart';
import 'package:hakathon_with_mts/core/shared/colors.dart';

class SelectedLampScreen extends StatefulWidget {
  const SelectedLampScreen({super.key});

  @override
  State<SelectedLampScreen> createState() => _SelectedLampScreenState();
}

class _SelectedLampScreenState extends State<SelectedLampScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: Text(
              'Устройства',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontFamily: "MTSCompactMedium",
                fontSize: 17,
              ),
            ),
          ),
          TabBar(
            onTap: (value) {
              setState(() {});
            },
            dividerColor: Colors.transparent,
            indicatorColor: redMainColor,
            tabs: [
              Tab(
                child: Text(
                  'Общие',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: "MTSCompactMedium",
                    fontSize: 17,
                    color:
                        _tabController.index == 0
                            ? fontBlackColor
                            : fontInactiveColor,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Для дома',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: "MTSCompactMedium",
                    fontSize: 17,
                    color:
                        _tabController.index == 1
                            ? fontBlackColor
                            : fontInactiveColor,
                  ),
                ),
              ),
            ],

            controller: _tabController,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}