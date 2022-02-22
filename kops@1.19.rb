# frozen_string_literal: true

# Installs kops v1.19.1
class KopsAT119 < Formula
  desc 'Production Grade K8s Installation, Upgrades, and Management'
  homepage 'https://github.com/kubernetes/kops'
  url 'https://github.com/kubernetes/kops/archive/v1.19.1.tar.gz'
  sha256 'c7b1c362712d75119e25e4ec06dc44ddc810808c0ae3ed24fb1ca47ebc2d6b7b'
  license 'Apache-2.0'
  head 'https://github.com/kubernetes/kops.git', branch: 'master'

  livecheck do
    url :stable
    strategy :github_latest
  end

  keg_only :versioned_formula

  depends_on 'go' => :build
  depends_on 'kubernetes-cli'

  def install
    ENV['VERSION'] = version unless build.head?
    ENV['GOPATH'] = buildpath
    kopspath = buildpath / 'src/k8s.io/kops'
    kopspath.install Dir['*']
    system 'make', '-C', kopspath
    bin.install('bin/kops')

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/kops", 'completion', 'bash')
    (bash_completion / 'kops').write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/kops", 'completion', 'zsh')
    (zsh_completion / '_kops').write output
  end

  test do
    system "#{bin}/kops", 'version'
  end
end
