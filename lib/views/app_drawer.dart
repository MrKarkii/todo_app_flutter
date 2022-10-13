import 'package:flutter/material.dart';
import 'package:todo_app/blocs/bloc_exports.dart';
import 'package:todo_app/views/recycle_bin.dart';
import 'package:todo_app/views/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              color: Colors.grey,
              child: const Text(
                'Task Drawer',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    TabScreen.id,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.folder_special,
                    ),
                    title: const Text("My Tasks"),
                    trailing: Text('${state.pendingTasks.length}  | ${state.completedTasks.length} '),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(
                      Icons.delete,
                    ),
                    title: const Text("Bin"),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
