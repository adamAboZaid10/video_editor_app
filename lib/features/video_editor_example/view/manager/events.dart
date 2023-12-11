import 'dart:io';

abstract class VideoEditorEvent {}

class PickVideoEvent extends VideoEditorEvent {}

class InitializeEditorEvent extends VideoEditorEvent {
  final File videoFile;

  InitializeEditorEvent(this.videoFile);
}

class LoadVideoEvent extends VideoEditorEvent {
  final String videoPath;

  LoadVideoEvent(this.videoPath);
}



class ExportVideoEvent extends VideoEditorEvent {}