import 'package:final_video_editor_project_final/features/video_editor_example/view/screens/widgets/custom_video_screen_body.dart';
import 'package:flutter/material.dart';

class ShowVideoScreen extends StatelessWidget {
  const ShowVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyVideoPlayerScreen(),
    );
  }
}
