class Libirecovery < Formula
  desc "Library and utility to talk to iOS device iBoot/iBSS via USB on Mac OS X, Windows, and Linux"
  homepage "http://www.libimobiledevice.org/"
  url "https://git.libimobiledevice.org/libirecovery.git", :tag => "0.1.1", :revision => "4d8ffd7c14cafd468e92c00eae7d0aac42fbbd23"

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
