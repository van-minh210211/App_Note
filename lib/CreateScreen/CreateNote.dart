import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Bloc/Notes/notes_bloc.dart';
import 'package:noteapp/Helpers/modalSelectCategory.dart';
import 'package:noteapp/TextFrave.dart';
import 'package:noteapp/gen/assets.gen.dart';

class CreateNote extends StatefulWidget {
  static const ROUTER_NAME = 'CreateNote';
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  late TextEditingController _titleController;
  late TextEditingController _noteController;

  @override
  void initState() {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('CreateNote'),
        ),
        body: Container(
          child: Center(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Assets.image.icNavigationBack.svg(),
                      Text("Thứ 3, 22/11/2022")
                    ],
                  ),
                  Row(
                    children: [
                      Assets.image.icDelete.svg(),
                      Assets.image.icSaveNote.svg(),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xffF6F8F9)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: TextFrave(text: 'Category'),
                            ),
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
                                        color: Colors.grey,
                                        blurRadius: 7,
                                        spreadRadius: -5.0)
                                  ]),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15.0),
                                onTap: () => showDialogBottomFrave(context),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BlocBuilder<NotesBloc, NotesState>(
                                        builder: (_, state) => Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: state.colorCategory,
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(7.0)),
                                        ),
                                      ),
                                      BlocBuilder<NotesBloc, NotesState>(
                                          builder: (_, state) => TextFrave(
                                              text: state.category,
                                              fontWeight: FontWeight.w600)),
                                      Icon(Icons.expand_more)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
        ));
  }
}
