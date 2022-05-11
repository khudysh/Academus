import 'package:flutter/material.dart';
import 'package:srm_test/screens/home/home_card.dart';

const destinationRegister = "Журнал";
const destinationTimetable = "Расписание";
const destinationGroups = "Группы";
const destinationStudents = "Ученики";
const destinationHome = "Главная";
const minDesktopSize = 600;
final selectedItem = <String>[
  destinationHome,
  destinationTimetable,
  destinationRegister,
  destinationGroups,
  destinationStudents,
];
const cardList = [
  HomeCard(
    title: "Расписание",
    icon: Icons.schedule,
    describe: "Расписание занятий\n по кабинетам",
    screenNum: 1,
  ),
  HomeCard(
    title: "Журнал",
    icon: Icons.app_registration,
    describe: "Журнал посещений\n и темы уроков",
    screenNum: 2,
  ),
  HomeCard(
    title: "Группы",
    icon: Icons.groups,
    describe: "Группы, их расписание\n и состав",
    screenNum: 3,
  ),
  HomeCard(
    title: "Ученики",
    icon: Icons.person_search,
    describe: "Информация по\n всем ученикам",
    screenNum: 4,
  ),
];
