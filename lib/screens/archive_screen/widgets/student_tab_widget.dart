import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/colors_theme.dart';
import 'package:student_management/constants/image_urls.dart';
import 'package:student_management/main.dart';
import 'package:student_management/models/student_model.dart';
import 'package:student_management/screens/archive_screen/widgets/modal_modify_student.dart';
import 'package:student_management/services/api/student_api.dart';
import 'package:student_management/utils/dialog_ultis.dart';

class StudentTabWidget extends StatefulWidget {
  const StudentTabWidget({super.key});

  @override
  State<StudentTabWidget> createState() => _StudentTabWidgetState();
}

class _StudentTabWidgetState extends State<StudentTabWidget> {
  @override
  Widget build(BuildContext context) {
    final studentApi = Provider.of<StudentApi>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'List students',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: ColorsTheme.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(46),
                            ),
                            builder: (BuildContext context) {
                              return LayoutBuilder(
                                builder: (context, constraints) {
                                  return const ModalModifyStudent();
                                },
                              );
                            },
                          );
                        },
                        icon: SvgPicture.asset(ImageUrls.plusIcon))
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(fontSize: 12, color: ColorsTheme.yellow),
                      ),
                      const SizedBox(width: 2),
                      SvgPicture.asset(
                        ImageUrls.arrowDownIcon,
                        width: 12,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: studentApi.findAllStudents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Text('No data available');
              } else {
                List<StudentModel> students = snapshot.data as List<StudentModel>;

                return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return ItemStudent(
                      student: students[index],
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}

class ItemStudent extends StatefulWidget {
  final StudentModel student;
  const ItemStudent({super.key, required this.student});

  @override
  State<ItemStudent> createState() => _ItemStudentState();
}

class _ItemStudentState extends State<ItemStudent> {
  @override
  Widget build(BuildContext context) {
    ContactInfo contactInfo = widget.student.contactInfo!;
    final studentApi = Provider.of<StudentApi>(context, listen: false);

    void handleRemoveStudent(studentId) async {
      try {
        StudentModel res = await studentApi.findRemoveStudentById(studentId);

        if (res.id!.isNotEmpty) {
          if (!context.mounted) return;
          Navigator.push(context, MaterialPageRoute(builder: (_) => const MyAppHome()));
        }
        ;
      } catch (error) {
        print('Error deleting student: $error');
      }
    }

    return Stack(
      alignment: Alignment.centerLeft,
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 0,
          color: ColorsTheme.light,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.only(left: 32, right: 16),
            title: Text(
              widget.student.fullName ?? '',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            subtitle: Text(
              '${widget.student.className!.length > 4 ? widget.student.className?.substring(0, 4).toUpperCase() : widget.student.className}-${contactInfo.email}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: ColorsTheme.darkMediumGray),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: ColorsTheme.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46),
                        ),
                        builder: (BuildContext context) {
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              return ModalModifyStudent(
                                studentId: widget.student.id,
                              );
                            },
                          );
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(999),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        ImageUrls.editOutlineIcon,
                        width: 18,
                      ),
                    )),
                InkWell(
                    onTap: () {
                      DialogUtils.showMyDialog(context, () {
                        handleRemoveStudent(widget.student.id);
                      });
                    },
                    borderRadius: BorderRadius.circular(999),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        ImageUrls.trashOutlineIcon,
                        width: 18,
                      ),
                    )),
              ],
            ),
          ),
        ),
        Positioned(
          left: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            decoration: BoxDecoration(
              color: ColorsTheme.blue,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: ColorsTheme.darkGray.withOpacity(0.6),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              widget.student.averageScore.toStringAsFixed(2),
              style: TextStyle(color: ColorsTheme.white, fontWeight: FontWeight.w700, fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}
