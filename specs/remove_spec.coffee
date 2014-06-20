FrTrie = require('../src/frtrie')

describe 'frtrie', ->
  describe 'remove', ->

    it 'non exising string from trie', (done) ->
      trie = new FrTrie()
      trie.add(1, "Hard Rock Cafe")
      trie.add(2, "Band Rocking")
      trie.add(3, "Roc")
      trie.remove(300)
      expect(trie.lookup("roc").length).toBe(3)
      done()

    it 'exising string from trie', (done) ->
      trie = new FrTrie()
      trie.add(1, "Hard Rock Cafe")
      trie.add(2, "Band Rocking")
      trie.add(3, "Roc")
      trie.remove(3)
      expect(trie.lookup("roc").length).toBe(2)
      expect(trie.map).toEqual({1: "Hard Rock Cafe", 2: "Band Rocking"})
      done()

