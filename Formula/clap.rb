class Clap < Formula
  desc "Audio and text embedding inference with ggml"
  homepage "https://github.com/gorse-io/clap.cpp"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gorse-io/clap.cpp/releases/download/v0.1.1/clap-macos-arm64",
        using: :nounzip
    sha256 "58fd60288be2be47363505d4d565bb391a757c28ccca45c38ab600dfa3e2b06b"
  end

  on_linux do
    on_intel do
      url "https://github.com/gorse-io/clap.cpp/releases/download/v0.1.1/clap-linux-amd64-cpu",
          using: :nounzip
      sha256 "242b2e53308087eb0ee3ff305284b3c77f7d169ddaa47d0413ab12750cdd40c2"
    end

    on_arm do
      url "https://github.com/gorse-io/clap.cpp/releases/download/v0.1.1/clap-linux-arm64-cpu",
          using: :nounzip
      sha256 "09255d6fd156dc6988baf355d3bde3f24dce17ffdd0c730f185dfc4dc946e4a6"
    end
  end

  def install
    binary = Dir.children(buildpath).find { |path| path.start_with?("clap-") }
    odie "clap binary not found" if binary.nil?

    bin.install binary => "clap"
    chmod 0755, bin/"clap"
  end

  test do
    output = shell_output("#{bin}/clap --help")
    assert_match "clap.cpp", output
    assert_match "embedding", output
    assert_match "serve", output
  end
end
