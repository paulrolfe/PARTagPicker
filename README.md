# PARTagPicker

This pod provides a view controller for choosing and creating tags in the style of wordpress or tumblr. This tag picker was originally used in the [Intrepid Pursuits](http://intrepid.io) app, Slate.

## DEMO

As used in Slate:

![DEMO IN SLATE](https://s3.amazonaws.com/Paul.Image.Bucket/PRTagPicker/tag_record1.gif)
![DEMO IN SLATE](https://s3.amazonaws.com/Paul.Image.Bucket/PRTagPicker/tag_record4.gif)

From example project:

![DEMO IN EXAMPLE](https://s3.amazonaws.com/Paul.Image.Bucket/PRTagPicker/tag_record2.gif)
![DEMO IN EXAMPLE](https://s3.amazonaws.com/Paul.Image.Bucket/PRTagPicker/tag_record3.gif)

## Installation

PARTagPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PARTagPicker'
```

## Usage

To run the example project, clone the repo, and run `pod install` from the PRTagPicker directory first.

Include `#import <PARTagPicker/PARTagPickerViewController.h>`.

The basic setup is to create an instance of `PARTagPickerViewController`, add it's view, and then add the controller as a child view controller.

The tags are passed in as `NSString` objects in an array. Anytime you change the `allTags` array, any existing `chosenTags` are updated to use references to the new strings if they contain a match in the updated array. Otherwise they continue to point to the old strings.

### Swift
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Add the controller and view.
    let tagController = PARTagPickerViewController()
    addChildViewController(tagController)
    tagController.view.frame = CGRect(x: 0, y: 64, width: view.bounds.width, height: COLLECTION_VIEW_HEIGHT)
    view.addSubview(tagController.view)
    tagController.didMove(toParentViewController: self)

    // Customize appearance and data.
    tagController.delegate = self
    tagController.allTags = ["one fish","two fish"," red fish", "blue fish"]
    tagController.chosenTags = ["with a fox", "in a box", "anywhere"]
    tagController.allowsNewTags = true
    tagController.view.backgroundColor = .orange
    let colors = PARTagColorReference()
    colors.highlightedTagTextColor = .white
    colors.highlightedTagBackgroundColor = .blue
    tagController.tagColorRef = colors
}

func tagPicker(_ tagPicker: PARTagPickerViewController!, visibilityChangedTo state: PARTagPickerVisibilityState) {
    var newHeight: CGFloat = 0
    if state == .topAndBottom {
        newHeight = 2 * COLLECTION_VIEW_HEIGHT
    } else if state == .topOnly {
        newHeight = COLLECTION_VIEW_HEIGHT
    }

    var frame = tagPicker.view.frame
    frame.size.height = newHeight

    UIView.animate(withDuration: 0.3) {
        tagPicker.view.frame = frame
    }
}
```

### Obj-C
See example with `pod try PARTagPicker` or check the example view controller here: https://github.com/paulrolfe/PARTagPicker/blob/master/PARTagPicker/ViewController.m

## Options
* You can customize colors using a PARTagColorReference object.
* You can allow new tags with `allowsNewTags` boolean property on the controller.
* You can set the `chosenTags` directly.
* Delegate methods for when the chosenTags change and the tag picker changes size.
* `- (void)tagPicker:(PARTagPickerViewController *)tagPicker visibilityChangedToState:(PARTagPickerVisibilityState)state `
* `- (void)chosenTagsWereUpdatedInTagPicker:(PARTagPickerViewController *)tagPicker`
* `tapToEraseTags` Defaults to YES. If set to NO, tapping a cell will just select it (not delete it).
* `placeholderText` - The default text to have as placeholder text in each tag cell. Default value is @"Add a tag".

## Notes

This is still a work in progress. If you have suggestions or run into issues, please create an issue on git or tweet me [@ThePaulRolfe](http://twitter.com/thepaulrolfe).

## Updates
* v1.4.0 - Swift example, expose cleaner PARTagColorReference init.
* v1.1.0 - Added properties for `placeholderText` and `tapToEraseTags`.
* v1.0.4 - Enabled for use in swift pods.
* v1.0.2 - Including `.xib`s in the pod now. Oops!
* v1.0.0 - Added documentation and fixed bug with deselecting chosenTags. Added ability to use custom fonts in the tag cells.
* v0.0.5 - Added expected functionality of chosenTags being removed when pressed.


## Author

Paul Rolfe, paul.a.rolfe@gmail.com, [@ThePaulRolfe](http://twitter.com/thepaulrolfe)

## License

PARTagPicker is available under the MIT license. See the LICENSE file for more info.
