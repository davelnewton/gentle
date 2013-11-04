ContactManager.module 'ContactsApp.Show', (Show, ContactManager, Backbone, Marionette, $, _) ->
  Show.Contact = Marionette.ItemView.extend { template: '#contact-view' }
  Show.missingContact = Marionette.ItemView.extend { template: '#missingContact-view' }

  Show.Contact.viewFor = (model) ->
    new Show.Contact { model: model }
