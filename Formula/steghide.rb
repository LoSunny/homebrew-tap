class Steghide < Formula
  desc "Steghide is a steganography program that is able to hide data in various kinds of image- and audio-files. The color- respectivly sample-frequencies are not changed thus making the embedding resistant against first-order statistical tests"
  homepage "https://steghide.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/steghide/steghide/0.5.1/steghide-0.5.1.tar.gz"
  sha256 "78069b7cfe9d1f5348ae43f918f06f91d783c2b3ff25af021e6a312cf541b47b"
  license "GPL-2.0-only"

  depends_on "zlib" => :build
  depends_on "libjpeg" => :build
  depends_on "mhash" => :build
  depends_on "mcrypt" => :build

  on_macos do

    depends_on "gettext" => :build

    patch :p1 do
      url "https://raw.githubusercontent.com/LoSunny/homebrew-tap/master/Formula/steghide/macos_patch.diff"
      sha256 "b94a86b9febab778048eb300a8bffe9dab5971a7b2db6e1e9adf4fb563d3145e"
    end

    def install
      ENV.deparallelize

      system "./configure", *std_configure_args, "--disable-debug", "--disable-dependency-tracking", "--disable-silent-rules", "--prefix=#{prefix}"
      system "make || true"

      if Hardware::CPU.arm?
        resource "postmake_files" do
          url "https://raw.githubusercontent.com/LoSunny/homebrew-tap/master/Formula/steghide/postmake-arm.sh"
          sha256 "c13c859d218271a71e9805d115b851ffc1baeabfcde98f7f51d6531581f38645"
        end
        resource("postmake_files").stage buildpath
        chmod "+x", "./postmake-arm.sh"
        system "./postmake-arm.sh"
      end
      if Hardware::CPU.intel?
        resource "postmake_files" do
          url "https://raw.githubusercontent.com/LoSunny/homebrew-tap/master/Formula/steghide/postmake.sh"
          sha256 "24256438b297afcd17f020bb8a93f90b743301849af2f7d0f1768eebb14745c4"
        end
        resource("postmake_files").stage buildpath
        chmod "+x", "./postmake.sh"
        system "./postmake.sh"
      end

      bin.install "src/steghide" => "steghide"
    end
  end

  on_linux do # Untested
    def install
      ENV.deparallelize
      system "./configure", *std_configure_args, "--disable-debug", "--disable-dependency-tracking", "--disable-silent-rules", "--prefix=#{prefix}"
      system "make"
      bin.install "src/steghide" => "steghide"
    end
  end
end
