class Sshai < Formula
  desc "Run non-interactive SSH commands with bounded local evidence"
  homepage "https://github.com/aprudkin/sshai"
  url "https://github.com/aprudkin/sshai/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "46b2b8f3b317e548a00b2fbc9740ebbf6c5b4ece0723cc546af8dab22594abb2"
  license "MIT"

  depends_on "go" => :build

  def fetch
    system "go", "mod", "download"
  end

  def install
    system "go", "build", *std_go_args, "./cmd/sshai"
    pkgshare.install "skills"
  end

  test do
    ENV["HOME"] = testpath
    root = testpath/"sshai-root"
    root.mkpath
    (root/"config.toml").write <<~TOML
      [hosts.fixture]
      os = "linux"
    TOML
    ENV["SSHAI_ROOT"] = root

    assert_equal "fixture  os=linux  readonly=false",
                 shell_output("#{bin}/sshai hosts").strip
  end
end
