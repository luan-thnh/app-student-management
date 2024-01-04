import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/colors_theme.dart';
import 'package:student_management/main.dart';
import 'package:student_management/models/student_model.dart';
import 'package:student_management/screens/archive_screen/widgets/tag_list_subject_widget.dart';
import 'package:student_management/services/api/student_api.dart';
import 'package:student_management/widgets/input_control_widget.dart';

class ModalModifyStudent extends StatefulWidget {
  final String? studentId;
  const ModalModifyStudent({super.key, this.studentId});

  @override
  State<ModalModifyStudent> createState() => _ModalModifyStudentState();
}

class _ModalModifyStudentState extends State<ModalModifyStudent> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _fullNameController;
  late TextEditingController _classController;
  late TextEditingController _studentIdController;
  late TextEditingController _emailController;
  late TextEditingController _dayOfBirthController;
  late TextEditingController _addressController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _averageMarkController;

  List<String>? listTagSubject = [];

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _classController = TextEditingController();
    _studentIdController = TextEditingController();
    _emailController = TextEditingController();
    _dayOfBirthController = TextEditingController();
    _addressController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _averageMarkController = TextEditingController();

    // Call the asynchronous method from initState
    _loadStudentData();
  }

// Asynchronous method to load student data
  Future<void> _loadStudentData() async {
    if (widget.studentId! != null) {
      final studentApi = Provider.of<StudentApi>(context, listen: false);

      try {
        StudentModel student = await studentApi.findStudentById(widget.studentId!);

        _fullNameController.text = student.fullName ?? '';
        _classController.text = student.className ?? '';
        _studentIdController.text = (student.id!.isNotEmpty ? student.id?.substring(0, 4) : student.id)!;
        _emailController.text = student.contactInfo?.email ?? '';
        _dayOfBirthController.text = '${student.dateOfBirth}' ?? '';
        _addressController.text = student.contactInfo?.address ?? '';
        _phoneNumberController.text = student.contactInfo?.phoneNumber ?? '';
        _averageMarkController.text = '${student.averageScore}' ?? '';

        listTagSubject!.clear();
        setState(() {
          listTagSubject = student.registeredCourses;
        });
      } catch (error) {
        print('Error loading student data: $error');
      }
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _classController.dispose();
    _studentIdController.dispose();
    _emailController.dispose();
    _dayOfBirthController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _averageMarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final studentApi = Provider.of<StudentApi>(context, listen: false);

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '${widget.studentId != null ? 'Edit' : 'Add'} Student Information',
                style: TextStyle(color: ColorsTheme.blueLight, fontWeight: FontWeight.w700, fontSize: 22),
              ),
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .64,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            InputControlWidget(
                              label: 'Fullname',
                              hintText: 'Nguyen Van A',
                              controller: _fullNameController,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .45, // Adjust this width as needed
                                  child: InputControlWidget(
                                    label: 'Class',
                                    hintText: 'ST21A2A',
                                    controller: _classController,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .45, // Adjust this width as needed
                                  child: InputControlWidget(
                                    label: 'Student ID',
                                    hintText: '102190028',
                                    controller: _studentIdController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .5, // Adjust this width as needed
                                  child: InputControlWidget(
                                    label: 'Email',
                                    hintText: 'bigdipper201201@gmail.com',
                                    controller: _emailController,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .4, // Adjust this width as needed
                                  child: InputControlWidget(
                                    label: 'Date of Birth',
                                    hintText: '04/25/2001',
                                    controller: _dayOfBirthController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .5, // Adjust this width as needed
                                  child: InputControlWidget(
                                    label: 'Address',
                                    hintText: '103 Hoài Thanh',
                                    controller: _addressController,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .4, // Adjust this width as needed
                                  child: InputControlWidget(
                                    label: 'Phone number',
                                    hintText: '0367780712',
                                    controller: _phoneNumberController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            InputControlWidget(
                              label: 'Average mark',
                              hintText: '3.91',
                              controller: _averageMarkController,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'List subjects',
                                style: TextStyle(color: ColorsTheme.white, fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                            if (listTagSubject!.isEmpty)
                              Text(
                                'This student doesn’t have any classes yet. Click here to add new subject!',
                                style: TextStyle(fontSize: 10, color: ColorsTheme.white),
                              ),
                            if (listTagSubject != null && listTagSubject!.isNotEmpty) TagListSubjectWidget(listTag: listTagSubject),
                            if (listTagSubject!.isEmpty) const SizedBox(width: 8),
                            if (listTagSubject!.isEmpty)
                              Center(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(999),
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(color: ColorsTheme.white, borderRadius: BorderRadius.circular(999), boxShadow: [
                                      BoxShadow(
                                        color: ColorsTheme.white.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]),
                                    child: Icon(
                                      Icons.add,
                                      color: ColorsTheme.blue,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              StudentModel newStudent = StudentModel(
                                contactInfo: ContactInfo(
                                    address: _addressController.text.trim(),
                                    email: _emailController.text.trim(),
                                    phoneNumber: _phoneNumberController.text.trim()),
                                registeredCourses: [],
                                averageScore: double.parse(_averageMarkController.text.trim()),
                                dateOfBirth: int.parse(_dayOfBirthController.text.trim()),
                                className: _classController.text.trim(),
                                fullName: _fullNameController.text.trim(),
                              );

                              widget.studentId != null
                                  ? studentApi.updateStudent(widget.studentId!, newStudent)
                                  : studentApi.createStudent(newStudent);
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const MyAppHome()));
                            },
                            borderRadius: BorderRadius.circular(999),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                              decoration: BoxDecoration(
                                color: ColorsTheme.yellowLight,
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(width: 2, color: ColorsTheme.blueMedium),
                              ),
                              child: Text(
                                widget!.studentId != null ? 'Update' : 'Save',
                                style: TextStyle(fontWeight: FontWeight.w600, color: ColorsTheme.blue, fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(999),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(width: 1, color: ColorsTheme.white),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(fontWeight: FontWeight.w400, color: ColorsTheme.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
