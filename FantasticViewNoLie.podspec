Pod::Spec.new do |s|
  s.name             = 'FantasticViewNoLie'
  s.version          = '0.1.5'
  s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'
 
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
                       DESC
 
  s.homepage         = 'https://github.com/stefanadisurya/FantasticView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stefan Adisurya' => 'stefanadisurya@gmail.com' }
  s.source           = { :git => 'https://github.com/stefanadisurya/FantasticView.git', :tag => s.version.to_s }
  s.swift_versions   = '4.0'

  s.ios.deployment_target = '13.0'
  s.source_files = ['FantasticView/TextureExample/*.swift', 'FantasticView/UIKitExample/*.swift', 'FantasticView/Helper/*.swift']
  s.dependency 'Texture'
  s.dependency 'TextureSwiftSupport'
 
end
