class Rag < Formula
  include Language::Python::Virtualenv

  desc "Local RAG API — chat with your documents from the browser"
  homepage "https://github.com/Eshap09/PDF-Rag"
  url "https://github.com/Eshap09/PDF-Rag/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "0d62bcf5eac40a4c251117e76b9dbdef9e30a45910b20f3451a0f7f30d5bed93"
  license "MIT"

  depends_on "python@3.12"
  depends_on "tesseract"
  depends_on "poppler"

  def install
    # create virtualenv with python3.12
    venv = virtualenv_create(libexec, "python3.12")

    # install the package WITHOUT linking binaries
    venv.pip_install buildpath

    # manually link the rag binary
    bin.install_symlink libexec/"bin/rag"
  end

  def caveats
    <<~EOS
      RAG installed. To get started:

        rag start

      Opens the UI at http://localhost:8000 automatically.

      Set your Groq API key (free at https://console.groq.com):

        rag config

      Data is stored in ~/.rag/
    EOS
  end

  test do
    system "#{bin}/rag", "version"
  end
end