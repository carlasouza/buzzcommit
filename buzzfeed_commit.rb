# 22 ways I refactored this code
# When you see this, you won't be able to stop filing bugs.
# You Won't Believe What Happened When I Refactored This
# You wont believe this one easy trick to get your code to compile
# This developer checked in Git merge messages. What happened next is AMAZING!
# Code reviewers hate it. This 400 char ternary will literally blow your mind!
# This Chart Proves That Everyone You Love In “Game Of Thrones” Is Screwed
# How to ...


class BuzzfeedCommit

  #<number> of <superlative> <adjective> <noun> that will <verb>
  # 16 Things I Broke with This Check-in
  # 40 hauntingly beautiful refactors you won't believe compile.
  # The 25 most ridiculous change requests from clueless end users. #17 will make your head a'splode.
  # "27 lines of C++ that only developers from the 90s will understand!"
  # 37 lines of JavaScript That Will Restore Your Faith In Humanity
  # 17 Unit Tests that Literally Can't Even
  def self.type1
    [
      number,
      superlative,
      adjective,
      noun,
      'that',
      consequence
    ].join ' '
  end

  # Break all tests with this one weird trick!
  def self.type2
    [
      verb,
      noun,
      'with this',
      adjective,
      noun
    ].join ' '
  end

  # [at <time> | #number] will <emotional verb>
  # You won't believe the number of bugs we found in this code. 0:42 will make your skin crawl.
  # The problem was escalated to me. At 3:15, I was in tears.
  def self.type3
    [
      "Line #{number}",
      consequence
    ].join ' '
  end

  # [ number, noun, 'that', adverb, language, subject, action ] # [only] <language> <developers|experts|programers> <like|hate|love|understand>
  def self.type4
    [
      number,
      noun,
      'that',
      adverb,
      language,
      subject,
      action
    ].join ' '
  end

  def self.time
    "#{rand(20)}:#{rand(59).to_s.rjust(2, "0")}"
  end

  def self.number
    rand 10..45
  end

  def self._superlative
    [
      'hauntingly',
      'of the most',
      'amazing',
      'incredible',
      'ridiculous',
      'unbelivable',
      'excellent',
      'magnificent',
      'wonderful',
      'marvelous',
      'supreme',
      'outstanding'
    ]
  end

  def self._adjective
    [
      'beautiful',
      'wierd',
      'cute',
      'ugly'
    ]
  end

  def self._noun
    [
      'libs',
      'change requests',
      'lines of code',
      'bugs',
      'methods',
      'functions',
      'unit tests'
    ]
  end

  def self._verb
    %w[ break fix refactor compile ]
  end

  def self._consequence
    [
      'will make you shiver',
      "looks really freakin' awsome",
      'will improve your day',
      'will finally bring you some peace of mind',
      'are never going to pass the tests',
      "will make your head a'splode",
      'will blow your mind',
      'will make your skin crawl',
      'will make you cry',
      'will restore your faith in humanity'
    ]
  end


  def self._adverb
    %w[ only all ]
  end

  def self._language
    %w[ C C+ C# Java Python Ruby Bash PHP Perl JavaScript Clojure CSS CoffeeScript HTML Haml Haskel Lua Objective-C Swift ]
  end

  def self._subject
    [
      'developers',
      'experts',
      'programmers',
      'developers from the 90s',
      'haters',
      'ninjas'
    ]
  end

  def self._action
    %w[ like hate love understand ]
  end

  %w[_action _adverb _adjective _consequence _language _noun _subject _superlative _verb].each do |name|
    define_singleton_method "#{name.gsub(/^_/,'')}" do
      self.send(name).shuffle.first
    end
  end

end
