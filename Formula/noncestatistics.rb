class Noncestatistics < Formula
  desc "Utility to request ApNonces for iOS devices."
  homepage "https://tihmstar.blogspot.com/"
  url "https://github.com/tihmstar/noncestatistics/releases/download/0.2/noncestatistics.zip"
  sha256 "10c770b230ddca7bdc22bc36c5e63f90128538e5bc0c1860a1130be137345f58"

  head do
    url "https://github.com/tihmstar/noncestatistics.git"
    depends_on "libxml2" => :build
    depends_on "openssl" => :build
    depends_on "libimobiledevice" => :build
    depends_on "libirecovery" => :build
    depends_on "libplist" => :build
    depends_on "usbmuxd" => :build
    depends_on "xz" => :build
  end

  bottle :unneeded

  def install
    if build.head?
      Dir.chdir("noncestatistics")
      system "make", "all", "STATICLIBS=#{Formula["libplist"].opt_lib}/libplist.a #{Formula["libxml2"].opt_lib}/libxml2.a #{Formula["xz"].opt_lib}/liblzma.a #{Formula["libimobiledevice"].opt_lib}/libimobiledevice.a #{Formula["usbmuxd"].opt_lib}/libusbmuxd.a #{Formula["libirecovery"].opt_lib}/libirecovery.a #{Formula["openssl"].opt_lib}/libcrypto.a"
    end

    bin.install "noncestatistics"
  end

  test do
    system "#{bin}/noncestatistics -h | grep -q ECID"
  end
end
