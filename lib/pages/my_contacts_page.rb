class MyContactsPage
  include PageObject

  page_url 'http://ec2-54-191-181-182.us-west-2.compute.amazonaws.com/contacts'

  link(:edit, text: 'Edit')
  link(:show, text: 'Show')
  link(:new_contact, text: 'New Contract')
  # TODO:  BUG - should be Contact
  div(:contacts, id: 'content')

  def tbl_contacts
    contacts_element.table_element.hashes
  end
end
