import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Bloc/Notes/notes_bloc.dart';
import 'package:noteapp/Helpers/modalSelectCategory.dart';
import 'package:noteapp/Helpers/modal_warning.dart';
import 'package:noteapp/Task2.dart';
// import 'package:noteapp/SelectedColor.dart';
import 'package:noteapp/TextFieldBody.dart';
import 'package:noteapp/TextFieldTitle.dart';
import 'package:noteapp/TextFrave.dart';
import 'package:noteapp/gen/assets.gen.dart';
import 'package:noteapp/location.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late bool _checkbox;
  late TextEditingController _titleController;
  late TextEditingController _noteController;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    _dateTime = DateTime.now();
    _checkbox = false;
    _titleController = TextEditingController();
    _noteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    clearText();
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void clearText() {
    _titleController.clear();
    _noteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);

    return Scaffold(
      backgroundColor: Color(0xffF2F3F7),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Assets.image.icNavigationBack.svg(),
                        Text(
                            "${"Thứ${_dateTime.weekday + 1}"}, ${_dateTime.day}/${_dateTime.month}/${_dateTime.year}"),
                      ],
                    ),
                    Row(
                      children: [
                        Assets.image.trash.svg(),
                        InkWell(
                          onTap: () {
                            if (_titleController.text.trim().isNotEmpty &&
                                _noteController.text.trim().isNotEmpty) {
                              noteBloc.add(AddNoteFrave(
                                  title: _titleController.text,
                                  body: _noteController.text,
                                  created: DateTime.now(),
                                  color: noteBloc.state.color,
                                  isComplete: false,
                                  category: noteBloc.state.category));
                              clearText();
                              Navigator.pop(context);
                            } else {
                              modalWarning(context, 'Nhập đây đủ thông tin');
                            }
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 60,
                              child: Assets.image.icSaveNote.svg()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        height: 10,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      _Category2(),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Color(0xffEECBAD),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            TextTitle(
                              controller: _titleController,
                            ),
                            SizedBox(height: 20.0),
                            TextWriteNote(controller: _noteController),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        color: Color(0xffEECBAD),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFrave(
                                  text: 'Địa điểm',
                                  fontSize: 18,
                                  color: Color(0xff4F4F4F),
                                ),
                              ],
                            ),
                            // SizedBox(height: 20.0),
                            Location(),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("nhắc nhở"),
                          _Category(),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nhắc nhở"),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: _checkbox,
                                onChanged: (value) {
                                  setState(() {
                                    _checkbox = _checkbox;
                                  });
                                },
                              ),
                              Text("Task 1"),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: int == 0 ? _checkbox : true,
                                onChanged: (value) {
                                  setState(() {
                                    _checkbox = true;
                                  });
                                },
                              ),
                              Text(
                                "Task 2",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: TextTitle3(
                                  
                                ),
                              )),
                              Assets.image.icAddSubTask.svg(
                                width: 30,
                                height: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Category extends StatefulWidget {
  @override
  State<_Category> createState() => _CategoryState();
}

class _CategoryState extends State<_Category> {
  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Color(0xffF6F8F9)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            alignment: Alignment.center,
            height: 40,
            width: 170,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 7, spreadRadius: -5.0)
                ]),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () => null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nhắc nhỏ trước 5p"),
                    Icon(Icons.expand_more)
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xffF6F8F9),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "${time.hour}:${time.minute}",
                    style: TextStyle(fontSize: 20),
                  ),
                  InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: time,
                        ).then((value) {
                          setState(() {
                            time = value!;
                          });
                        });
                      },
                      child: Icon(Icons.expand_more))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Category2 extends StatefulWidget {
  @override
  State<_Category2> createState() => _Category2State();
}

class _Category2State extends State<_Category2> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Color(0xffEECBAD)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Assets.image.dollar.svg(
                height: 30,
                width: 30,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15.0),
                onTap: () => showDialogBottomFrave(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<NotesBloc, NotesState>(
                          builder: (_, state) => TextFrave(
                              text: state.category,
                              fontWeight: FontWeight.w600)),
                      Icon(Icons.expand_more)
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${_dateTime.day}-${_dateTime.month}-${_dateTime.year}'),
                  InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                        ).then((value) {
                          setState(() {
                            _dateTime = value!;
                          });
                        });
                      },
                      child: Icon(Icons.expand_more))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
