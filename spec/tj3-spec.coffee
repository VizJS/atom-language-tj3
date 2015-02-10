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
