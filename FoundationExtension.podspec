#
# Be sure to run `pod lib lint FoundationExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FoundationExtension'
  s.version          = '0.6.5'
  s.summary          = 'an extension for NSFoundation and UIKit'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
an extension for NSFoundation and UIKit and some utils.
                       DESC

  s.homepage         = 'https://github.com/Gaea-iOS/FoundationExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangxiaotao' => '445242970@qq.com' }
  s.source           = { :git => 'https://github.com/Gaea-iOS/FoundationExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  #s.source_files = 'FoundationExtension/Classes/**/*'

    s.subspec 'Component' do |cp|
        cp.source_files = 'FoundationExtension/Classes/Component/**/*'
    end

    s.subspec 'Foundation' do |fd|
        fd.source_files = 'FoundationExtension/Classes/Foundation/**/*'
    end

    s.subspec 'UIKit' do |uk|
        uk.source_files = 'FoundationExtension/Classes/UIKit/**/*'
        uk.dependency 'KeychainAccess', '~> 3.1.2'
    end

  # s.resource_bundles = {
  #   'FoundationExtension' => ['FoundationExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  #  s.frameworks = 'CoreTelephony'
  #  s.dependency 'ReachabilitySwift', '~> 3'
end
