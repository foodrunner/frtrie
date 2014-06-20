normalization_pattern = new RegExp('[^a-zA-Z ]', 'g')
spaces = new RegExp(' ', 'g')
empty = []

class FrTrie
  constructor: () ->
    @root = {}
    @map = {}

  add: (id, text) ->
    @map[id] = text
    words = FrTrie.normalize(text).split(' ')
    for i in [0..words.length]
      word = ""
      word += w for w in words.slice(i)
      @index(id, word)
    return

  remove: (id) ->
    return unless @map[id]
    text = @map[id]
    delete(@map[id])
    words = FrTrie.normalize(text).split(' ')
    for i in [0..words.length]
      word = ""
      word += w for w in words.slice(i)
      @delete(id, word)
    return

  update: (id, text) ->
    @remove(id)
    @add(id, text)
    return

  lookup: (value) ->
    node = @root
    for c in FrTrie.normalize(value).replace(spaces, '')
      return empty unless node[c]
      node = node[c]
    node['$'] || empty

  index: (id, word) ->
    node = @root
    for c in word
      node[c] = {'$': []} unless node[c]
      node[c]['$'].push(id) unless node[c]['$'].indexOf(id) != -1
      node = node[c]
    return

  delete: (id, word) ->
    node = @root
    for c in word
      return unless node[c]
      index = node[c]['$'].indexOf(id)
      node[c]['$'].splice(index, 1) if index != -1
      if node[c]['$'].length == 0
        delete node[c]
        return
      node = node[c]
    return

  @normalize: (text) ->
    text.replace(normalization_pattern, '').toLowerCase()

module.exports = FrTrie
