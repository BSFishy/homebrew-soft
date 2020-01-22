require 'formula'

$repo = "https://github.com/Snaipe/Criterion.git"

class Criterion < Formula
  homepage "https://github.com/Snaipe/Criterion"
  version "2.3.3"
  head $repo
  url  $repo, :branch => "bleeding"

  depends_on "nanomsg"
  depends_on "cmake"    => :build

  def install
    system "cmake",
        "-DCMAKE_BUILD_TYPE=RelWithDebInfo",
        "-DCMAKE_INSTALL_PREFIX=#{prefix}",
        "-DCMAKE_INSTALL_LIBDIR=lib",
        "-DI18N=OFF",
        "."
    system "make install"
  end
end
