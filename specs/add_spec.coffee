FrTrie = require('../src/frtrie')

describe 'frtrie', ->
  describe 'add', ->

    it 'all suffixes of a string to frtrie', (done) ->
      trie = new FrTrie()
      trie.add(1, "Hard Rock Cafe")
      expect(trie.lookup("Cafe").length).toBe(1)
      expect(trie.lookup("Rock").length).toBe(1)
      expect(trie.lookup("Hard Rock Cafe").length).toBe(1)
      expect(trie.map).toEqual({1: "Hard Rock Cafe"})
      done()

    it 'words with multiple results when lookup', (done) ->
      trie = new FrTrie()
      trie.add(1, "Hard Rock Cafe")
      trie.add(2, "Band Rocking")
      trie.add(3, "Roc")
      expect(trie.lookup("roc").length).toBe(3)
      expect(trie.lookup("Rock").length).toBe(2)
      expect(trie.lookup("Cafe").length).toBe(1)
      done()

