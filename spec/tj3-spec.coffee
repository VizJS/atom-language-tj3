describe "TaskJuggler 3 grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-tj3')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.tj3')

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'source.tj3'

  describe "keywords", ->
    it "tokenizes 'project' as a keyword", ->
      {tokens} = grammar.tokenizeLine('project')
      expect(tokens[0]).toEqual value: 'project', scopes: ['source.tj3', 'keyword.control.tj3']
