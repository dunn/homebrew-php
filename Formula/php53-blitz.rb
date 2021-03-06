require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php53Blitz < AbstractPhp53Extension
  init
  homepage 'http://alexeyrybak.com/blitz/blitz_en.html'
  url 'https://github.com/alexeyrybak/blitz/archive/v0.8.18.tar.gz'
  sha1 'c51233a241943faf74c6d28622277ff26d299cb8'

  bottle do
    root_url "https://homebrew.bintray.com/bottles-php"
    sha256 "ca6d6a9b4142810c9221121f8a0a0ff929f759f6b1677049632384e634b554e3" => :yosemite
    sha256 "d92eb9e226ef6cd565585625caf90fd776613e78f87e2f32f872a8141499031e" => :mavericks
    sha256 "a912987c39aec7b82bbd9fcdf86ae4636e44446a9287c585915b2600cf8374f2" => :mountain_lion
  end

  head 'https://github.com/alexeyrybak/blitz.git'

  def install
    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/blitz.so"
    write_config_file if build.with? "config-file"
  end

  def config_file
    super + <<-EOS.undent
      blitz.auto_escape=0
      blitz.check_recursion=1
      blitz.comment_close="*/"
      blitz.comment_open="/*"
      blitz.enable_alternative_tags=1
      blitz.enable_callbacks=1
      blitz.enable_comments=0
      blitz.enable_include=1
      blitz.enable_php_callbacks=1
      blitz.lower_case_method_names=1
      blitz.path=""
      blitz.php_callbacks_first=1
      blitz.remove_spaces_around_context_tags=1
      blitz.scope_lookup_limit=0
      blitz.tag_close="}}"
      blitz.tag_close_alt="-->"
      blitz.tag_open="{{"
      blitz.tag_open_alt="<!--"
      blitz.throw_exceptions=0
      blitz.var_prefix="$"
      blitz.warn_context_duplicates=0
    EOS
  end
end
