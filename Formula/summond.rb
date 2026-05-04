class Summond < Formula
  desc "Schedule and manage macOS background jobs without writing a single plist"
  homepage "https://github.com/joshgummersall/summond"
  version "v0.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joshgummersall/summond/releases/download/#{version}/summond-darwin-arm64"
      sha256 "cd046c0b3db77cf00bf9b830f3e81c2e69a10615601031313f15bed2981df536"
    else
      url "https://github.com/joshgummersall/summond/releases/download/#{version}/summond-darwin-amd64"
      sha256 "6333630f2fb7305eb0078759baf06f3948449634384065bdabdefc8b0760002c"
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
