#
# Be sure to run `pod lib lint BSPhotoGallery.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BSPhotoGallery'
  s.version          = '0.2'
  s.summary          = 'Quick and smart preview of your photos in latest Swift version.'

  s.description      = 'Preview, pinch and zoom your gallery just right on your screen.'

  s.homepage         = 'https://github.com/kunass2/BSPhotoGallery'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bartłomiej Semańczyk' => 'bartekss2@icloud.com' }
  s.source           = { :git => 'https://github.com/kunass2/BSPhotoGallery.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'BSPhotoGallery/Classes/**/*'
  s.dependency 'SDWebImage'

end
