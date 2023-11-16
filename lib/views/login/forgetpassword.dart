import 'package:flutter/material.dart';
import 'package:mentalassessment/services/auth_service.dart';
import '../../constants/assets.dart';
import '../../constants/formvalidate.dart';
import '../../constants/theme.dart';
import '../components/component.dart';
import '../widgets/widgetLayout/layout.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late String resetpasswordEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Layout body(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Layout(
        backgroundAsset: Assets.imageBackground,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
          child: Stack(
            children: [
              Component.backButton(context),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        Assets.iconLogo,
                        semanticLabel: 'Mental Assessment',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'เจอกันอีกแล้ว วันนี้ก็มาพยายามทำวันนี้ให้เป็นวันที่ดีอีกวันกันเถอะ',
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 16, color: ColorTheme.main5),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      validator: (value) {
                        if (Formvalidate.notemptyForm(value ?? '') != '') {
                          return Formvalidate.notemptyForm(value ?? '');
                        } else if (Formvalidate.emailvalidateForm(
                                value ?? '') !=
                            '') {
                          return Formvalidate.emailvalidateForm(value ?? '');
                        }

                        return null;
                      },
                      onChanged: (value) => resetpasswordEmail = value,
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      cursorColor: ColorTheme.main5,
                      decoration:
                          const InputDecoration(hintText: 'Enter your email..'),
                    ),
                    const SizedBox(height: 16),

                    // ResetPassword Button
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          AuthService.sendResetpassword(
                              resetpasswordEmail, context);
                        }
                      },
                      child: Text(
                        'Continue',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: ColorTheme.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
