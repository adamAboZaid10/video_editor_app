
import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';
abstract class VideoEditorState {}
 
class VideoEditorInitialState extends VideoEditorState {}

class VideoEditorInitializedState extends VideoEditorState {
  final VideoEditorController controller;

  VideoEditorInitializedState(this.controller);

}

class VideoEditorExportingState extends VideoEditorState {}

class VideoEditorExportedState extends VideoEditorState {}
class VideoEditorErrorState extends VideoEditorState
{
  final String error;
  VideoEditorErrorState(this.error);
}


class LoadedVideoState extends VideoEditorState {
  final VideoPlayerController controller;

  LoadedVideoState(this.controller);
}

class VideoEditingState extends VideoEditorState {
  final VideoPlayerController videoPlayerController;
  final bool isTrimmed;

  VideoEditingState({
    required this.videoPlayerController,
    this.isTrimmed = false,
  });
}
