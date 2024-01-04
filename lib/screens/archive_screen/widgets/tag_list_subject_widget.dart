import 'package:flutter/material.dart';
import 'package:student_management/constants/colors_theme.dart';

class TagListSubjectWidget extends StatefulWidget {
  final List<String>? listTag;
  const TagListSubjectWidget({super.key, this.listTag});

  @override
  State<TagListSubjectWidget> createState() => _TagListSubjectWidgetState();
}

class _TagListSubjectWidgetState extends State<TagListSubjectWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 12,
      spacing: 12,
      children: [
        ...widget.listTag!.map((e) => TagItemSubject(tagName: e)).toList(),
        InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: ColorsTheme.white,
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: ColorsTheme.white.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.add,
              color: ColorsTheme.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class TagItemSubject extends StatelessWidget {
  final String tagName;
  const TagItemSubject({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: ColorsTheme.grayLight,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          tagName,
          style: TextStyle(color: ColorsTheme.blue, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
