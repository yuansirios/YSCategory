#
# Be sure to run `pod lib lint YSCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YSCategory'
  s.summary          = '常用分类整理'
  s.version          = '0.1.0'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yuanxd' => 'yuansir_ios@163.com' }
  s.homepage         = 'https://gitee.com/yuansirios/YSCategory'
  s.platform         = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source           = { :git => 'https://gitee.com/yuansirios/YSCategory.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files = 'YSCategory/**/*.{h,m}'
  s.public_header_files = 'YSCategory/**/*.{h}'

  s.frameworks = 'UIKit', 'CoreFoundation' ,'QuartzCore'

end
