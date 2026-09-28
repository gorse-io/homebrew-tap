class Goat < Formula
  desc "Go assembly transpiler for C programming language"
  homepage "https://github.com/gorse-io/goat"
  url "https://github.com/gorse-io/goat/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "097672e43bbfdc0943936e7400356ade945d8e6499521c669b5a8d163c9425b3"
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
