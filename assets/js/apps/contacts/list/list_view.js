// Generated by CoffeeScript 1.6.3
ContactManager.module('ContactsApp.List', function(List, ContactManager, Backbone, Marionette, $, _) {
  List.Contact = Marionette.ItemView.extend({
    tagName: 'tr',
    template: '#contact-list-item'
  });
  return List.Contacts = Marionette.CompositeView.extend({
    tagName: 'table',
    className: 'table table-hover',
    template: '#contact-list',
    itemView: List.Contact,
    itemViewContainer: 'tbody'
  });
});
