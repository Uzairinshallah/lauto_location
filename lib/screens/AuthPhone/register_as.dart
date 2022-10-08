import 'package:flutter/material.dart';
import 'package:lauto_location/screens/AuthPhone/signup_form.dart';
import 'package:lauto_location/screens/AuthPhone/signup_phone_auth_page.dart';
import '../../extras/app_text_style.dart';
import '../../extras/colors.dart';
import '../../widgets/logo_image_widget.dart';


class RegisterAs extends StatefulWidget {
  const RegisterAs({Key? key}) : super(key: key);

  @override
  State<RegisterAs> createState() => _RegisterAsState();
}

class _RegisterAsState extends State<RegisterAs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LogoImageWidget(),
                    SizedBox(
                      height: 91,
                    ),
                    SizedBox(
                      height: 23.19,
                    ),
                    getContainer(
                        'Continue As Agency', 'bag.png', 'arrow.png', true,
                            () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPhone(isUser: false,)));
                        }),

                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: getContainer('Continue As User', 'bag.png',
                          'arrow.png', false, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpPhone(isUser: true,)));
                          }),
                    ),


                    SizedBox(
                      height: 25,
                    ),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 76.5, vertical: 36.5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing means you agree to our",
                    style: TextStyle(
                      fontSize: 13,
                      color: CColors.primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms And Conditions',
                        style: AppTextStyle.spliceSans(
                          style: TextStyle(
                            fontSize: 13,
                            color: CColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getContainer(
      String text, String img, String arrow, bool check, Function onTap) {
    return Padding(
      padding:  EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: .5, color: CColors.lightestgray),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (check == true)
                  ? Container(
                decoration: BoxDecoration(
                    color: CColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(5),
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 22, vertical: 22),
                  child: Image(
                    image: AssetImage("assets/images/$img"),
                    width: 24,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ),
              )
                  : Center(
                child: Image(
                  image: AssetImage("assets/images/$arrow"),
                  width: 60,
                  color: CColors.secColor,
                  // height: 20.h,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                text,
                style: AppTextStyle.spliceSans(
                  style: TextStyle(
                    color: CColors.textblack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              (check == true)
                  ? Center(
                child: Image(
                  image: AssetImage("assets/images/$arrow"),
                  width: 60,
                  // height: 20.h,
                  color: CColors.secColor,
                  fit: BoxFit.fill,
                ),
              )
                  : Container(
                decoration: BoxDecoration(
                    color: CColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(40),
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(0),
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 22, vertical: 22),
                  child: Image(
                    image: AssetImage("assets/images/$img"),
                    width: 24,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  logoImageWidget({required double topPadding}) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          image: AssetImage("assets/images/Lauto.png"),
          width: 200,
          height: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
