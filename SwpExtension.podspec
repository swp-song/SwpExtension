#
# Be sure to run `pod lib lint SwpExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwpExtension'
  s.version          = '0.1.0'
  s.summary          = ' Swift Extension '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/swp-song/SwpExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'swp-song' => '396587868@qq.com' }
  s.source           = { :git => 'https://github.com/swp-song/SwpExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  
  s.requires_arc          = true

  # s.source_files = 'SwpExtension/Code/**/*.swift'
  
  # s.resource_bundles = {
  #   'SwpExtension' => ['SwpExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.frameworks = 'UIKit', 'Foundation'


  s.default_subspec = 
                        # 'SwpExtension',
                        
                        'IntExtension',
                        'FloatExtension',
                        'DoubleExtension',
                        'CGFloatExtension',
                        'BundleExtension',
                        'MD5Extension',
                        'Base64Extension',
                        'StringExtension',
                        'UserDefaultsExtension',
                        
                        'UIViewExtension',
                        'UIFontExtension',
                        'UIColorExtension',
                        'UIImageExtension',
                        'UIScreenExtension',
                        'UIButtonExtension',
                        'UITextFieldExtension',
                        'UINavigationExtension'


  # - SwpExtensionBase 
  s.subspec 'SwpExtensionBase' do |swpExtensionBase|
    swpExtensionBase.source_files = 'SwpExtension/Code/SwpExtensionBase/*.swift'
  end

  # - Foundation

  # - Int Extension  
  s.subspec 'IntExtension' do |intExtension|
    intExtension.dependency 'SwpExtension/SwpExtensionBase'
    intExtension.source_files = 'SwpExtension/Code/Foundation/IntExtension/*.swift'
  end

  # - Float Extension  
  s.subspec 'FloatExtension' do |floatExtension|
    floatExtension.dependency 'SwpExtension/SwpExtensionBase'
    floatExtension.source_files = 'SwpExtension/Code/Foundation/FloatExtension/*.swift'
  end

  # - Double Extension  
  s.subspec 'DoubleExtension' do |doubleExtension|
    doubleExtension.dependency 'SwpExtension/SwpExtensionBase'
    doubleExtension.source_files = 'SwpExtension/Code/Foundation/DoubleExtension/*.swift'
  end

  # - CGFloat Extension  
  s.subspec 'CGFloatExtension' do |cgFloatExtension|
    cgFloatExtension.dependency 'SwpExtension/SwpExtensionBase'
    cgFloatExtension.source_files = 'SwpExtension/Code/Foundation/CGFloatExtension/*.swift'
  end

  # Bundle Extension
  s.subspec 'BundleExtension' do |bundleExtension|
    bundleExtension.dependency 'SwpExtension/SwpExtensionBase'
    bundleExtension.source_files = 'SwpExtension/Code/Foundation/BundleExtension/*.swift'
  end

  # String Extension，MD5
  s.subspec 'MD5Extension' do |md5Extension|
    md5Extension.dependency 'SwpExtension/SwpExtensionBase'
    md5Extension.source_files = 'SwpExtension/Code/Foundation/StringExtension/MD5/*.swift'
  end

  # String Extension, Base64
  s.subspec 'Base64Extension' do |base64Extension|
    base64Extension.dependency 'SwpExtension/SwpExtensionBase'
    base64Extension.source_files = 'SwpExtension/Code/Foundation/StringExtension/Base64/*.swift'
  end

  # String Extension，StringSpace
  s.subspec 'StringExtension' do |stringExtension|
    stringExtension.dependency 'SwpExtension/SwpExtensionBase'
    stringExtension.source_files = 'SwpExtension/Code/Foundation/StringExtension/String/*.swift'
  end

   # UserDefaults Extension
  s.subspec 'UserDefaultsExtension' do |userDefaultsExtension|
    userDefaultsExtension.dependency 'SwpExtension/SwpExtensionBase'
    userDefaultsExtension.source_files = 'SwpExtension/Code/Foundation/UserDefaultsExtension/*.swift'
  end


  # - UIKit

  # UIView Extension
  s.subspec 'UIViewExtension' do |viewExtension|
    viewExtension.dependency 'SwpExtension/SwpExtensionBase'
    viewExtension.source_files = 'SwpExtension/Code/UIKit/UIViewExtension/*.swift'
  end
  
  
   # UIFont Extension
  s.subspec 'UIFontExtension' do |fontExtension|
    fontExtension.dependency 'SwpExtension/SwpExtensionBase'
    fontExtension.source_files = 'SwpExtension/Code/UIKit/UIFontExtension/*.swift'
  end

  # UIColor Extension
  s.subspec 'UIColorExtension' do |colorExtension|
    colorExtension.dependency 'SwpExtension/SwpExtensionBase'
    colorExtension.source_files = 'SwpExtension/Code/UIKit/UIColorExtension/*.swift'
  end

   # UIImage Extension
  s.subspec 'UIImageExtension' do |imageExtension|
    imageExtension.dependency 'SwpExtension/SwpExtensionBase'
    imageExtension.source_files = 'SwpExtension/Code/UIKit/UIImageExtension/*.swift'
  end

   # UIScreen Extension 
  s.subspec 'UIScreenExtension' do |screenExtension|
    screenExtension.dependency 'SwpExtension/SwpExtensionBase'
    screenExtension.source_files = 'SwpExtension/Code/UIKit/UIScreenExtension/*.swift'
  end

  # UIButton Extension
  s.subspec 'UIButtonExtension' do |buttonExtension|
    buttonExtension.dependency 'SwpExtension/SwpExtensionBase'
    buttonExtension.source_files = 'SwpExtension/Code/UIKit/UIButtonExtension/*.swift'
  end
  
  # UITextField Extension
  s.subspec 'UITextFieldExtension' do |textFieldExtension|
    textFieldExtension.dependency 'SwpExtension/SwpExtensionBase'
    textFieldExtension.source_files = 'SwpExtension/Code/UIKit/UITextFieldExtension/*.swift'
  end

  
  # UINavigationBar Extension
  s.subspec 'UINavigationExtension' do |navigationExtension|
    navigationExtension.dependency 'SwpExtension/SwpExtensionBase'
    navigationExtension.source_files = 'SwpExtension/Code/UIKit/UINavigationExtension/*.swift'
  end


end
