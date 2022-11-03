class Bkcrack < Formula
  desc "Crack legacy zip encryption with Biham and Kocher's known plaintext attack."
  homepage "https://github.com/kimci86/bkcrack"
  url "https://github.com/kimci86/bkcrack/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "ad33a72be3a6a0d29813cbb5f5837281f274cb3e13a534202afccd2c623329d0"
  head "https://github.com/kimci86/bkcrack.git", revision: "master"
  license "Zlib"

  depends_on "cmake" => :build
  depends_on "libomp" => :build
  depends_on "python@3.10" => :optional # For the tools provided

  def install
    system "cmake", "-S", ".", "-B", "build", "-DCMAKE_INSTALL_PREFIX=install", *std_cmake_args
    system "cmake", "--build", "build", "--config", "Release"
    system "cmake", "--build", "build", "--config", "Release", "--target", "install"

    bin.install "build/src/bkcrack"
  end
end