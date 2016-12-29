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
  s.summary      = "2 lines of code to integrate fingerprint unlock password to unlock and gestures, safe and reliable"


  s.homepage     = "https://github.com/1320800521/deblocking.git"
  s.license      = "MIT"

  s.author             = { "hah" => "pengfei20140701@126.com" }

  s.source       = { :git => "https://github.com/1320800521/deblocking.git", :tag => "1.0.0" }

s.source_files  = "deblocking/*.{h,m}"

  s.requires_arc = true

end
