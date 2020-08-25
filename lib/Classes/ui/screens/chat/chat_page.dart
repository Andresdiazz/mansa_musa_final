import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../../../Users/bloc/bloc_user.dart';
import '../../../../Users/model/user.dart';
import 'jitsi_meet.dart';
import 'jitsi_meeting_listener.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  UserBloc userBloc;

  User user;

  final TextEditingController serverText = TextEditingController();

  final TextEditingController roomText = TextEditingController();

  final TextEditingController subjectText = TextEditingController();

  final TextEditingController nameText = TextEditingController();

  final TextEditingController emailText = TextEditingController();

  var isAudioOnly = true;

  var isAudioMuted = true;

  var isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            // TODO: Handle this case.
            return CircularProgressIndicator();
          case ConnectionState.waiting:
            // TODO: Handle this case.
            return CircularProgressIndicator();
          case ConnectionState.active:
            // TODO: Handle this case.
            user = User(email: snapshot.data.email);
            return Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: SingleChildScrollView(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          /*TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: serverText,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            icon: Icon(Icons.computer),
                            labelText: "Server URL",
                            hintText: "Hint: Leave empty for meet.jitsi.si"),
                      ),*/
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: roomText,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(Icons.computer),
                                labelText: "Sala",
                                hintText:
                                    "Escribe el nombre de la sala sin tíldes ni espacios",
                                hintStyle: TextStyle(fontSize: 14)),
                            validator: (_) {
                              return 'Este campo es obligatorio';
                            },
                            autovalidate: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: subjectText,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(Icons.chat),
                                labelText: "Asunto",
                                hintText: "Escribe el asunto de la reunión"),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            textCapitalization: TextCapitalization.words,
                            controller: nameText,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: user.email,
                                labelStyle: TextStyle(color: Colors.black),
                                enabled: false,
                                filled: true,
                                icon: Icon(Icons.person),
                                hintText: "Ingresa tu nombre"),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            textCapitalization: TextCapitalization.words,
                            controller: emailText,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              border: UnderlineInputBorder(),
                              labelText: user.email,
                              labelStyle: TextStyle(color: Colors.black),
                              enabled: false,
                              icon: Icon(Icons.mail),
                              //hintText: "Ingresa tu correo" ,
                            ),
                          ),
                          CheckboxListTile(
                            title: Text("Solo Audio"),
                            value: isAudioOnly,
                            onChanged: _onAudioOnlyChanged,
                          ),
                          CheckboxListTile(
                            title: Text("Audio Apagado"),
                            value: isAudioMuted,
                            onChanged: _onAudioMutedChanged,
                          ),
                          CheckboxListTile(
                            title: Text("Video Apagado"),
                            value: isVideoMuted,
                            onChanged: _onVideoMutedChanged,
                          ),
                          Divider(
                            height: 48.0,
                            thickness: 2.0,
                          ),
                          RaisedButton(
                            onPressed: () {
                              _joinMeeting();
                            },
                            child: Text(
                              "Unirse a la reunión",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          SizedBox(
                            height: 48.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
            break;
          case ConnectionState.done:
            // TODO: Handle this case.
            user = User(email: snapshot.data.email);
            return Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: SingleChildScrollView(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          /*TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: serverText,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            icon: Icon(Icons.computer),
                            labelText: "Server URL",
                            hintText: "Hint: Leave empty for meet.jitsi.si"),
                      ),*/
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: roomText,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(Icons.computer),
                                labelText: "Sala",
                                hintText:
                                    "Escribe el nombre de la sala sin tíldes ni espacios",
                                hintStyle: TextStyle(fontSize: 14)),
                            validator: (_) {
                              return 'Este campo es obligatorio';
                            },
                            autovalidate: true,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: subjectText,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                icon: Icon(Icons.chat),
                                labelText: "Asunto",
                                hintText: "Escribe el asunto de la reunión"),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            textCapitalization: TextCapitalization.words,
                            controller: nameText,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: user.email,
                                enabled: false,
                                filled: true,
                                icon: Icon(Icons.person),
                                hintText: "Ingresa tu nombre"),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            textCapitalization: TextCapitalization.words,
                            controller: emailText,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              border: UnderlineInputBorder(),
                              labelText: user.email,
                              labelStyle: TextStyle(color: Colors.black),
                              enabled: false,
                              icon: Icon(Icons.mail),
                              hintText: "Ingresa tu correo",
                            ),
                          ),
                          CheckboxListTile(
                            title: Text("Solo Audio"),
                            value: isAudioOnly,
                            onChanged: _onAudioOnlyChanged,
                          ),
                          CheckboxListTile(
                            title: Text("Audio Apagado"),
                            value: isAudioMuted,
                            onChanged: _onAudioMutedChanged,
                          ),
                          CheckboxListTile(
                            title: Text("Video Apagado"),
                            value: isVideoMuted,
                            onChanged: _onVideoMutedChanged,
                          ),
                          Divider(
                            height: 48.0,
                            thickness: 2.0,
                          ),
                          RaisedButton(
                            onPressed: () {
                              _joinMeeting();
                            },
                            child: Text(
                              "Unirse a la reunión",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          SizedBox(
                            height: 48.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }

  _onAudioOnlyChanged(bool value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting() async {
    String serverUrl =
        serverText.text?.trim()?.isEmpty ?? "" ? null : serverText.text;

    try {
      var options = JitsiMeetingOptions()
        ..room = roomText.text
        ..serverURL = serverUrl
        ..subject = subjectText.text
        ..userDisplayName = user.email
        ..userEmail = user.email
        ..audioOnly = isAudioOnly
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeet.joinMeeting(options,
          listener: JitsiMeetingListener(onConferenceWillJoin: ({message}) {
            debugPrint("${options.room} will join with message: $message");
          }, onConferenceJoined: ({message}) {
            debugPrint("${options.room} joined with message: $message");
          }, onConferenceTerminated: ({message}) {
            debugPrint("${options.room} terminated with message: $message");
          }));
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  void _onConferenceWillJoin({message}) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined({message}) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated({message}) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
