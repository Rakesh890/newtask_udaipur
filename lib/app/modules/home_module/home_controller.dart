import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newtask/app/data/model/Student.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeController extends GetxController {
  final studentList = <Student>[].obs;
  final invitedList = <Student>[].obs;
  var selectTabIndex = 0.obs;
  var selectedInviteIndex = 0.obs;
  TextEditingController searchBarInput = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getStudentList();
  }

  getStudentList() {
    studentList.value = [
      Student(
          name: "Anita",
          className: "10th",
          address: "Surat",
          gender: "Female",
          isInvited: false
      ),
      Student(
          name: "Hitesh",
          className: "12th",
          address: "Udaipur",
          gender: "Male",
          isInvited: false
      ),
      Student(
          name: "Rahul",
          className: "10th",
          address: "Udaipur",
          gender: "Male",
          isInvited: false
      ),
      Student(
          name: "Jyoti",
          className: "12th",
          address: "Noida",
          gender: "Female",
          isInvited: false
      ),
      Student(
          name: "Heena",
          className: "12th",
          address: "Udaipur",
          gender: "Female",
          isInvited: false
      ),
      Student(
          name: "Sonia",
          className: "12th",
          address: "Delhi",
          gender: "Female",
          isInvited: false
      ),
      Student(
          name: "Dinesh",
          className: "8th",
          address: "Noida",
          gender: "Male",
          isInvited: false
      ),
      Student(
          name: "Nirmal",
          className: "8th",
          address: "Jaipur",
          gender: "Male",
          isInvited: false
      ),
      Student(
          name: "Pooja",
          className: "8th",
          address: "Jaipur",
          gender: "Female",
          isInvited: false
      ),
      Student(
          name: "Reena",
          className: "3rd Year",
          address: "Himachal",
          gender: "Female",
          isInvited: false
      )
    ];
    studentList.sort((studentItem, item) {
      return studentItem.name.toLowerCase().compareTo(item.name.toLowerCase());
    });
    invitedList.value = studentList;
  }

  //When Search From Student List
  void onSearchedInput(String studentName) {
    print(studentName);
    List<Student> results = [];
    if (studentName.isEmpty) {
      getStudentList();
    } else if (studentName.length < 5) {
      getStudentList();
      results = studentList
          .where((element) =>
      (element.name
          .toString()
          .toLowerCase()
          .contains(studentName.toLowerCase())) ||
          (element.className
              .toString()
              .toLowerCase()
              .contains(studentName.toLowerCase())) ||
          (element.address
              .toString()
              .toLowerCase()
              .contains(studentName.toLowerCase())))
          .toList();
      studentList.value = results;
    } else {
      results = studentList
          .where((element) =>
      (element.name
          .toString()
          .toLowerCase()
          .contains(studentName.toLowerCase())) ||
          (element.className
              .toString()
              .toLowerCase()
              .contains(studentName.toLowerCase())) ||
          (element.address
              .toString()
              .toLowerCase()
              .contains(studentName.toLowerCase())))
          .toList();
      studentList.value = results;
    }
  }

  selectTabItem(int val) {
    selectTabIndex.value = val;
    print(selectTabIndex);
  }




}
