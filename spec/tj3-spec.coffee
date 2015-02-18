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
    it "tokenizes 'project' as a keyword when isolated on a line", ->
      {tokens} = grammar.tokenizeLine('project')
      expect(tokens[0].value).toEqual 'project'

    it "tokenizes 'project' as a keyword when surrounded by spaces", ->
      {tokens} = grammar.tokenizeLine(' project ')
      expect(tokens[1].value).toEqual 'project'

    it "doesn't tokenize 'project' as a keyword when used as a prefix", ->
      {tokens} = grammar.tokenizeLine('task project_keyword "coloring for \'project\' kw" {')
      project_tokens = 0
      for token in tokens
        if token.value and token.value is "project"
          project_tokens += 1
      expect(project_tokens).toEqual 0
      # expect(tokens).not.toContain value: 'project', scopes: ['source.tj3', 'keyword.control.tj3']

    it "doesn't tokenize 'allocate' as a keyword when used as a suffix", ->
      {tokens} = grammar.tokenizeLine('    task kw_allocate "Implement syntax coloring for \'allocate\' keyword" {')
      allocate_tokens = 0
      for token in tokens
        if token.value
          console.log token.value
        if token.value and token.value is "allocate"
          allocate_tokens += 1
      expect(allocate_tokens).toEqual 0
