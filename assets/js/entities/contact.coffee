# TODO urlRoot/url as constant?
ContactManager.module 'Entities', (Entities, ContactManager, Backbone, Marionette, $, _) ->
  #
  # Contact entity
  #
  Entities.Contact = Backbone.Model.extend
    urlRoot: 'contacts'
    # defaults:
    #   firstName: '[No first name provided]'
    #   lastName: '[No last name provided]'
    #   phoneNumber: '[No phone number provided]'
    # localStorage: new Backbone.LocalStorage 'Contact'

  # TODO WebStorage-only
  Entities.configureStorage Entities.Contact

  #
  # Contact collection
  #
  Entities.ContactCollection = Backbone.Collection.extend
    url: 'contacts'
    model: Entities.Contact
    comparator: (c) -> "#{c.get('firstName')} #{c.get('lastName')}"
    # localStorage: new Backbone.LocalStorage 'ContactCollection'

  # TODO WebStorage-only
  Entities.configureStorage Entities.ContactCollection

  initializeContacts = ->
    console.log 'DBG Entering initializeContacts...'
    contacts = new Entities.ContactCollection [
      { id: 1, firstName: "Alice", lastName: "Arten", phoneNumber: "555-0184" },
      { id: 2, firstName: "Bob", lastName: "Brigham", phoneNumber: "555-0163" },
      { id: 3, firstName: "Charlie", lastName: "Campbell", phoneNumber: "555-0129" }
    ]
    contacts.forEach (contact) -> contact.save()
    contacts.models

  API =
    getContactEntities: ->
      console.log 'DBG Entering API#getContactEntities...'
      defer = $.Deferred()
      contacts = new Entities.ContactCollection()
      contacts.fetch
        success: (data) -> 
          console.log 'DBG   Fetched; resolving data', data
          defer.resolve data
      promise = defer.promise()
      $.when(promise).done (contacts) ->
        console.log 'DBG   Done fetching contacts...'
        if contacts.length == 0
          console.log 'DBG   No contacts; initializing...'
          models = initializeContacts()
          contacts.reset models
      promise

    getContactEntity: (id) ->
      console.log "DBG Entering API#getContactEntity(#{id})..."
      defer = $.Deferred()
      contact = new Entities.Contact { id: id }
      fetchFunc = ->
        contact.fetch
          success: (data) -> defer.resolve data
          error: (data) -> defer.resolve undefined
      setTimeout fetchFunc, 2000
      defer.promise()

  ContactManager.reqres.setHandler 'contact:entities', ->
    console.log "DBG ContactManager contact:entities..."
    API.getContactEntities()

  ContactManager.reqres.setHandler 'contact:entity', (id) ->
    console.log "DBG ContactManager contact:entity id=#{id}..."
    API.getContactEntity id
