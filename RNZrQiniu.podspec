require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))


Pod::Spec.new do |s|
  s.name         = "RNZrQiniu"
  s.version        = package['version'].gsub(/v|-beta/, '')
  s.summary        = package['description']
  s.author         = package['author']
  s.license        = package['license']
  s.homepage       = package['homepage']
  s.source         = { :git => 'https://github.com/648670978/react-native-zr-qiniu.git', :tag => "v#{s.version}"}
  s.source_files = 'ios/*.{h,m}'
  s.ios.deployment_target = '9.0'

  s.dependency 'React-Core'
  s.dependency 'Qiniu', '8.5.0'

end

  