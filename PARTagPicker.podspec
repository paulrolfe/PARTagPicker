#
#  Be sure to run `pod spec lint PARTagPicker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "PARTagPicker"
  s.version      = "1.0.2"
  s.summary      = "This pod provides a view controller for choosing and creating tags in the style of wordpress or tumblr."

  s.description  = <<-DESC
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

  ## Options
  * You can customize colors using a PARTagColorReference object.
  * You can allow new tags with `allowsNewTags` boolean property on the controller.
  * You can set the `chosenTags` directly.
  * Delegate methods for when the chosenTags change and the tag picker changes size.
  * `- (void)tagPicker:(PARTagPickerViewController *)tagPicker visibilityChangedToState:(PARTagPickerVisibilityState)state `
  * `- (void)chosenTagsWereUpdatedInTagPicker:(PARTagPickerViewController *)tagPicker`

  ## Notes

  This is still a work in progress. If you have suggestions or run into issues, please create an issue on git or tweet me [@ThePaulRolfe](http://twitter.com/thepaulrolfe).

  ## Updates
  * v1.0.2 - Including `.xib`s in the pod now. Oops!
  * v1.0.0 - Added documentation and fixed bug with deselecting chosenTags. Added ability to use custom fonts in the tag cells.
  * v0.0.5 - Added expected functionality of chosenTags being removed when pressed.


  ## Author

  Paul Rolfe, paul.a.rolfe@gmail.com, [@ThePaulRolfe](http://twitter.com/thepaulrolfe)

  ## License

  PARTagPicker is available under the MIT license. See the LICENSE file for more info.

                   DESC

  s.homepage     = "https://github.com/paulrolfe/PARTagPicker"
  s.screenshots  = "https://s3.amazonaws.com/Paul.Image.Bucket/PRTagPicker/tag_record1.gif", "https://s3.amazonaws.com/Paul.Image.Bucket/PRTagPicker/tag_record2.gif", "https://s3.amazonaws.com/Paul.Image.Bucket/PRTagPicker/tag_record3.gif", "https://s3.amazonaws.com/Paul.Image.Bucket/PRTagPicker/tag_record4.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Paul Rolfe" => "paul.a.rolfe@gmail.com" }
  s.social_media_url   = "http://twitter.com/thepaulrolfe"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform     = :ios, "6.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/paulrolfe/PARTagPicker.git", :tag => "1.0.2" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "PARTagPicker/Classes/*.{h,m}"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  s.resources = "PARTagPicker/Resources/*.xib"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  s.framework  = "UIKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
