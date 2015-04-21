Pod::Spec.new do |s|

  s.name         = "Glue"
  s.version      = "0.0.3"
  s.summary      = "Seamlessly glue multiple storyboards together without writing a single line of code."

  s.homepage     = "https://github.com/nubbel/Glue"
  s.screenshots  = "http://share.gifyoutube.com/Kz77qb.gif"

  s.license      = "MIT"

  s.author             = { "Dominique d'Argent" => "nicky.nubbel@gmail.com" }
  s.social_media_url   = "http://twitter.com/nubbel"

  s.platform     = :ios, "8.1"

  s.source       = { :git => "https://github.com/nubbel/Glue.git", :tag => "v#{s.version}" }

  s.source_files  = "Source/*.swift"

  s.requires_arc = true

end
