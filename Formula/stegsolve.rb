class Stegsolve < Formula
  desc "It is used to analyze images in different planes by taking off bits of the image"
  homepage "https://github.com/zardus/ctf-tools/blob/master/stegsolve/install"
  url "http://www.caesum.com/handbook/Stegsolve.jar"
  mirror "https://losunny-my.sharepoint.com/:u:/g/personal/sunnylo_sunnylo_cf/EXTJLH9cVOFFqZ6ZX_2VRgQBBzUdrQGgpE44Qdl2FfocCA?e=W6ZcDu&download=1"
  sha256 "007b49606678f39962edadb875e5ae4ac588ea0588c51deefcde3c8dc4fae55a"
  version "1.3"

  depends_on "openjdk"

  def install
    system "echo '#!/bin/bash\n`brew --prefix openjdk`/bin/java -jar `dirname -- \"$0\"`/stegsolve.jar' > stegsolve"
    bin.install "stegsolve" => "stegsolve"
    bin.install "Stegsolve.jar" => "stegsolve.jar"
  end
end