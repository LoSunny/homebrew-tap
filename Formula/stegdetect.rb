class Stegdetect < Formula
  desc "Stegdetect is an automated tool for detecting steganographic content in images"
  homepage "https://web.archive.org/web/20150415213536/http://www.outguess.org/detection.php"
  url "https://github.com/abeluck/stegdetect/archive/28a4f074a71c682581314491224f9f41511c82e7.zip"
  version "0.6"
  sha256 "bc86d97d8f7e59bcc942254440b73a73af181f13f5e28b18de5a022ef2f123f9"
  license "Custom License"

  on_macos do
    patch :p1 do
      url "https://raw.githubusercontent.com/LoSunny/homebrew-tap/master/Formula/stegdetect/patch-macport.diff"
      sha256 "c4f9682356785e78ca4a3eed6619f151da3c1519d53de0720a25cfa3fcabe2e3"
    end

    patch :p0 do
      url "https://raw.githubusercontent.com/LoSunny/homebrew-tap/master/Formula/stegdetect/patch-Makefile.in.diff"
      sha256 "e4b0c3ef2e609310735a00d2712aae5f0306160d50d522f2a7aa50e32e5b2202"
    end

    patch :p0 do
      url "https://raw.githubusercontent.com/LoSunny/homebrew-tap/master/Formula/stegdetect/patch-configure.diff"
      sha256 "d40ad5c6982fa09c80d5b6f1fda36c4cde29a733441a8813bb2c480f3be518b5"
    end

    patch :p0 do
      url "https://raw.githubusercontent.com/LoSunny/homebrew-tap/master/Formula/stegdetect/patch-file_Makefile.in.diff"
      sha256 "c54203bab428524a87001aa9fe00d4fd95f204d494396a52fab9a57684a3f41f"
    end

    patch :p0 do
      url "https://github.com/LoSunny/homebrew-tap/raw/d3324bd0028438153af0403781b95f95f27b1bf1/Formula/stegdetect/patch-stegdetect.c.diff"
      sha256 "4f83fcf6fdcfd57c2306a56b3a163c52e437d6ba82050b268592522a1ec1507c"
    end

    patch :p0 do
      url "https://raw.githubusercontent.com/LoSunny/homebrew-tap/master/Formula/stegdetect/implicit.patch"
      sha256 "93f633399779b92c04d0bc0959eae052b20bcd73519f5d68db7fe97bce31b8bc"
    end
  end

  def install
    ENV["LC_CTYPE"] = "C"
    ENV["LANG"] = "C"
    ENV["LC_ALL"] = "C"

    system "./configure", *std_configure_args, "--disable-silent-rules", "--mandir=${prefix}/share/man"
    system "make"

    bin.install "stegbreak"
    bin.install "stegcompare"
    bin.install "stegdeimage"
    bin.install "stegdetect"
  end
end
