import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Bloc/Notes/notes_bloc.dart';
import 'package:noteapp/Bloc/general/general_bloc.dart';
import 'package:noteapp/Models/NoteModels.dart';
import 'package:noteapp/Overview/AddNotePage.dart';
import 'package:noteapp/Overview/ShowNotePage.dart';
import 'package:noteapp/TextFrave.dart';
import 'package:noteapp/gen/assets.gen.dart';
import 'package:timeago/timeago.dart' as timeago;

class OverviewScreen extends StatefulWidget {
  static const ROUTER_NAME = 'OverviewScreen';
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollControllerApp);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_scrollControllerApp);
    super.dispose();
  }

  void _scrollControllerApp() {
    if (_scrollController.offset > 170) {
      BlocProvider.of<GeneralBloc>(context).add(IsScrollTopAppBarEvent(true));
    } else {
      BlocProvider.of<GeneralBloc>(context).add(IsScrollTopAppBarEvent(false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);
    final box = Hive.box<NoteModels>('keepNote');
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('OverviewScreen'),
//         ),
//         body: Row(
//           children: [
//             Container(
//               width: 200,
//               height: 250,
//               color: Colors.amber,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Assets.image.icCategoryPrivate.svg(),
//                       Text("22/11/2021"),
//                     ],
//                   ),
//                   Text(
//                     "Noijp dung ghi chu max 3 ding 3 đóaadfadslksadfasdf;asdf;alsdf;alef;labsdfgskndflgksnfglskfdnglsdfknglskdngslknre'glksfdnglskdfngsldkfn'lfgks'dfkngs'fdgkns'dfkgns'dfgkn",
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   Row(
//                     children: [Text("Henj gio: "), Text("09:00")],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Assets.image.icDelete.svg(),
//                       Assets.image.icEditNote.svg()
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//         floatingActionButton: new FloatingActionButton(
//             elevation: 0.0,
//             child: new Icon(Icons.check),
//             backgroundColor: new Color(0xFFE57373),
//             onPressed: () {
//               Navigator.of(context).pushNamed('CreateNote');
//             }));
//   }
// }
    return Scaffold(
      backgroundColor: Color(0xffF2F3F7),
      body: Container(
        child: BlocBuilder<NotesBloc, NotesState>(builder: (_, state) {
          return state.isList
              ? Container(
                  child: Column(
                    children: [
                      _GridViewNote(),
                    ],
                  ),
                )
              : _GridViewNote();
        }),
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddNotePage())),
        child: CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xff1977F3),
          child: const Icon(Icons.mode_edit_outline, color: Colors.white),
        ),
      ),
    );
  }
}

class _GridViewNote extends StatelessWidget {
  const _GridViewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteBloc = BlocProvider.of<NotesBloc>(context);
    final box = Hive.box<NoteModels>('keepNote');

    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 10,
            maxCrossAxisExtent: 200,
            mainAxisExtent: 250),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: box.values.length,
        itemBuilder: (_, i) {
          NoteModels note = box.getAt(i)!;

          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ShowNotePage(note: note, index: i))),
            child: Dismissible(
              key: Key(note.title!),
              direction: DismissDirection.endToStart,
              background: Container(),
              secondaryBackground: Container(
                padding: EdgeInsets.only(bottom: 35.0),
                margin: EdgeInsets.only(bottom: 15.0),
                // alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Icon(Icons.delete, color: Colors.white, size: 40),
              ),
              onDismissed: (direction) => noteBloc.add(DeleteNoteEvent(i)),
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.amber),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Assets.image.dollar.svg(width: 22, height: 22),
                        Center(
                            child: TextFrave(
                                text: note.title.toString(),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: Container(
                          child: TextFrave(
                        text: note.body.toString(),
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Assets.image.trash.svg(),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ShowNotePage(note: note, index: i)));
                            },
                            child: Assets.image.icEditNote.svg()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
