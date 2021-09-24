import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'create_organization_viewmodel.dart';

class ProjectPage extends ViewModelWidget<CreateOrganizationViewModel> {
  const ProjectPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateOrganizationViewModel model) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight - kToolbarHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "What's a project your team is working on?",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: AppColors.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextForm(
                      hintText: 'Eg.  Q4 Budget, Website Update',
                      wordCount: 80,
                    ),
                    UIHelper.verticalSpaceMedium,
                    LongButton(onPressed: () => model.next(), label: 'Next'),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TextForm extends HookViewModelWidget<CreateOrganizationViewModel> {
  final int? wordCount;
  final String hintText;
  TextForm({Key? key, this.wordCount, required this.hintText})
      : super(key: key, reactive: false);
  @override
  Widget buildViewModelWidget(
      BuildContext context, CreateOrganizationViewModel model) {
    return Center(
      child: TextField(
        controller: model.projectController,
        maxLength: this.wordCount,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black45,
            fontWeight: FontWeight.w300,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.greyColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.greyColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey[300] ?? AppColors.greyColor,
              width: 1,
            ),
          ),
          errorBorder: InputBorder.none,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
