app = ->
  ContactManager = new Marionette.Application

  ContactManager.addRegions
    mainRegion: '#main-region'

  ContactManager.Contact = Backbone.Model.extend
    defaults:
      firstName: '[No first name provided]'
      lastName: '[No last name provided]'
      phoneNumber: '[No phone number provided]'

  ContactManager.ContactItemView = Marionette.ItemView.extend
    tagName: 'li'
    template: '#contact-list-item'

  ContactManager.ContactsView = Marionette.CollectionView.extend
    tagName: 'ul'
    itemView: ContactManager.ContactItemView

  ContactManager.ContactCollection = Backbone.Collection.extend
    model: ContactManager.Contact

    # This is correct, but not ideal. See below.
    # comparator: (c1, c2) ->
    #   c1f = c1.get('firstName')
    #   c2f = c2.get('firstName')
    #   return c1f.localeCompare(c2f) unless c1f == c2f

    #   c1l = c1.get('lastName')
    #   c2l = c2.get('lastName')
    #   c1l.localeCompare c2l
    comparator: (c) -> "#{c.get('firstName')} #{c.get('lastName')}"

  ContactManager.on 'initialize:after', ->
    contacts = new ContactManager.ContactCollection [
      {
        firstName: 'Bob'
        lastName: 'Brigham'
        phoneNumber: '555-0163'
      },
      { 
        firstName: 'Alice'
        lastName: 'Tampen'
        phoneNumber: '555-0184'
      },
      { 
        firstName: 'Alice'
        lastName: 'Smith'
        phoneNumber: '555-0184'
      },
      { 
        firstName: 'Alice'
        lastName: 'Arten'
        phoneNumber: '555-0184'
      },
      {
        firstName: 'Charlie'
        lastName: 'Campbell'
        phoneNumber: '555-0129'
      }
    ]

    contactsListView = new ContactManager.ContactsView
      collection: contacts

    ContactManager.mainRegion.show contactsListView

  ContactManager.start()
