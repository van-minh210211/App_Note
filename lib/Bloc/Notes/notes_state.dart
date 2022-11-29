part of 'notes_bloc.dart';

@immutable
class NotesState {
  final int color;
  final String category;
  final String note;
  final Color colorCategory;
  final bool isList;
  final int noteLength;

  const NotesState({
    this.color = 0xff1977F3,
    this.category = 'Danh mục',
    this.note = 'Nhắc trước 5p',
    this.colorCategory = Colors.grey,
    this.isList = true,
    this.noteLength = 0,
  });

  NotesState copyWith({
    int? color,
    String? category,
    String? note,
    Color? colorCategory,
    bool? isList,
    int? noteLength,
  }) =>
      NotesState(
        note: note ?? this.note,
        color: color ?? this.color,
        category: category ?? this.category,
        colorCategory: colorCategory ?? this.colorCategory,
        isList: isList ?? this.isList,
        noteLength: noteLength ?? this.noteLength,
      );
}
