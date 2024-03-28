import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/blocs/task_detail_bloc.dart';
import 'package:task_manager/presenters/task_detail_presenter.dart';
import 'package:task_manager/utils/my_colors.dart';
import 'package:task_manager/utils/my_constants.dart';
import 'package:task_manager/views/task_detail/checklist_card.dart';

class Checklist extends StatefulWidget {
  const Checklist({super.key, required this.presenter});
  final TaskDetailPresenter presenter;

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskDetailBloc, TaskDetailState>(
        bloc: widget.presenter.taskBloc.taskDetailBloc,
        builder: (context, state) {
          return ListView(
            children: [
              const Text(
                MyConstants.checklist,
                style: TextStyle(
                  fontFamily: MyConstants.appFont,
                  fontSize: MyConstants.largeFontSize,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary,
                ),
              ),
              for (int i = 0;
                  i <
                      widget.presenter.taskBloc.taskDetailBloc!.state.checklist
                          .length;
                  i++)
                CheckListCard(
                  item: widget
                      .presenter.taskBloc.taskDetailBloc!.state.checklist[i],
                  presenter: widget.presenter,
                ),
              if (widget
                  .presenter.taskBloc.taskDetailBloc!.state.isEdittingChecklist)
                GestureDetector(
                  onTap: () => widget.presenter.onAddChecklistItem(
                      widget.presenter.taskBloc.taskDetailBloc!.state.task.id),
                  child: Container(
                    margin: const EdgeInsets.only(left: 70,right: 70),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: MyColors.primary),
                    ),
                    child: Center(
                      child: Text(
                        MyConstants.addChecklistItem,
                        style: TextStyle(
                          fontFamily: MyConstants.appFont,
                          fontSize: MyConstants.largeFontSize,
                          color: MyColors.primary,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          );
        });
  }
}
