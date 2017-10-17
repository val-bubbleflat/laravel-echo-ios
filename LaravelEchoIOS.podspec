#
#  Be sure to run `pod spec lint LaravelEchoIOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LaravelEchoIOS"
  s.version      = "0.0.3"

  s.summary      = "A wrapper for Laravel Echo in Swift"
  s.description  = "A wrapper for Laravel Echo with Socket.io in Swift by bubbleflat.com"

  s.homepage     = "https://github.com/val-bubbleflat/laravel-echo-ios"

  s.license      = { :type => "MIT", :file => "LICENSE"}

  s.author       = { "Valentin Vivies" => "valentin@bubbleflat.com", "bubbleflat" => "contact@bubbleflat.com" }

  s.source       = { :git => "https://github.com/val-bubbleflat/laravel-echo-ios.git", :tag => "#{s.version}" }

  s.platforms = {:ios => "9.0"}
  s.source_files  = "LaravelEchoIOS/*.swift", "LaravelEchoIOS/**/*.swift"
  s.exclude_files = ""

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

  s.subspec 'Socket.IO-Client-Swift' do |socket|
      socket.dependency   'Socket.IO-Client-Swift'
  end

  #s.framework     = "LaravelEchoIOS"

end
