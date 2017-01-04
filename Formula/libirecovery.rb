class Libirecovery < Formula
  desc "Library and utility to talk to iOS device iBoot/iBSS via USB on Mac OS X, Windows, and Linux"
  homepage "http://www.libimobiledevice.org/"
  url "https://git.libimobiledevice.org/libirecovery.git", :using => :git
  revision 1

  bottle :unneeded

  head do
    url "https://git.libimobiledevice.org/libirecovery.git"
    depends_on "pkg-config" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "libusb"

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
    ]
    system "./autogen.sh" if build.head?
    system "./configure", *args

    system "make", "install"
  end

end