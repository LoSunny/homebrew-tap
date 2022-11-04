class F5Steganography < Formula
  desc "F5 steganography"
  homepage "https://github.com/matthewgao/F5-steganography"
  url "https://github.com/matthewgao/F5-steganography/archive/d08b5f83dd6794e4081dacaf92bae7ed2f6ea232.zip"
  version "1.0a"
  sha256 "456374186112b5b40e4bd558cc85b1819bb5dbc40ce845aad10478d2702e1267"
  license "GPL-2.0-only"

  depends_on "openjdk@11"

  def install
    binFile = <<HEREDOC
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: f5_steganography [extract|embed] (args...)"
    exit 1
fi

if [ $1 = "extract" ]; then
    shift
    `brew --prefix openjdk@11`/bin/java -cp `brew --prefix f5-steganography` Extract "$@"
elif [ $1 = "embed" ]; then
    shift
    `brew --prefix openjdk@11`/bin/java -cp `brew --prefix f5-steganography` Embed "$@"
else
    echo "Usage: f5_steganography [extract|embed] (args...)"
fi
HEREDOC
    system "echo '" + binFile + "' > f5_steganography"
    bin.install "f5_steganography"
    prefix.install Dir["*"]
  end
end
