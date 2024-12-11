import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_atw/core/constant/colors.dart';
import 'package:task_atw/core/constant/custom_button.dart';
import 'package:task_atw/core/constant/custom_field.dart';
import 'package:task_atw/core/utils/app_texts.dart';
import 'package:task_atw/data/repositories/auth.dart';
import 'package:task_atw/presentation/viewmodels/login_viewmodel.dart';
import 'package:task_atw/presentation/views/widgets/custom_linear_gradient.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginCubit>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GradientBackground(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: loginViewModel.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTexts(
                          textColor: AppColor.kText1,
                          data: "Let’s Sign you in.",
                          textAlign: TextAlign.center,
                        ).bodyBXL(),
                        const AppTexts(
                          textColor: AppColor.kText1,
                          data: "Welcome back.",
                          textAlign: TextAlign.start,
                        ).bodyML(),
                        const SizedBox(height: 8),
                        const AppTexts(
                          textColor: AppColor.kText1,
                          data: "You’ve been missed!",
                          textAlign: TextAlign.start,
                        ).bodyML(),                        const SizedBox(height: 24),
                        const AppTexts(
                          textColor: AppColor.kText1,
                          data: "Email",
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.ltr
                          // textAlign: TextAlign.left,
                        ).bodySBM(),
                        CustomTextFormField(
                          hintText: 'Your email',
                          controller: loginViewModel.emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          validate: (email) {
                            if (email!.isEmpty) {
                              return 'Email must not be empty';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        const AppTexts(
                            textColor: AppColor.kText1,
                            data: "Password",
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr
                          // textAlign: TextAlign.left,
                        ).bodySBM(),
                        CustomTextFormField(
                          hintText: 'Password',
                          controller: loginViewModel.passwordController,
                          obscureText: !loginViewModel.isPasswordVisible,
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            icon: Icon(
                              loginViewModel.isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              loginViewModel.togglePasswordVisibility();
                            },
                          ),
                          validate: (password) {
                            if (password!.isEmpty) {
                              return 'Password must not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 200),
                        if (loginViewModel.isLoading)
                          const CircularProgressIndicator()
                        else
                          CustomButton(
                            text: 'Sign in',
                            isLoading: loginViewModel.isLoading,
                            onPressed: () async {
                              if (loginViewModel.formKey.currentState!.validate()) {
                                try {
                                  final user = await AuthRepository().signIn(
                                    loginViewModel.emailController.text,
                                    loginViewModel.passwordController.text,
                                  );

                                  if (user != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Register Successfully'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Error occurred while signing in'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppTexts(
                              data: 'Don’t have an account? ',
                              textColor: AppColor.kText2,
                            ).bodySBM(),
                            GestureDetector(
                              onTap: () {

                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: AppColor.indigoColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
