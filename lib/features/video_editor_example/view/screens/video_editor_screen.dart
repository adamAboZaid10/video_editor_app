import 'package:final_video_editor_project_final/features/video_editor_example/view/screens/widgets/video_editor_screen_body.dart';
import 'package:flutter/material.dart';

class VideoEditorScreen extends StatelessWidget {
  const VideoEditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Picker")),
      body:const VideoEditorScreenBody(),
    );
  }
} 