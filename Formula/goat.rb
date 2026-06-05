class Goat < Formula
  desc "Go assembly transpiler for C programming language"
  homepage "https://github.com/gorse-io/goat"
  url "https://github.com/gorse-io/goat/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "1ad1ad92b18bb00e28755bcb40087b8a190e6ee871e588f632fe7812eaad301e"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "binutils"
  depends_on "llvm"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")

    libexec.install bin/"goat"
    (bin/"goat").write_env_script libexec/"goat", {
      CLANG: Formula["llvm"].opt_bin/"clang",
      OBJDUMP: Formula["binutils"].opt_bin/"objdump",
    }
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/goat --help")
  end
end
