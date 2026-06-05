class GorseCli < Formula
  desc "Command-line tool for Gorse cluster management"
  homepage "https://github.com/gorse-io/gorse"
  version "0.5.8"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gorse-io/gorse/releases/download/v0.5.8/gorse-cli_darwin_arm64",
        using: :nounzip
    sha256 "a0cbeba883661d20d558d6657480f213e0bb2e5cd9eff596d3b65f0f89573478"
  end

  on_linux do
    on_intel do
      url "https://github.com/gorse-io/gorse/releases/download/v0.5.8/gorse-cli_linux_amd64",
          using: :nounzip
      sha256 "20346794a48276a9816fb21eaa3f2a4ef49ab237375a3899859931c91dc84d0a"
    end

    on_arm do
      url "https://github.com/gorse-io/gorse/releases/download/v0.5.8/gorse-cli_linux_arm64",
          using: :nounzip
      sha256 "1aef034035a8cadf32bd8804cff463d258e8cacad7397a7202ea9a033251982f"
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
