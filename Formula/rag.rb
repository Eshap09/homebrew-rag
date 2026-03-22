class Rag < Formula
  include Language::Python::Virtualenv

  desc "Local RAG API — chat with your documents from the browser"
  homepage "https://github.com/Eshap09/PDF-Rag"
  url "https://github.com/Eshap09/PDF-Rag/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "2babd3e56da914b2386ec8c9a3a7c82a11d3c6ef05c4a8bc3a4660d2003419c1"
  license "MIT"

  depends_on "python@3.12"
  depends_on "tesseract"
  depends_on "poppler"

  def install
        # 1. Create venv and EXPLICITLY ensure pip is installed inside it
        system "python3.12", "-m", "venv", libexec
        
        # 2. Upgrade pip and setuptools inside the new venv
        system libexec/"bin/pip", "install", "--upgrade", "pip", "setuptools"

        # 3. Install your project (this reads the pyproject.toml)
        # We use '.' because we are inside the buildpath
        system libexec/"bin/pip", "install", "."

        # 4. Link the 'rag' binary so you can run it from anywhere
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