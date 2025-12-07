import 'package:flutter/material.dart';
import 'package:thrillzz_sports_app/presentation/pages/sports/widgets/date_field/date_field_styles.dart';

class DateField extends StatelessWidget {
  const DateField({
    required this.label,
    required this.onSubmitted,
    this.hintText,
    this.initialDate,
    super.key,
  });

  final String label;
  final String? hintText;
  final DateTime? initialDate;
  final ValueChanged<DateTime?> onSubmitted;

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
      initialDate: initialDate ?? now,
    );
    onSubmitted(picked);
  }

  @override
  Widget build(BuildContext context) {
    final text = initialDate == null
        ? ''
        : '${initialDate!.year}-${initialDate!.month.toString().padLeft(2, '0')}-${initialDate!.day.toString().padLeft(2, '0')}';
    final controller = TextEditingController(text: text);

    return TextField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText ?? label,
        suffixIcon: const Icon(
          Icons.calendar_today_outlined,
          size: DateFieldStyles.iconSize,
        ),
      ),
      onTap: () => _pickDate(context),
    );
  }
}
