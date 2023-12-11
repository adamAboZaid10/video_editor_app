import 'package:final_video_editor_project_final/features/video_editor_example/view/manager/cubit.dart';
import 'package:final_video_editor_project_final/features/video_editor_example/view/screens/screen_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoEditorScreenBody extends StatelessWidget {
  const VideoEditorScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Click on the button to select video"),
            ElevatedButton(
              onPressed: () {
                context.read<VideoEditorCubit>().pickVideo();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShowVideoScreen()));
              },
              child: const Text("Pick "),
            ),
          ],
        ),
      );
  }
}