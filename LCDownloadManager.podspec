Pod::Spec.new do |s|

  s.name         = "LCDownloadManager"
  s.version      = "1.0.1"
  s.summary      = "A simple download helper, you can resume broken transfer. Support: http://www.leodong.com"

  s.description  = <<-DESC
  
                   A simple download helper, you can resume broken transfer. 
                   It dependent on AFN(https://github.com/AFNetworking/AFNetworking)

                   DESC

  s.homepage     = "https://github.com/LeoiOS/LCDownloadManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Leo" => "leoios@sina.com" }
  s.social_media_url   = "http://www.leodong.com"

  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/LeoiOS/LCDownloadManager.git", :tag => s.version }
  s.source_files  = "LCDownloadManager/*"
  s.requires_arc = true

  s.dependency "AFNetworking", "~> 2.0"

end
