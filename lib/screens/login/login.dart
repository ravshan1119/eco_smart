import 'package:easy_localization/easy_localization.dart';
import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/core/localization/locale_keys.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:eco_smart/data/injection.dart';
import 'package:eco_smart/data/local_storage.dart';
import 'package:eco_smart/domain/api_client_imp.dart';
import 'package:eco_smart/screens/common/flash.dart';
import 'package:eco_smart/screens/common/loader.dart';
import 'package:eco_smart/screens/common/my_elevated_button.dart';
import 'package:eco_smart/screens/common/text_form_field.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _apiClient = getIt<ApiClientImp>();
  bool isLoading = false;
  bool isLoadingRegister = false;
  var maskFormatterPhone = new MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final controllerPhone = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextWidget(
              text: LocaleKeys.register.tr(),
              textColor: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          20.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MyTextFormField(
              controller: controllerPhone,
              inputFormatter: [maskFormatterPhone],
              radius: 6,
              hintText: "+998 (##) ###-##-##",
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
          10.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MyTextFormField(
                controller: controllerPassword,
                hintText: LocaleKeys.password.tr(),
                textInputAction: TextInputAction.next,
                radius: 6),
          ),
          10.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MyTextFormField(
                controller: controllerConfirm,
                hintText: LocaleKeys.confirmPassword.tr(),
                textInputAction: TextInputAction.done,
                radius: 6),
          ),
          50.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MyElevatedButton(
                radius: 6,
                expanded: true,
                onTap: () async {
                  setState(() {
                    isLoadingRegister = true;
                  });
                  if (controllerPassword.text == controllerConfirm.text) {
                    print("phone: ${controllerPhone.text}");
                    await _apiClient
                        .register(
                            emailAddress:
                                "${controllerPhone.text.replaceAll(" ", "").replaceAll("+", "").replaceAll(")", "").replaceAll("(", "").replaceAll("-", "")}@gmail.com",
                            password: controllerPassword.text)
                        .then(
                      (value) {
                        if (value == true) {
                          flash("Tizimga muvafaqqiyatli kirildi", Colors.green);
                          getIt<LocalStorage>().setToken('token');
                          getIt<LocalStorage>().setPhone('Foydalanuvchi');

                          navigator.pushNamedAndRemoveUntil(
                            RouteList.homeScreen,
                            (route) => false,
                          );
                        } else {
                          flash(
                              "Kutilmagan xatolik yuz berdi, qaytadan urunib ko'ring",
                              Colors.red);
                        }
                        setState(() {
                          isLoadingRegister = false;
                        });
                      },
                    );
                  } else {
                    flash("Passwordni to'g'ri kiriting", Colors.amber);
                    setState(() {
                      isLoadingRegister = false;
                    });
                  }
                },
                primaryColor: Colors.black,
                child: isLoadingRegister || isLoading
                    ? Center(
                        child: Loader(
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: LocaleKeys.register.tr(),
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ],
                      )),
          ),
          100.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MyElevatedButton(
                width: MediaQuery.of(context).size.width - 32,
                height: 36,
                radius: 6,
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await _apiClient.signInWithGoogle().then(
                    (value) {
                      if (value.user != null) {
                        flash("Tizimga muvafaqqiyatli kirildi", Colors.green);
                        getIt<LocalStorage>()
                            .setToken(value.credential?.accessToken ?? '');
                        getIt<LocalStorage>()
                            .setPhone(value.user?.displayName ?? '');

                        navigator.pushNamedAndRemoveUntil(
                          RouteList.homeScreen,
                          (route) => false,
                        );
                      } else {
                        flash(
                            "Kutilmagan xatolik yuz berdi, qaytadan urunib ko'ring",
                            Colors.red);
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  );
                },
                primaryColor: Colors.white,
                child: isLoading
                    ? Center(
                        child: Loader(
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Google",
                            textColor: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          Image.asset(
                            AppImages.google,
                            height: 18,
                            width: 18,
                          ),
                        ],
                      )),
          ),
          70.h,
        ],
      ),
    );
  }
}
