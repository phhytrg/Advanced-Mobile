import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class Jitsi {
  static const String serverUrl = 'https://meet.lettutor.com';
  static const bool isAudioOnly = true;
  static const bool isAudioMuted = true;
  static const bool isVideoMuted = true;
  static const String defaultAvatar =
      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';
  static const String tokenPrefix = "token=";

  static JitsiMeetingOptions getOptions({
    required String meetingUrl,
    required String subject,
    bool isAudioOnly = isAudioOnly,
    bool isAudioMuted = isAudioMuted,
    bool isVideoMuted = isVideoMuted,
    required String userDisplayName,
    required String userEmail,
    required String userAvatarUrl,
  }) {
    var options = JitsiMeetingOptions(
      roomNameOrUrl: meetingUrl,
      serverUrl: serverUrl,
      subject: subject,
      token: meetingUrl,
      isAudioMuted: isAudioMuted,
      isAudioOnly: isAudioOnly,
      isVideoMuted: isVideoMuted,
      userDisplayName: userDisplayName,
      userEmail: userEmail,
      userAvatarUrl: userAvatarUrl.isEmpty ? defaultAvatar : userAvatarUrl,
      featureFlags: {},
    );
    return options;
  }

  static getToken(String meetingUrl) {
    // Find the index of the search string
    int index = meetingUrl.indexOf(tokenPrefix);
    if (index != -1) {
      // If the search string is found, get the substring after it
      String result = meetingUrl.substring(index + tokenPrefix.length);
      return result;
    } else {
      throw Exception('Token not found');
    }
  }
}
