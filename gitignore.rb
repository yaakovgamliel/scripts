#this script creates for you a .gitignore file in place
#acording to https://github.com/github/gitignore/blob/master/Objective-C.gitignore
#

class String
  def self.colorize(text,color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def green
    self.class.colorize(self,36)
  end
end

gitignore = <<GIT 
# Xcode
.DS_Store
*/build/*
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata
profile
*.moved-aside
DerivedData
.idea/
*.hmap"
GIT

file = File.open('.gitignore','w') do |f|
  f.write(gitignore)
end

puts 'Your .gitignore file is ready'.green




