class Summond < Formula
  desc "Schedule and manage macOS background jobs without writing a single plist"
  homepage "https://github.com/joshgummersall/summond"
  version "v0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joshgummersall/summond/releases/download/#{version}/summond-darwin-arm64"
      sha256 "8f3ea3cac090c47105db2f2525dc3a2429d14d86b964a376e7b53766aaeaaf61"
    else
      url "https://github.com/joshgummersall/summond/releases/download/#{version}/summond-darwin-amd64"
      sha256 "14ba51117f88e469f113dc0c8d3e2b7b59500253163dabfd50ad4178fad7abe1"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "summond-darwin-arm64" => "summond"
    else
      bin.install "summond-darwin-amd64" => "summond"
    end
  end

  test do
    system "#{bin}/summond", "version"
  end
end
