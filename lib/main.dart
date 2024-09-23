import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bool _isHidden = true;
        final a = TextEditingController();
    final b = TextEditingController();
    @override
    Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;

      return Scaffold(
        backgroundColor: Color.fromRGBO(7, 6, 15,100),
        appBar: AppBar(
          title: const Text(
            "Tech-A-Thon",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: ListView(children: [
          // Center(
          //   child:
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white10.withAlpha(80)),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha(50),
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                ),
              ],
              color: Colors.white.withOpacity(0),
            ),
            // decoration: BoxDecoration(
            //   // color: const Color.fromRGBO(255, 255, 255, 125),
            //   // border: Border.all(strokeAlign: 10),
            //   // borderRadius: BorderRadius.circular(10),
            //
            // ),
            margin: EdgeInsets.fromLTRB(
                width * 0.15, height * 0.25, width * 0.15, height * 0.25),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: width*0.27),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    "Email:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextFormField(
                  controller: a,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter the email",
                    icon: Icon(Icons.email,color: Colors.white),
                    hintStyle: TextStyle(color: Color(0xFFe5e5e5)),
                    filled: true,
                    fillColor: Color(0x07ffffff),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    "Password:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextFormField(
                  controller: b,
                  decoration: InputDecoration(
                    suffix: GestureDetector(
                      onTap:
                      _handlePasswordToggle, // Call a function to handle the tap event
                      child: Icon(color: Colors.white,
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    icon: Icon(Icons.key,color: Colors.white),
                    // labelText: "Password:",
                    hintText: "Enter the email",
                    hintStyle: TextStyle(color: Color(0xFFe5e5e5)),
                    filled: true,
                    fillColor: Color(0x07ffffff),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  obscureText: _isHidden,

                ),
                SizedBox(height: height * 0.009),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.325),
                  child: TextButton(
                    style: const ButtonStyle(
                        overlayColor:
                        MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPassword(),
                        ),
                      );
                    },
                    child: const Text("Forget your password?",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: height * 0.01),
                ElevatedButton(
                    onPressed: () async {
                      final back_in= Provider.of<backend1>(context,listen: false);
                      var res = await back_in.sign_in(a.text, b.text);
                      print(a.text+b.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(res!),
                      ));
                      if (res == "Login Successfully") {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>homeEmployee(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        minimumSize: Size(width*07, height*0.05)
                    ),
                    child: const Text("Login",style: TextStyle(fontSize: 20))
                ),
              ],
            ),
          ),
          // ),
        ]),
      );
    }

    void _handlePasswordToggle() {
      setState(() {
        _isHidden = !_isHidden;
      });
    }
    );
  }
}

