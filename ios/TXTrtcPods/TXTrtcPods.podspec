#
# Be sure to run `pod lib lint TXTrtcPods.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TXTrtcPods'
  s.version          = '1.0.3'
  s.summary          = 'A short description of TXTrtcPods.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/gavinwjwang/TXTrtcPods'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gavinwjwang' => 'gavinwjwang@tencent.com' }
  s.source           = { :git => 'https://github.com/gavinwjwang/TXTrtcPods.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.ios.framework    = ['SystemConfiguration','CoreTelephony', 'VideoToolbox', 'CoreGraphics', 'AVFoundation', 'Accelerate','AssetsLibrary']
  s.ios.library = 'z', 'resolv', 'iconv', 'stdc++', 'c++', 'sqlite3'
  # 企业版sdk
  s.source_files = 'TXLiteAVSDK_Enterprise.framework/Headers/*.h'
  s.public_header_files = 'TXLiteAVSDK_Enterprise.framework/Headers/*.h'
  s.vendored_frameworks = 'TXLiteAVSDK_Enterprise.framework'
  # s.resource_bundles = {
  #   'TXTrtcPods' => ['TXTrtcPods/Resource/*.bundle','TXTrtcPods/Resource/*.metallib','e1','o1','u1','v1']
  # }
  # 精简版 sdk
  # s.source_files = 'TXLiteAVSDK_TRTC.framework/Headers/*.h'
  # s.public_header_files = 'TXLiteAVSDK_TRTC.framework/Headers/*.h'
  # s.vendored_frameworks = 'TXLiteAVSDK_TRTC.framework'
  # 
  # s.resource_bundles = {
  #   'TXTrtcPods' => ['TXTrtcPods/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
