class Sshai < Formula
  desc "Run non-interactive SSH commands with bounded local evidence"
  homepage "https://github.com/aprudkin/sshai"
  url "https://github.com/aprudkin/sshai/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "90ba15cb9d032ca9fe606d77bd55ba6c878c39e789c7b67e1dea0d386e8b46fb"
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
