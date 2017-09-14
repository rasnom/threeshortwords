require 'rails_helper'

RSpec.describe 'WordsAPI' do
  let(:thesaurus) { WordsAPI.new }

  it 'can create a thesaurus service with a name' do
    expect(thesaurus.name).to eq 'Words API'
  end

  it 'has an api key' do
    expect(thesaurus.api_key).to be_a(String)
  end
  
  describe 'url' do
    it 'formats the url correctly for an api call for the given word' do
      expect(thesaurus.url('banana')).to eq 'https://wordsapiv1.p.mashape.com/words/banana'
    end
  end

  describe 'extract_relevant_words' do
    let(:fast_synonyms) {[
      'firm','loyal','truehearted','faithful','tight','immobile','fixed','flying','quick',
      'hurried','fasting','abstinence','diet','hunger strike','ramadan','dieting','debauched',
      'degenerate','degraded','dissipated','dissolute','libertine','profligate','riotous',
      'immoral','desist','refrain','abstain','winged','accelerated','instantaneous','meteoric',
      'prompt','rapid','red-hot','scurrying','smart','speedy','straightaway','swift',
      'windy','blistering','double-quick','express','fast-breaking','fast-paced','fleet',
      'high-speed','high-velocity','hot','hurrying','immediate','instant','presto','vivace',
      'andantino','allegretto','prestissimo','allegro','causative','smooth','imperviable',
      'impervious','alacritous'
    ]}

    it 'has a list of the categories to take words from' do
      categories = ['synonyms','typeOf','hasTypes','similarTo']
      expect(thesaurus.relevant_api_categories).to match_array categories
    end

    it 'returns the words in the relevant categories' do
      expect(thesaurus.extract_relevant_words(FAST_RAW_RESPONSE)).to match_array fast_synonyms
    end
  end

  describe 'synonym' do
    it 'returns a list of synonyms' do
      allow(HTTParty).to receive(:get).and_return('{"noun":{"syn":["this","and","that"]}}')

      result = thesaurus.synonym('anything')
      expect(result).to be_a(Array)
      expect(result.first).to be_a(String)
    end

    it 'returns an empty array if no word is specified' do
      result = thesaurus.synonym('')
      expect(result).to eq [] 
    end
  end

  FAST_RAW_RESPONSE = '{
    "word": "fast",
    "results": [
      {
        "definition": "unwavering in devotion to friend or vow or cause",
        "partOfSpeech": "adjective",
        "synonyms": [
          "firm",
          "loyal",
          "truehearted"
        ],
        "similarTo": [
          "faithful"
        ],
        "examples": [
          "fast friends"
        ]
      },
      {
        "definition": "firmly or closely",
        "partOfSpeech": "adverb",
        "synonyms": [
          "tight"
        ],
        "examples": [
          "held fast to the rope",
          "her foot was stuck fast"
        ]
      },
      {
        "definition": "securely fixed in place",
        "partOfSpeech": "adjective",
        "synonyms": [
          "firm",
          "immobile"
        ],
        "similarTo": [
          "fixed"
        ],
        "derivation": [
          "fastness"
        ]
      },
      {
        "definition": "hurried and brief",
        "partOfSpeech": "adjective",
        "synonyms": [
          "flying",
          "quick"
        ],
        "similarTo": [
          "hurried"
        ],
        "derivation": [
          "fastness"
        ],
        "examples": [
          "a fast visit"
        ]
      },
      {
        "definition": "abstaining from food",
        "partOfSpeech": "noun",
        "synonyms": [
          "fasting"
        ],
        "typeOf": [
          "abstinence"
        ],
        "hasTypes": [
          "diet",
          "hunger strike",
          "ramadan",
          "dieting"
        ]
      },
      {
        "definition": "unrestrained by convention or morality",
        "partOfSpeech": "adjective",
        "synonyms": [
          "debauched",
          "degenerate",
          "degraded",
          "dissipated",
          "dissolute",
          "libertine",
          "profligate",
          "riotous"
        ],
        "similarTo": [
          "immoral"
        ],
        "examples": [
          "fast women"
        ]
      },
      {
        "definition": "abstain from certain foods, as for religious or medical reasons",
        "partOfSpeech": "verb",
        "typeOf": [
          "desist",
          "refrain",
          "abstain"
        ],
        "hasTypes": [
          "diet"
        ],
        "derivation": [
          "fasting"
        ],
        "examples": [
          "Catholics sometimes fast during Lent"
        ]
      },
      {
        "definition": "abstain from eating",
        "partOfSpeech": "verb",
        "typeOf": [
          "desist",
          "abstain",
          "refrain"
        ],
        "hasTypes": [
          "diet"
        ],
        "derivation": [
          "fasting"
        ],
        "examples": [
          "Before the medical exam, you must fast"
        ]
      },
      {
        "definition": "acting or moving or capable of acting or moving quickly",
        "partOfSpeech": "adjective",
        "also": [
          "hurried",
          "sudden"
        ],
        "attribute": [
          "speed",
          "fastness",
          "swiftness"
        ],
        "similarTo": [
          "winged",
          "accelerated",
          "alacritous",
          "instantaneous",
          "meteoric",
          "prompt",
          "quick",
          "rapid",
          "red-hot",
          "scurrying",
          "smart",
          "speedy",
          "straightaway",
          "swift",
          "windy",
          "blistering",
          "double-quick",
          "express",
          "fast-breaking",
          "fast-paced",
          "fleet",
          "high-speed",
          "high-velocity",
          "hot",
          "hurrying",
          "immediate",
          "instant"
        ],
        "antonyms": [
          "slow"
        ],
        "derivation": [
          "fastness"
        ],
        "examples": [
          "fast film",
          "on the fast track in school",
          "set a fast pace",
          "a fast car"
        ]
      },
      {
        "definition": "at a rapid tempo",
        "partOfSpeech": "adjective",
        "inCategory": [
          "music"
        ],
        "similarTo": [
          "presto",
          "andantino",
          "allegretto",
          "vivace",
          "prestissimo",
          "allegro"
        ],
        "antonyms": [
          "slow"
        ],
        "derivation": [
          "fastness"
        ],
        "examples": [
          "the band played a fast fox trot"
        ]
      },
      {
        "definition": "(of a photographic lens or emulsion) causing a shortening of exposure time",
        "partOfSpeech": "adjective",
        "similarTo": [
          "causative"
        ],
        "examples": [
          "a fast lens"
        ]
      },
      {
        "definition": "(of surfaces) conducive to rapid speeds",
        "partOfSpeech": "adjective",
        "similarTo": [
          "smooth"
        ],
        "examples": [
          "a fast road",
          "grass courts are faster than clay"
        ]
      },
      {
        "definition": "resistant to destruction or fading",
        "partOfSpeech": "adjective",
        "similarTo": [
          "imperviable",
          "impervious"
        ],
        "examples": [
          "fast colors"
        ]
      },
      {
        "definition": "(used of timepieces) indicating a time ahead of or later than the correct time",
        "partOfSpeech": null,
        "antonyms": [
          "slow"
        ],
        "examples": [
          "my watch is fast"
        ]
      }
    ],
    "syllables": {
      "count": 1,
      "list": [
        "fast"
      ]
    },
    "pronunciation": {
      "all": "fæst"
    },
    "frequency": 5.15
  }'

end
