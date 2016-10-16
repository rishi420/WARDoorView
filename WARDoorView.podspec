#
#  Be sure to run `pod spec lint WARDoorView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "WARDoorView"
  s.version      = "2.0.0"
  s.summary      = "Door open/close animation in iOS"

  s.description  = <<-DESC 
			This project shows Door open/close animation.
                   DESC

  s.homepage     = "https://github.com/rishi420/WARDoorView"
  s.screenshots  = "https://cloud.githubusercontent.com/assets/2233857/11636265/7b77b970-9d45-11e5-8612-146e53070088.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Warif Akhand Rishi" => "rishi420@gmail.com" }

  s.platform     = :ios, '8.0'

  s.source       = { :git => "https://github.com/rishi420/WARDoorView.git", :tag => "#{s.version}" }

  s.source_files  = 'Pod/Classes/**/*'

  s.resources = 'Pod/Assets/*.png'

  s.requires_arc = true


end
