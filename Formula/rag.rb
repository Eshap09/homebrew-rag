class Rag < Formula
  include Language::Python::Virtualenv

  desc "Local RAG API — chat with your documents from the browser"
  homepage "https://github.com/Eshap09/PDF-Rag"
  url "https://github.com/Eshap09/PDF-Rag/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ee14027477de5c40a527a29e1262920cc9d25ba3470563fff2df1469ce6da0f9"
  license "MIT"

  depends_on "python@3.11"
  depends_on "tesseract"
  depends_on "poppler"

  def install
    virtualenv_install_with_resources
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