import 'package:chatapp/screens/chatpage.dart';
import 'package:chatapp/utils/boolean.dart';
import 'package:chatapp/utils/color_constant.dart';
import 'package:chatapp/utils/controller.dart';
import 'package:chatapp/utils/string_constant.dart';
import 'package:chatapp/widgets/common_elevatedbutton.dart';
import 'package:chatapp/widgets/common_textfield.dart';
import 'package:flutter/material.dart';

class LoginPageClass extends StatefulWidget {
  const LoginPageClass({super.key});

  @override
  State<LoginPageClass> createState() => _LoginPageClassState();
}

class _LoginPageClassState extends State<LoginPageClass> {
  final formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Sender';

  var items = [
    'Sender',
    'Receiver',
  ];
  String name = '';
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 38, 47),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 38, 47),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 32, right: 26),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Welcome',
                        style: TextStyle(
                            color: ColorConstant.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700)),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Back',
                        style: TextStyle(
                            color: ColorConstant.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  TextFormFieldWidget(
                    outlinedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    iconcolor: ColorConstant.black,
                    color: ColorConstant.grey,
                    controller: ControllersClass.userNameController,
                    validator: (value) {
                      String namePattern = r'^[a-z A-Z,.\-]+$';
                      RegExp regExp = RegExp(namePattern);
                      if (value.isEmpty) {
                        return StringConstant.emptymessage;
                      } else if (!regExp.hasMatch(value)) {
                        return StringConstant.usernamemessage;
                      }

                      return null;
                    },
                    onchange: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    hinttext: StringConstant.usernamelhint,
                    hintstyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                    obscuretext: false,
                    image: (Icons.person_rounded),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  TextFormFieldWidget(
                    outlinedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    iconcolor: ColorConstant.black,
                    color: ColorConstant.grey,
                    hinttext: StringConstant.passhint,
                    hintstyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                    obscuretext: isVisible,
                    image: (Icons.lock_rounded),
                    iconimage: isVisible == true
                        ? (Icons.visibility_off_outlined)
                        : (Icons.visibility_outlined),
                    validator: (value) {
                      String pattern =
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp regExp = RegExp(pattern);
                      if (value.isEmpty) {
                        return StringConstant.emptymessage;
                      } else if (!regExp.hasMatch(value)) {
                        return StringConstant.passwordmessage;
                      }

                      return null;
                    },
                    onshowhide: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Type of User',style: TextStyle(color: Colors.white,fontSize: 16)),
                     const  SizedBox(width: 20,),
                      DropdownButton(
                        iconEnabledColor: Colors.blue,
                      style: const TextStyle(color: Colors.blue,fontSize: 15),

                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownvalue = newValue!; 
                            if(newValue==items.first){

                          BooleanClass.isSender=false;
                            }
                            else{
                              BooleanClass.isSender=true;
                            }
                            
                          });
                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      // ADD THE HOMESCREEN
                                      const LoginPageClass())));
                        },
                        child: Text(
                          StringConstant.forgetpass,
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorConstant.red,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButtonWidget(
                      text: StringConstant.login,
                      onpress: () {
                        if (formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: ColorConstant.grey,
                                content: Text(
                                  StringConstant.loginsnackbar,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: ColorConstant.red),
                                )),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatPageClass()));
                        }
                      },
                    ),
                  ),
                  
                  const SizedBox(
                    height: 75,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringConstant.createAnAcc,
                              style: TextStyle(
                                  color: ColorConstant.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              StringConstant.signUp,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: ColorConstant.red,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorConstant.red,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
