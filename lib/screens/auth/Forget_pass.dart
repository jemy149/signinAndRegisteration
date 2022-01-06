// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:workos_english/screens/auth/SignUp.dart';

class ForgetPassScreen extends StatefulWidget {
  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  // controller to manage every thing in text field including text and every thing
  late TextEditingController _forgetPassTextController =
      TextEditingController(text: '');

  bool _obscureText = true;
  final _ForgetPassScreenFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _animationController.dispose();
    _forgetPassTextController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  void _forgetPassFCT() {
    print('_forgetPassTextController.text${_forgetPassTextController.text}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Colors.blue,
        body: Stack(
      children: [
        // CachedNetworkImage(
        //   imageUrl:
        //       "https://media.istockphoto.com/photos/businesswoman-using-computer-in-dark-office-picture-id557608443?k=6&m=557608443&s=612x612&w=0&h=fWWESl6nk7T6ufo4sRjRBSeSiaiVYAzVrY-CLlfMptM=",
        //   placeholder: (context, url) => Image.asset(
        //     'assets/images/wallpaper.jpg',
        //     fit: BoxFit.fill,
        //   ),
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.cover,
        //   alignment: FractionalOffset(_animation.value, 0),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Text(
                'Forget Password?',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _forgetPassTextController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                onPressed: _forgetPassFCT,
                color: Colors.pink.shade700,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Reset Now',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
