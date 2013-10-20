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

    remove: ->
      self = @
      @$el.fadeOut ->
        Marionette.ItemView.prototype.remove.call self;

  List.Contacts = Marionette.CompositeView.extend
    tagName: 'table'
    className: 'table table-hover'
    template: '#contact-list'
    itemView: List.Contact
    itemViewContainer: 'tbody'
    onItemviewContactDelete: (arg0) ->
      model = arg0.model
      fullName = "#{model.get('firstName')} #{model.get('lastName')}"
      console.log model
      $.jGrowl "Deleted #{fullName}",
        life: 1000
