require 'words_counted'

lorem="Lorem ipsum ipsum ipsum dolor dolor dolor dolor dolor dolor dolor sit amet consectetur adipisicing elit. Magni quibusdam sint quasi saepe nemo earum nostrum autem nulla sunt perferendis quidem cupiditate quam quaerat atque atque atque atque atque atque atque atque atque atque praesentium tenetur tenetur accusamus dolorum dolorem"
lorem2=lorem.split(' ').join('-')

class Test
  include WordsCounted
  attr_accessor :slug, :contatore
  def initialize(slug)
    @slug = slug
    @contatore = Counter.new(@slug)
  end

  def prova
    Counter.new(@slug)
  end
end


class Token < WordsCounted::Tokeniser
  attr_accessor :input, :slug
  def initialize(slug)
    @slug = slug
    super
  end
end

class Stat < WordsCounted::Counter
  attr_accessor :tokens, :slug
  def initialize(slug)
    # @slug = slug
    super
  end
end

def prova (slug, delimiter: '-', **options)
  # options.transform_keys!(&:to_sym)
  # puts "options: ", *options
  WordsCounted::Tokeniser.new(slug).tokenise(**options)
end

puts prova(lorem, exclude: "asas")
# puts prova(lorem, pattern: /[^-]+/)
