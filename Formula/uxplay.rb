# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Uxplay < Formula
  desc "AirPlay Unix mirroring server"
  homepage "https://github.com/FDH2/UxPlay"
  url "https://github.com/FDH2/UxPlay/archive/refs/tags/v1.72.tar.gz"
  sha256 "98e36716d9f2a92f947f6f09020d8bcd3559bb62a53552487a0d3fc95c684d4a"
  license "GPL-3.0-only"

  head "https://github.com/FDH2/UxPlay.git"

  depends_on "cmake" => :build
  depends_on "gstreamer" => :build
  depends_on "glib" => :build
  depends_on "libplist" => :build
  depends_on "openssl@3" => :build

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", ".", *std_cmake_args
    system "make"
    bin.install "uxplay"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test UxPlay`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
