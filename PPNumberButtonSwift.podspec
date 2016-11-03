Pod::Spec.new do |s|
  s.name         = 'PPNumberButtonSwift'
  s.version      = '0.2.0'
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = 'https://github.com/jkpang/PPNumberButtonSwift.git'
  s.authors      = { "jkpang" => "jkpang@outlook.com" }
  s.summary      = '类似京东淘宝商品数量的加减按钮的Swift版,可定制程度高,使用简单!'

  s.platform     = :ios, '8.0'
  s.source       = { git: 'https://github.com/jkpang/PPNumberButtonSwift.git', :tag => s.version.to_s}
  s.source_files = 'PPNumberButtonSwift/PPNumberButtonSwift/*.{swift}'
  s.frameworks   =  'UIKit'
  s.requires_arc = true

# Pod Dependencies

end
