import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_management/constants/urls.dart';
import 'package:student_management/models/student_model.dart';

class StudentApi extends ChangeNotifier {
  bool _isDeleting = false;
  bool get isDeleting => _isDeleting;

  Future<List<StudentModel>> findAllStudents() async {
    final response = await http.get(Uri.parse('$baseUrl/v1/students'));

    if (response.statusCode == 200) {
      List<StudentModel> students = (json.decode(response.body) as List<dynamic>).map((e) => StudentModel.fromJson(e)).toList();
      notifyListeners();
      return students;
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<StudentModel> findStudentById(String studentId) async {
    final response = await http.get(Uri.parse('$baseUrl/v1/students/$studentId'));

    if (response.statusCode == 200) {
      StudentModel student = StudentModel.fromJson(json.decode(response.body));
      notifyListeners();
      return student;
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<StudentModel> createStudent(StudentModel student) async {
    final response = await http.post(
      Uri.parse('$baseUrl/v1/students'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(student.toJson()),
    );

    if (response.statusCode == 201) {
      StudentModel createdStudent = StudentModel.fromJson(json.decode(response.body));
      notifyListeners();
      return createdStudent;
    } else {
      throw Exception('Failed to create student');
    }
  }

  Future<StudentModel> updateStudent(String studentId, StudentModel updatedStudent) async {
    final response = await http.put(
      Uri.parse('$baseUrl/v1/students/$studentId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedStudent.toJson()),
    );

    if (response.statusCode == 200) {
      StudentModel updatedStudent = StudentModel.fromJson(json.decode(response.body));
      notifyListeners();
      return updatedStudent;
    } else {
      throw Exception('Failed to update student');
    }
  }

  Future<StudentModel> findRemoveStudentById(String studentId) async {
    _isDeleting = true;
    final response = await http.delete(Uri.parse('$baseUrl/v1/students/$studentId'));

    if (response.statusCode == 200) {
      StudentModel student = StudentModel.fromJson(json.decode(response.body));
      _isDeleting = false;
      notifyListeners();
      return student;
    } else {
      throw Exception('Failed to load students');
    }
  }
}
