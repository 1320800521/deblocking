#
#  Be sure to run `pod spec lint deblocking.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "deblocking"
  s.version      = "1.0.0"
  s.summary      = "一行代码搞定xib和storyboard自动布局，最简单的UIStackView自定义，支持Cell和Tableview高度自适应，Label和ScrollView内容自适应，致力于做最简单易用的AutoLayout库。"


  s.homepage     = "https://github.com/1320800521/deblocking.git"
  s.license      = "MIT"

  s.author             = { "hah" => "pengfei20140701@126.com" }

  s.source       = { :git => "https://github.com/1320800521/deblocking.git", :tag => "1.0.0" }

  s.source_files  = "deblocking/**/*,{h,m}"

  s.requires_arc = true

end
