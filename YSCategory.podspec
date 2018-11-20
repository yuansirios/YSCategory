#
# Be sure to run `pod lib lint YSCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YSCategory'
  s.summary          = 'A set of categorys to make iOS development easier.'
  s.version          = '0.0.3'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yuanxd' => 'yuansir_ios@163.com' }
  s.homepage         = 'https://github.com/yuansirios/YSCategory.git'
  s.platform         = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source           = { :git => 'https://github.com/yuansirios/YSCategory.git', :tag => s.version.to_s }

  s.requires_arc = true
  s.source_files = 'YSCategory/**/*.{h,m}'
  s.public_header_files = 'YSCategory/**/*.{h}'

  #正则
  s.subspec "Regex" do |ss|
    ss.source_files = 'YSCategory/Classes/Regex/**/*.{h,m}'
  end

  #frame
  s.subspec "CGRect" do |ss|
    ss.source_files = 'YSCategory/Classes/CGRect/**/*.{h,m}'
  end

  #字符串操作
  s.subspec "NSString" do |ss|
    ss.source_files = 'YSCategory/Classes/NSString/**/*.{h,m}'
  end

  #按钮
  s.subspec "UIButton" do |ss|
    ss.source_files = 'YSCategory/Classes/UIButton/**/*.{h,m}'
  end

  #图片
  s.subspec "UIImage" do |ss|
    ss.source_files = 'YSCategory/Classes/UIImage/**/*.{h,m}'
  end

  #HUD
  s.subspec "HUD" do |ss|
    ss.source_files = 'YSCategory/Classes/HUD/**/*.{h,m}'
    ss.dependency 'MBProgressHUD', '>=1.1.0'
  end

end
