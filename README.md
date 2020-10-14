# Flutter-App-for-audio-video-streaming

The app contains 3 pages - main, music, & video.
main contains the landing page, music has the music player & video player is inside video.

The first page navigates the user to the audio player/video player depending on the user's choice.
This was done by creating 2 containers with seperate texts and wrapping each container in a GestureDetector.

 <img src="/assets/landingpage.jpeg" height="700">

Now, both the media players are stateful widgets since we need state for a media player.
In the audio player, we can load the file from local phone storage, assets or a url.

The initState method loads the audioplayer and uses audio from assets/files/url.
The user can click on play & start listening.
The play & pause button are used inside an if-else. If the audio is playing, we see a pause button,
& if the audio is paused, we see a play button.
The stop button stops the audio terminates the audio player.

 <img src="/assets/musicplayer.jpeg" height="700">
 
The same goes for the video player, we can load the video from assets or from a url.
The initState methods load the video, while this is happening, we display a circularProgressIndicator to tell the user
that their video is loading.
The play,pause & stop buttons work in the same way as in the audioplayer.

<img src="/assets/videoplayer.jpeg" height="700">


