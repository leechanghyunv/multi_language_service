
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../core/localization/locale_provider.dart';

class Calendar extends HookConsumerWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedDay = useState(DateTime.now());
    final selectedDay = useState<DateTime?>(null);
    final locale = ref.watch(calendarLocaleProvider);

    return TableCalendar(
      locale: locale,
      firstDay: DateTime(2020),
      lastDay: DateTime(2030),
      focusedDay: focusedDay.value,
      selectedDayPredicate: (day) => isSameDay(selectedDay.value, day),
      onDaySelected: (selected, focused) {
        selectedDay.value = selected;
        focusedDay.value = focused;
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}