ContactManager.module 'ContactsApp.List', (List, ContactManager, Backbone, Marionette, $, _) ->
  List.Contact = Marionette.ItemView.extend
    tagName: 'tr'
    template: '#contact-list-item'
    events:
      'click': 'highlightName'
      'click button.js-delete': 'deleteContact'

    highlightName: (e) ->
      @$el.toggleClass 'warning'

    deleteContact: (e) ->
      e.stopPropagation()
      @trigger 'contact:delete', @model

  List.Contacts = Marionette.CompositeView.extend
    tagName: 'table'
    className: 'table table-hover'
    template: '#contact-list'
    itemView: List.Contact
    itemViewContainer: 'tbody'
