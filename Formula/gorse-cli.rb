class GorseCli < Formula
  desc "Command-line tool for Gorse cluster management"
  homepage "https://github.com/gorse-io/cli"
  version "0.5.11"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gorse-io/cli/releases/download/v0.5.11/gorse-cli_darwin_arm64",
        using: :nounzip
    sha256 "35dc7cf6254c5b0893275063c71c7f8be002e164189f2c684d0c20f545addae6"
  end

  on_linux do
    on_intel do
      url "https://github.com/gorse-io/cli/releases/download/v0.5.11/gorse-cli_linux_amd64",
          using: :nounzip
      sha256 "e711be22ace78571d0e011e655c5150c63632c77262ac7f44044c1b2bc10b824"
    end

    on_arm do
      url "https://github.com/gorse-io/cli/releases/download/v0.5.11/gorse-cli_linux_arm64",
          using: :nounzip
      sha256 "034e6d77100af472469474d8687bd36fb973b419b086e48cbda477e09bd068a2"
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
