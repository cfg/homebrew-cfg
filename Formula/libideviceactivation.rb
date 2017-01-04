class Libideviceactivation < Formula
  desc "Library and utility to manage the activation process of Apple iOS devices."
  homepage "http://www.libimobiledevice.org/"
  url "https://git.libimobiledevice.org/libideviceactivation.git", :tag => "1.0.0", :revision => "3d35c506b4be67347f6f68db0dd9128f012a79be"

  bottle :unneeded

  head do
    url "https://git.libimobiledevice.org/libideviceactivation.git"
    depends_on "pkg-config" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "curl"
  depends_on "libxml2"
  depends_on "libplist"
  depends_on "libimobiledevice"
  depends_on "openssl"
  depends_on "usbmuxd"

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
