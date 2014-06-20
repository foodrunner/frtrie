FrTrie = require('../src/frtrie')

describe 'frtrie', ->
  describe 'update', ->

    it 'exising string from trie', (done) ->
      trie = new FrTrie()
      trie.add(1, "Hard Rock Cafe")
      trie.add(2, "Band Rocking")
      trie.add(3, "Roc")
      trie.update(3, "New")
      expect(trie.lookup("roc").length).toBe(2)
      expect(trie.map).toEqual({1: "Hard Rock Cafe", 2: "Band Rocking", 3: "New"})
      done()

