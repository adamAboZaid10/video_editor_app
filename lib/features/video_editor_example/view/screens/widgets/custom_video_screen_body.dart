import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../manager/cubit.dart';
import '../../manager/states.dart';

class MyVideoPlayerScreen extends StatelessWidget {
  const MyVideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player Example'),
      ),
      body: BlocBuilder<VideoEditorCubit, VideoEditorState>(
        builder: (context, state) {
          if (state is LoadedVideoState) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  ElevatedButton(onPressed: ()
                  {
                    context.read<VideoEditorCubit>().trimVideo(const Duration(seconds: 10),const Duration(seconds: 10) );
                  }, child: const Text('trim')),
                  Column(
                    children: [
                      AspectRatio(
                        aspectRatio: state.controller.value.aspectRatio*.8,
                          child: VideoPlayer(state.controller)),
                      VideoProgressIndicator(state.controller, allowScrubbing: true),
                      const SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                        [
                          ElevatedButton(onPressed: ()async
                          {
                            Duration? value = await state.controller.position;
                            var d = value! - const Duration(seconds: 10);
                            state.controller.seekTo(Duration(seconds: d.inSeconds));
                          }, child: const Text('<<')),
                          ElevatedButton(onPressed: ()
                          {
                            state.controller.play();
                          }, child: const Icon(Icons.play_arrow)),
                          ElevatedButton(onPressed: ()
                          {
                            state.controller.pause();
                          }, child: const Icon(Icons.pause)),
                          ElevatedButton(onPressed: ()async
                          {
                            Duration? value = await state.controller.position;
                            var d = value! + const Duration(seconds: 10);
                            state.controller.seekTo(Duration(seconds: d.inSeconds));
                          }, child: const Text('>>')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is VideoEditorErrorState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<VideoEditorCubit>().loadVideo(context.read<VideoEditorCubit>().file!.path);
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}






