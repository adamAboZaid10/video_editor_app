import 'package:final_video_editor_project_final/features/video_editor_example/view/manager/cubit.dart';
import 'package:final_video_editor_project_final/features/video_editor_example/view/screens/video_editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => VideoEditorCubit(),
        child: MaterialApp(
          title: 'Flutter Video Editor Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          
          ),
          home: const VideoEditorScreen(),
        ),
      ),
    );