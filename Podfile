# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
workspace 'Furdresser.xcworkspace'
project 'Furdresser.xcodeproj'

def db_pods
  pod 'Firebase/Auth'
  pod 'Firebase/Core'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
end

def ui_pods
  pod 'IQKeyboardManagerSwift'
  pod 'MaterialComponents/TextControls+OutlinedTextAreas'
  pod 'MaterialComponents/TextControls+OutlinedTextFields'
  pod 'StatusAlert', '~> 1.1.1'
end

target 'Furdresser' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Furdresser
  db_pods
  ui_pods
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
