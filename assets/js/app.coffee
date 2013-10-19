ContactManager = new Marionette.Application

ContactManager.addRegions
  mainRegion: '#main-region'

app = ->
  ContactManager.ContactItemView = Marionette.ItemView.extend
    tagName: 'li'
    template: '#contact-list-item'

  ContactManager.ContactsView = Marionette.CollectionView.extend
    tagName: 'ul'
    itemView: ContactManager.ContactItemView

  ContactManager.on 'initialize:after', ->
    contacts = new ContactManager.Entities.ContactCollection [
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
