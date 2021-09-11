import 'package:flutter/material.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:stacked/stacked.dart';
import 'advanced_viewmodel.dart';

class AdvancedView extends StatelessWidget {
  const AdvancedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdvancedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Advanced",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MenuItemTile.icon(
                text: Text("Emoji Deluxe"),
                subtitle: "Choose your default skin tone",
                imageIcon: "assets/icons/emojiHands/${model.currentEmoji}.png",
                onPressed: model.changeSkinTone,
              ),
              MenuItemTile.flipSwitch(
                text: Text("Show image previews"),
                subtitle: "Image previews not displayed",
                onChanged: model.toggleShowImagePreviews,
                value: model.showImagePreviews,
              ),
              MenuItemTile.flipSwitch(
                text: Text("Open web pages in app"),
                subtitle: "Link will open in Zuri Chat",
                value: model.openWebPagesInApp,
                onChanged: model.toggleOpenWebPagesInApp,
              ),
              MenuItemTile.flipSwitch(
                text: Text("Display typing indicators"),
                subtitle: "Typing indicators will be displayed",
                value: model.displayTypingIndicators,
                onChanged: model.toggleDisplayTypingIndicators,
              ),
              MenuItemTile.flipSwitch(
                text: Text("Allow animated image and emoji"),
                subtitle: "Images and emoji can be animated",
                value: model.allowAnimatedImageAndEmoji,
                onChanged: model.toggleAllowAnimatedImageAndEmoji,
              ),
              MenuItemTile.flipSwitch(
                  text: Text("Optimize image uploads"),
                  subtitle: "Images are optimized for upload performance",
                  value: model.optimizeImageUploads,
                  onChanged: model.toggleOptimizeImageUploads),
              MenuItemTile(
                text: Text(
                  "Reset Cache",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              MenuItemTile(
                text: Text(
                  "Force Stop",
                  style: TextStyle(color: Colors.red),
                ),
                subtitle: "Unsaved data may be lost",
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AdvancedViewModel(),
    );
  }
}
