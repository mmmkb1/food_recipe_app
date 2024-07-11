import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipe_app/presentation/sing_in/input_field.dart';
import 'package:food_recipe_app/presentation/sing_in/social_button.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello,', style: TextStyles.headerTextBold.copyWith()),
                    Text('Welcome Back!', style: TextStyles.largeTextRegular),
                  ],
                ),
              ),
              const SizedBox(
                height: 57,
              ),
              const InputField(
                label: 'Email',
              ),
              const SizedBox(
                height: 30,
              ),
              const InputField(
                label: 'Password',
              ),
              const SizedBox(height: 20),
              Text('Forgot Password?',
                  style: TextStyles.smallTextRegular
                      .copyWith(color: ColorStyles.secondary100)),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: ColorStyles.primary100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sign In',
                          style: TextStyles.normalTextBold.copyWith(
                            color: ColorStyles.white,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: ColorStyles.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: ColorStyles.gray4,
                      thickness: 1,
                      indent: 60,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'Or Sign in With',
                    style: TextStyle(
                      color: ColorStyles.gray4,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: ColorStyles.gray4,
                      thickness: 1,
                      indent: 10,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(assetName: SocialButtonType.google),
                  SizedBox(width: 25),
                  SocialButton(assetName: SocialButtonType.facebook),
                ],
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account?',
                      style: TextStyles.smallerTextRegular
                          .copyWith(color: ColorStyles.black)),
                  Text(' Sign Up',
                      style: TextStyles.smallerTextRegular
                          .copyWith(color: ColorStyles.secondary100)),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
