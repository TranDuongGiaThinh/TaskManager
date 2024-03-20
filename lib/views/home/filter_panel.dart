import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/task_bloc.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/views/home/filter_panel_item.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({super.key, required this.showMessage});
  final Function(String) showMessage;

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      final selectedFilter =
          BlocProvider.of<TaskBloc>(context).state.selectedFilter;
      void onFilterSelected(String filterName) {
        widget.showMessage(filterName);

        BlocProvider.of<TaskBloc>(context)
            .add(FilterTasks(filterName: filterName));
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilterPanelItem(
            name: MyConstants.due,
            onClick: onFilterSelected,
            selected: selectedFilter == MyConstants.due,
            redPoint: true,
          ),
          FilterPanelItem(
            name: MyConstants.all,
            onClick: onFilterSelected,
            selected: selectedFilter == MyConstants.all,
          ),
          FilterPanelItem(
            name: MyConstants.inProgress,
            onClick: onFilterSelected,
            selected: selectedFilter == MyConstants.inProgress,
          ),
          FilterPanelItem(
            name: MyConstants.expired,
            onClick: onFilterSelected,
            selected: selectedFilter == MyConstants.expired,
          ),
          FilterPanelItem(
            name: MyConstants.completed,
            onClick: onFilterSelected,
            selected: selectedFilter == MyConstants.completed,
          ),
        ],
      );
    });
  }
}
