LanguageTj3View = require './language-tj3-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageTj3 =
  languageTj3View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @languageTj3View = new LanguageTj3View(state.languageTj3ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageTj3View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-tj3:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageTj3View.destroy()

  serialize: ->
    languageTj3ViewState: @languageTj3View.serialize()

  toggle: ->
    console.log 'LanguageTj3 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
