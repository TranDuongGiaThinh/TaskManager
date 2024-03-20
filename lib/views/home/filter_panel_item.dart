import 'package:flutter/material.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';

class FilterPanelItem extends StatefulWidget {
  const FilterPanelItem({
    super.key,
    required this.name,
    required this.onClick,
    required this.selected,
    this.redPoint,
  });

  final bool selected;
  final Function(String) onClick;
  final String name;
  final bool? redPoint;

  @override
  State<FilterPanelItem> createState() => _FilterPanelItemState();
}

class _FilterPanelItemState extends State<FilterPanelItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(widget.name),
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: widget.selected
              ? MyColors.filterPannelItemBackgroundSelected
              : MyColors.filterPannelItemBackground,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              widget.name,
              textAlign: TextAlign.center,
              style: widget.selected
                  ? const TextStyle(
                      fontFamily: MyConstants.appFont,
                      fontWeight: FontWeight.bold,
                      fontSize: MyConstants.mediumFontSize,
                      color: MyColors.filterPannelItemTextSelected,
                    )
                  : const TextStyle(
                      fontFamily: MyConstants.appFont,
                      fontSize: MyConstants.mediumFontSize,
                      color: MyColors.filterPannelItemText,
                    ),
            ),
            if (widget.redPoint ?? false)
              Positioned(
                top: MyConstants.redPointTop,
                right: MyConstants.redPointRight,
                child: Container(
                  width: MyConstants.redPointSize,
                  height: MyConstants.redPointSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.redPoint,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
