import 'package:flutter/material.dart';
import 'package:task_manager/presenters/task_detail_presenter.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/utils/my_icon.dart';
import 'package:task_manager/models/checklist_item_model.dart';

class CheckListCard extends StatefulWidget {
  const CheckListCard({super.key, required this.item, required this.presenter});
  final ChecklistItem item;
  final TaskDetailPresenter presenter;

  @override
  State<CheckListCard> createState() => _CheckListCardState();
}

class _CheckListCardState extends State<CheckListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              widget.presenter.onClickCheckBoxChecklistItem(widget.item);
            },
            child: widget.item.completed
                ? const Icon(MyIcon.checkedBox, color: MyColors.primary)
                : const Icon(MyIcon.box, color: MyColors.iconUnchecked),
          ),
          const SizedBox(width: 10),
          if (widget.presenter.taskBloc.taskDetailBloc!.state
                      .edittingChecklistItem ==
                  null ||
              widget.presenter.taskBloc.taskDetailBloc!.state
                      .edittingChecklistItem?.id !=
                  widget.item.id)
            Expanded(
              child: Text(
                widget.item.name,
                style: const TextStyle(
                  fontFamily: MyConstants.appFont,
                  fontSize: MyConstants.largeFontSize,
                  color: MyColors.headerText,
                ),
              ),
            )
          else if (widget.presenter.taskBloc.taskDetailBloc!.state
                  .edittingChecklistItem!.id ==
              widget.item.id)
            Expanded(
              child: Container(
                height: 50,
                child: TextField(
                  controller: widget.presenter.taskBloc.taskDetailBloc!.state
                      .checklistItemController,
                  autofocus: true,
                  style: TextStyle(
                    fontFamily: MyConstants.appFont,
                    fontSize: MyConstants.largeFontSize,
                    color: MyColors.headerText,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: widget.presenter.taskBloc.taskDetailBloc!.state
                        .checklistItemController.text,
                    hintStyle: TextStyle(
                      fontFamily: MyConstants.appFont,
                      fontSize: MyConstants.largeFontSize,
                      color: MyColors.headerText,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    suffixIcon: GestureDetector(
                      onTap: widget.presenter.saveEdittingChecklistItem,
                      child: Icon(
                        MyIcon.save,
                        color: MyColors.headerText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (widget.presenter.taskBloc.taskDetailBloc!.state
                  .isEdittingChecklist &&
              widget.presenter.taskBloc.taskDetailBloc!.state
                      .edittingChecklistItem?.id !=
                  widget.item.id)
            GestureDetector(
              onTap: () {
                widget.presenter.onEdittingChecklistItem(widget.item);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  MyIcon.edit,
                  color: MyColors.headerText,
                ),
              ),
            ),
            if (widget.presenter.taskBloc.taskDetailBloc!.state
                  .isEdittingChecklist &&
              widget.presenter.taskBloc.taskDetailBloc!.state
                      .edittingChecklistItem?.id !=
                  widget.item.id)
            GestureDetector(
              onTap: () {
                widget.presenter.onDeleteChecklistItem(widget.item);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  MyIcon.delete,
                  color: MyColors.headerText,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
