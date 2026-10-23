class Sshai < Formula
  desc "Run non-interactive SSH commands with bounded local evidence"
  homepage "https://github.com/aprudkin/sshai"
  url "https://github.com/aprudkin/sshai/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "ea1a9b9315346f9eef86c75eff57500d95e28036cccf4d45da7fa97b5769658f"
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
