import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatefulWidget {
  HomeDrawer({required this.onGoToHomeClicked});

  VoidCallback onGoToHomeClicked;

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedTheme="Dark";

  String selectedLanguage="English";

  List<String>themeOption=["Dark","Light"];
  List<String>languageOption=["English","Arabic"];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            height: screenSize.height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            color: AppTheme.white,
            child: Text(
              'News App',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.black,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding:const EdgeInsets.all(16),
              color: AppTheme.black,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onGoToHomeClicked();
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/home.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        ),
                     const   SizedBox(width: 8),
                        Text(
                          'Go To Home',
                          style: textTheme.titleLarge,
                        ),
                      ],
                    ),

                  ),
               const  SizedBox(
                   height: 24,

                 ),
                 const Divider(color: AppTheme.white,thickness: 1,),
                 const SizedBox(
                    height: 24,

                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/theme.svg"),
                     const SizedBox(
                        width: 8,

                      ),
                      Text("Them",style: textTheme.titleLarge,)


                    ],

                  ),
                 const SizedBox(
                    height: 8,

                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.white,width: 1,),
                      borderRadius: BorderRadius.circular(16)

                    ),
                    padding:const EdgeInsetsDirectional.only(end: 16,start: 16),
                    child: DropdownButton<String>(
                      style: textTheme.titleLarge,
                        value:selectedTheme,
                        isExpanded: true,
                        focusColor: AppTheme.black,
                       underline: const SizedBox(),
                        dropdownColor: AppTheme.black,
                        borderRadius: BorderRadius.circular(16),
                        iconDisabledColor: AppTheme.white,
                        iconEnabledColor: AppTheme.white,
                        items:themeOption.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(value: value, child: Text(value));
                        }).toList(),
                    onChanged: (value) {
                          if(selectedTheme==value)return;
                          selectedTheme=value!;
                          setState(() {

                          });
                    },


                    ),
                  ),
                  const SizedBox(
                    height: 24,

                  ),
                  const Divider(color: AppTheme.white,thickness: 1,),
                  const SizedBox(
                    height: 24,

                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/language.svg"),
                      const SizedBox(
                        width: 8,

                      ),
                      Text("Language",style: textTheme.titleLarge,)


                    ],

                  ),
                  const SizedBox(
                    height: 8,

                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.white,width: 1,),
                        borderRadius: BorderRadius.circular(16)

                    ),
                    padding:const EdgeInsetsDirectional.only(end: 16,start: 16),
                    child: DropdownButton<String>(
                      style: textTheme.titleLarge,
                      value:selectedLanguage,
                      isExpanded: true,
                      focusColor: AppTheme.black,
                      underline: const SizedBox(),
                      dropdownColor: AppTheme.black,
                      borderRadius: BorderRadius.circular(16),
                      iconDisabledColor: AppTheme.white,
                      iconEnabledColor: AppTheme.white,
                      items:languageOption.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {
                        if(selectedLanguage==value)return;
                        selectedLanguage=value!;
                        setState(() {

                        });
                      },


                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}