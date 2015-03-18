require 'formula'

class Libcsptr < Formula
  homepage "https://github.com/Snaipe/c-smart-pointers/"
  url "https://github.com/Snaipe/c-smart-pointers.git", :tag => "v1.0"
  head "https://github.com/Snaipe/c-smart-pointers.git"

  depends_on "autoconf"                => :build
  depends_on "automake"                => :build
  depends_on "libtool"                 => :build
  depends_on "homebrew/versions/gcc49" => :build
  fails_with :clang

  def install
    system "./autogen.sh"
    system "./configure CC='gcc-4.9' --prefix=#{prefix}"
    system "make install"
  end
end
