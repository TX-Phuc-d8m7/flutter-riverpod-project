// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notifier_provider/models/activity.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_provider.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_state.dart';

class EnumActivityPage extends ConsumerStatefulWidget {
  const EnumActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnumActivityPageState();
}

class _EnumActivityPageState extends ConsumerState<EnumActivityPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(enumActivityProvider.notifier).fetchActivity(activityTypes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<EnumActivityState>(
      enumActivityProvider,
      (previous, next) {
        if (next.status == ActivityStatus.error) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Error: ${next.error}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ));
        }
      },
    );

    final activityState = ref.watch(enumActivityProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('EnumActivityNotifier'),
        ),
        body: switch (activityState.status) {
          ActivityStatus.initial => const Center(child: Text('Initial State')),
          ActivityStatus.loading =>
            const Center(child: CircularProgressIndicator()),
          ActivityStatus.success =>
            ActivityWidget(activity: activityState.activity),
          ActivityStatus.error => Center(
              child: Text('Error: ${activityState.error}'),
            ),
        },
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              final randomNumber = Random().nextInt(activityTypes.length);
              ref.read(enumActivityProvider.notifier).fetchActivity(
                    activityTypes[randomNumber],
                  );
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh')));
  }
}

class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Activity Type: ${activity.type}'),
          const Divider(),
          BulletedList(
            bullet: const Icon(Icons.check_circle, color: Colors.green),
            listItems: [
              'activity: ${activity.activity}',
              'type: ${activity.type}',
              'participants: ${activity.participants}',
              'price: ${activity.price}',
              'link: ${activity.key}',
            ],
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
