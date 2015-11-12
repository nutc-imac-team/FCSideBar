Pod::Spec.new do |s|
  s.name         = "FCSideBar"
  s.version      = "1.0.0"
  s.summary      = "一個有動畫效果的側邊欄"
  s.description  = <<-DESC
                    透過手勢顯示側邊欄，側邊欄可以切換到相對應名字的controller。
                   DESC
  s.homepage     = "https://github.com/nutc-imac-team/iOS-000-FCSideBar"
  
  s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    LICENSE
  }
  s.author       = { "FrancisHu770410" => "FrancisHu770410@gmail.com" }
  s.source       = { :git => "https://github.com/nutc-imac-team/iOS-000-FCSideBar.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.4'
  s.requires_arc = true

  s.source_files = 'FCSideBar/*'
  s.frameworks = 'Foundation', 'UIKit'
  
end