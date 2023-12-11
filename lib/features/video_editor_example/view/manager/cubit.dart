import 'dart:io';

import 'package:final_video_editor_project_final/features/video_editor_example/view/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editor/video_editor.dart';
import 'package:video_editor_2/domain/bloc/controller.dart';
import 'package:video_player/video_player.dart';

class VideoEditorCubit extends Cubit<VideoEditorState> {
  final ImagePicker _picker = ImagePicker();

  VideoEditorCubit() : super(VideoEditorInitialState());
   XFile? file;
  void pickVideo() async {
     file = await _picker.pickVideo(source: ImageSource.gallery);

    if (file != null) {
      emit(VideoEditorInitializedState(
        VideoEditorController.file(
          File(file!.path),
          minDuration: const Duration(seconds: 1),
          maxDuration: const Duration(seconds: 10),
        ),
      ));
    }
  }

  void loadVideo(String videoPath) async {
    try {
      final VideoPlayerController controller =
      VideoPlayerController.file(File(videoPath));
      await controller.initialize();
      emit(LoadedVideoState(controller));
    } catch (e) {
      emit(VideoEditorErrorState('Failed to load video: $e'));
    }
  }


  void initializeEditor() async{
    emit(VideoEditorInitializedState(
      VideoEditorController.file(
        XFile(file!.path),
        minDuration: const Duration(seconds: 1),
        maxDuration: const Duration(seconds: 10),
      ),

    ));

  }



  void trimVideo(Duration start, Duration end) async {
    const outputVideoPath = "path_to_save_trimmed_video.mp4";

    final video = VideoEditorController.file(XFile(file!.path));
    final trimmedVideo =  video.trimmedDuration;

    await trimmedVideo.isTrimmed(
      outputVideoPath,
      onProgress: (progress) {
        print("Exporting: $progress%");
      },
    );

    final trimmedVideoPlayerController = VideoPlayerController.file(File(outputVideoPath));
    await trimmedVideoPlayerController.initialize();

    emit(VideoEditingState(
      videoPlayerController: trimmedVideoPlayerController,
      isTrimmed: true,
    ));
  }
}


  // void addTextToVideo(VideoEditorController controller, String text, Duration position) {
  //   controller.addText(text, position);
  // }
