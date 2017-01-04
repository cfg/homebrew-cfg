class Idevicerestore < Formula
  desc "Cross-platform tool for updating and restoring IPSW firmware to iOS devices"
  homepage "http://www.libimobiledevice.org/"
  url "https://git.sukimashita.com/idevicerestore.git", :revision => "cae1734c597371e7c3ccd384434e638071843249"
  revision 2

  version "2016.09.30"

  bottle :unneeded

  head do
    url "https://git.sukimashita.com/idevicerestore.git"
    depends_on "pkg-config" => :build
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "libirecovery"
  depends_on "libimobiledevice"
  depends_on "libplist"
  depends_on "libzip"
  depends_on "curl"
  depends_on "openssl"

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

  test do
    system "#{bin}/idevicerestore --help |grep -q ^Usage"
  end
end

