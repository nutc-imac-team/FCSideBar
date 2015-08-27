Pod::Spec.new do |s|
  s.name         = "FCSideBar"
  s.version      = "1.0.0"
  s.summary      = "一個有動畫效果的側邊欄"
  s.description  = <<-DESC
                    透過手勢顯示側邊欄。
                   DESC
  s.homepage     = "https://github.com/nutc-imac-team/iOS-000-FCSideBar"
  
  s.license      = 'MIT'
  s.author       = { "FrancisHu770410" => "FrancisHu770410@gmail.com" }
  s.source       = { :git => "https://github.com/nutc-imac-team/iOS-000-FCSideBar.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.4'
  s.requires_arc = true

  s.source_files = 'FCSideBarAnimation/*'
  s.frameworks = 'Foundation', 'UIKit'
  
end