Pod::Spec.new do |s|

  s.name         = "LCDownloadManager"
  s.version      = "1.0.3"
  s.summary      = "A simple download helper, resume broken transfer support. Support: http://LeoDev.me"

  s.description  = <<-DESC

                   A simple download helper, you can resume broken transfer.
                   It dependent on AFN(https://github.com/AFNetworking/AFNetworking) 2.x.

                   DESC

  s.homepage     = "https://github.com/iTofu/LCDownloadManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Leo" => "devtip@163.com" }
  s.social_media_url   = "http://LeoDev.me"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iTofu/LCDownloadManager.git", :tag => s.version }
  s.source_files = "LCDownloadManager/*"
  s.requires_arc = true

  s.dependency "AFNetworking", "~> 2.0"

end
