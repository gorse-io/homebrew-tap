class GorseCli < Formula
  desc "Command-line tool for Gorse cluster management"
  homepage "https://github.com/gorse-io/gorse"
  version "0.5.11"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gorse-io/gorse/releases/download/v0.5.11/gorse-cli_darwin_arm64",
        using: :nounzip
    sha256 "cea8ac44814c121dcee8f8d3522d94a75f15c66bf7b76b31fedb15f92b42fbb1"
  end

  on_linux do
    on_intel do
      url "https://github.com/gorse-io/gorse/releases/download/v0.5.11/gorse-cli_linux_amd64",
          using: :nounzip
      sha256 "a43c75ecb6f136ea9b982950a0f18224ed11528421602730a17b85d6ab0b9e49"
    end

    on_arm do
      url "https://github.com/gorse-io/gorse/releases/download/v0.5.11/gorse-cli_linux_arm64",
          using: :nounzip
      sha256 "de29e1e9ebeabee1b80791587198fe1c298dabf0127c939f1947a25c680d768d"
    end
  end

  def install
    binary = Dir.children(buildpath).find { |path| path.start_with?("gorse-cli_") }
    odie "gorse-cli binary not found" if binary.nil?

    bin.install binary => "gorse-cli"
    chmod 0755, bin/"gorse-cli"
  end

  test do
    output = shell_output("#{bin}/gorse-cli --version")
    assert_match "Version:", output
    assert_match version.to_s, output
  end
end
