import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/big_button.dart';
import 'package:food_recipe_app/presentation/component/input_field.dart';
import 'package:food_recipe_app/presentation/component/social_button.dart';
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
          child: SingleChildScrollView(
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
                      Text('Hello,',
                          style: TextStyles.headerTextBold.copyWith()),
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
                const SizedBox(
                  width: double.infinity,
                  child: BigButton(
                    label: 'Sign In',
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
                    Text('Sign Up',
                        style: TextStyles.smallerTextRegular
                            .copyWith(color: ColorStyles.secondary100)),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
