
class Stats < WordsCounted::Counter

  DELIMITERS = ['-', '—', '―', '~', '\\', '/', '|', '+', '\'', '‘', '’', ' ']
  SEPARATOR = '-'
  TOKEN_REGEXP = /[\p{Alpha}\-']+/

  def initialize(slug, delimiter: SEPARATOR, options: {} )
    @slug = tokenize(slug, delimiter)
    super(@slug)
  end

  def tokenize(token, separator)
    return slug unless DELIMITER.include?(separator)
    slug = slugify(token, separator).split(separator).join(' ')
    tokenizer(slug)
  end

  def slugify(token, separator)
    token.downcase.strip.gsub(' ', separator) if DELIMITER.include? separator
  end

  def tokenizer(slug)
     WordsCounted::Tokeniser.send(:new, slug).tokenise
  end

  def self.tokenize(slug, separator: SEPARATOR, **options )
    token = slug.downcase.strip.gsub(' ', separator) if DELIMITERS.include? separator
    tokenized = WordsCounted::Tokeniser.send(:new, token).tokenise(**options)
    new(tokenized)
  end
end

