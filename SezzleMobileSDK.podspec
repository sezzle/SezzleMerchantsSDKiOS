#
# Be sure to run `pod lib lint SezzleMobileSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SezzleMobileSDK'
  s.version          = '1.1.0'
  s.summary          = 'A mobile SDK for Sezzle merchants'
  s.swift_version    = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  The Sezzle Mobile SDK is designed to give our merchants the ability to create Sezzle checkouts from their own apps. The SDK will open a webview given the SezzleSession that is passed
                       DESC

  s.homepage         = 'https://github.com/sezzle/SezzleMerchantsSDKiOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Charlie Sarano' => 'charlie.enriquez-sarano@sezzle.com' }
  s.source           = { :git => 'https://github.com/sezzle/SezzleMerchantsSDKiOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SezzleMobileSDK/**/*.{swift,h,m}'

  s.resources = [
    'SezzleMobileSDK/Assets/Logo/*.png',
    'SezzleMobileSDK/Assets/Fonts/*.ttf'
  ]
  
  s.dependency 'SwiftyJSON', '~> 5.0'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
