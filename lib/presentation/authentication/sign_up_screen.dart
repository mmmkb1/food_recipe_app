import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/components/big_button.dart';
import 'package:food_recipe_app/presentation/components/input_field.dart';
import 'package:food_recipe_app/presentation/components/social_button.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked =
      false; // Define a boolean variable to track the checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 190,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create an account',
                          style: TextStyles.largeTextBold.copyWith()),
                      Text(
                          'Let’s help you set up your account, it won’t take long.',
                          style: TextStyles.smallerTextRegular),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  label: 'Name',
                  hint: 'Enter Name',
                  onChanged: (value) {
                    print('Email field changed');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputField(
                  label: 'Email',
                  hint: 'Enter Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputField(
                  label: 'Password',
                  hint: 'Enter Password',
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const InputField(
                  label: 'Confirm Password',
                  hint: 'Retype Password',
                  isPassword: true,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        activeColor: ColorStyles.secondary100,
                        side: const BorderSide(color: ColorStyles.secondary100),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Transform.translate(
                        offset: const Offset(-8, 0),
                        child: Text(
                          'Accept terms & Condition',
                          style: TextStyles.smallTextRegular
                              .copyWith(color: ColorStyles.secondary100),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
                  child: BigButton(
                      label: 'Sign In',
                      hasArrow: true,
                      onPressed: () {
                        context.go('/search');
                      }),
                ),
                const SizedBox(height: 14),
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
                    Text('Already a member?',
                        style: TextStyles.smallerTextRegular
                            .copyWith(color: ColorStyles.black)),
                    GestureDetector(
                      onTap: () => context.go('/sign_in'),
                      child: Text(' Sign In',
                          style: TextStyles.smallerTextRegular
                              .copyWith(color: ColorStyles.secondary100)),
                    ),
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
