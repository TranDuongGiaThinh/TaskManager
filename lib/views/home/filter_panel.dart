import 'package:flutter/material.dart';
import 'package:task_manager/info_app/my_constants.dart';
import 'package:task_manager/views/home/filter_panel_item.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({super.key});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterPanelItem(
          name: MyConstants.due,
          onClick: (String a) {},
          selected: false,
          redPoint: true,
        ),
        FilterPanelItem(
          name: MyConstants.all,
          onClick: (String a) {},
          selected: true,
        ),
        FilterPanelItem(
          name: MyConstants.inProgress,
          onClick: (String a) {},
          selected: false,
        ),
        FilterPanelItem(
          name: MyConstants.expired,
          onClick: (String a) {},
          selected: false,
        ),
        FilterPanelItem(
          name: MyConstants.completed,
          onClick: (String a) {},
          selected: false,
        ),
      ],
    );
  }
}
