#
# Be sure to run `pod lib lint SwpExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SwpExtension'
    s.version          = '0.0.2'
    s.summary          = ' Swift Extension Code '
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
    s.description      = <<-DESC
  TODO: Swift Extension Code
                         DESC
  
    s.homepage         = 'https://github.com/swp-song/SwpExtension'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'swp-song' => '396587868@qq.com' }
    s.source           = { :git => 'https://github.com/swp-song/SwpExtension.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
    s.ios.deployment_target = '9.0'
  
    s.requires_arc          = true
  
    # s.source_files          = 'SwpExtension/Code/**/*.swift'
    
    # s.resource_bundles = {
    #   'SwpExtension' => ['SwpExtension/Assets/*.png']
    # }
  
    # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit', 'Foundation'
  
    s.default_subspec = 
                        # 'SwpExtension',
                        'SwpColorExtension',
                        'SwpBundleExtension',
                        'SwpViewFrameExtension',
                        'SwpUserDefaultsExtension',
                        'SwpBase64Extension',
                        'SwpMD5Extension',
                        'SwpStringSpaceExtension',
                        'SwpNavigationBarExtension',
                        'SwpTextFieldExtension'
  
  
  
    # -  Foundation
  
    # Bundle Extension
    s.subspec 'SwpBundleExtension' do |swpBundleExtension|
      swpBundleExtension.source_files = 'SwpExtension/Code/Foundation/SwpBundleExtension/*.swift'
    end
  
    
    # UserDefaults Extension
    s.subspec 'SwpUserDefaultsExtension' do |swpUserDefaultsExtension|
      swpUserDefaultsExtension.source_files = 'SwpExtension/Code/Foundation/SwpUserDefaults/*.swift'
    end
  
  
    # String Extension, Base64
    s.subspec 'SwpBase64Extension' do |swpBase64Extension|
      swpBase64Extension.source_files = 'SwpExtension/Code/Foundation/SwpStringExtension/Base64/*.swift'
    end
  
    # String Extension，MD5
    s.subspec 'SwpMD5Extension' do |swpMD5Extension|
      swpMD5Extension.source_files = 'SwpExtension/Code/Foundation/SwpStringExtension/MD5/*.swift'
    end
  
    # String Extension，StringSpace
    s.subspec 'SwpStringSpaceExtension' do |swpStringSpaceExtension|
      swpStringSpaceExtension.source_files = 'SwpExtension/Code/Foundation/SwpStringExtension/StringSpace/*.swift'
    end
  
    # -  UIKit
    
    # UIView Extension
    s.subspec 'SwpViewFrameExtension' do |swpViewFrameExtension|
      swpViewFrameExtension.source_files = 'SwpExtension/Code/UIKit/SwpViewExtension/*.swift'
    end
  
    # UIButton Extension
    s.subspec 'SwpButtonExtension' do |swpButtonExtension|
      swpButtonExtension.source_files = 'SwpExtension/Code/UIKit/SwpButtonExtension/UIButton+Extension.swift'
    end
    
  
    # UIColor Extension
    s.subspec 'SwpColorExtension' do |swpColorExtension|
      swpColorExtension.source_files = 'SwpExtension/Code/UIKit/SwpColorExtension/*.swift'
    end
  
  
    # UIFont Extension
    s.subspec 'SwpFontExtension' do |swpFontExtension|
      swpFontExtension.source_files = 'SwpExtension/Code/UIKit/SwpFontExtension/*.swift'
    end
  
    # UINavigationBar Extension
    s.subspec 'SwpNavigationBarExtension' do |swpNavigationBarExtension|
      swpNavigationBarExtension.source_files = 'SwpExtension/Code/UIKit/SwpNavigationBarExtension/*.swift'
    end

    # UITextField Extension
    s.subspec 'SwpTextFieldExtension' do |swpTextFieldExtension|
      swpTextFieldExtension.source_files = 'SwpExtension/Code/UIKit/SwpTextFieldExtension/*.swift'
    end
  
    
  end
  