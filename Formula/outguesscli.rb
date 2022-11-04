class Outguesscli < Formula
  desc "Universal steganographic tool"
  homepage "https://github.com/resurrecting-open-source-projects/outguess"
  url "https://github.com/resurrecting-open-source-projects/outguess/archive/refs/tags/0.4.tar.gz"
  sha256 "1279b05f3bb5e8956c6eb424db247e773440898310c10dbf9571e7b6afae5d60"
  license "NOASSERTION"

  depends_on "automake" => :build
  depends_on "autoconf" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "./autogen.sh"
    system "./configure", *std_configure_args, "--disable-silent-rules", "--with-generic-jconfig", "--mandir=#{man}"
    system "make"
    bin.install "src/outguess"
  end
end
