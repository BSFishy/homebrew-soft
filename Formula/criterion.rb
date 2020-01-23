require 'formula'

$repo = "https://github.com/Snaipe/Criterion.git"

class Criterion < Formula
  homepage "https://github.com/Snaipe/Criterion"
  version "2.3.3"
  
  stable do
    url  $repo, :tag => "v2.3.3"
  end

  devel do
    url  $repo, :branch => "bleeding"
    version "2.3.3"
  end

  depends_on "nanomsg"
  depends_on "cmake" => :build if not build.devel?
  depends_on "meson" => :build if build.devel?

  def install
    if build.devel?
      system "meson",
          "-Dbuildtype=debugoptimized",
          "-Dprefix=#{prefix}",
          "-Dlibdir=lib",
          "-Di18n=disabled"
          "build"
      system "ninja -C build install"
    else
      system "cmake",
          "-DCMAKE_BUILD_TYPE=RelWithDebInfo",
          "-DCMAKE_INSTALL_PREFIX=#{prefix}",
          "-DCMAKE_INSTALL_LIBDIR=lib",
          "-DI18N=OFF",
          "."
      system "make install"
    end
  end
end
