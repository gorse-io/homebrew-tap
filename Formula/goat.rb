class Goat < Formula
  desc "Go assembly transpiler for C programming language"
  homepage "https://github.com/gorse-io/goat"
  url "https://github.com/gorse-io/goat/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "f291a448048a44bed2743f52a90d37d7703a948d83dc6e033dab10258d7b4fb0"
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
