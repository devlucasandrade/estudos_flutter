import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/models/task.dart';
import 'package:flutter_tasks_app/screens/edit_task_screen.dart';
import 'package:flutter_tasks_app/widgets/popup_menu.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(oldTask: task),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration: task.isDone!
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy hh:mm').format(
                          DateTime.parse(task.date),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: task.isDone,
                      onChanged: task.isDeleted == false
                          ? (value) {
                              context
                                  .read<TasksBloc>()
                                  .add(UpdateTask(task: task));
                            }
                          : null,
                    ),
                    PopupMenu(
                      task: task,
                      cancelOrDeleteCallback: () =>
                          _removeOrDeleteTask(context, task),
                      likeOrDislikeCallback: () =>
                          context.read<TasksBloc>().add(
                                MarkFavoriteOrUnfavoriteTask(task: task),
                              ),
                      editTaskCallback: () {
                        Navigator.of(context).pop();
                        _editTask(context);
                      },
                      restoreTaskCallback: () => context
                          .read<TasksBloc>()
                          .add(RestoreTask(task: task)),
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
}




// ListTile(
//       title: Text(
//         task.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//           decoration:
//               task.isDone! ? TextDecoration.lineThrough : TextDecoration.none,
//         ),
//       ),
//       trailing: Checkbox(
//         value: task.isDone,
//         onChanged: task.isDeleted == false
//             ? (value) {
//                 context.read<TasksBloc>().add(UpdateTask(task: task));
//               }
//             : null,
//       ),
//       onLongPress: () => _removeOrDeleteTask(context, task),
//     );