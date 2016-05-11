class NewContactPage
  include PageObject

  page_url 'http://ec2-54-191-181-182.us-west-2.compute.amazonaws.com/contacts/new'

  h1(:new_contact_title, text: 'New Contact')
  text_field(:first_name, id: 'contact_first_name')
  text_field(:last_name, id: 'contact_last_name')
  text_field(:street, id: 'contact_street')
  text_field(:city, id: 'contact_city')
  text_field(:state, id: 'contact_state')
  text_field(:postal_code, id: 'contact_postal_code')
  text_field(:cell_phone, id: 'contact_cell_phone')
  text_field(:home_phone, id: 'contact_home_phone')
  text_field(:fax, id: 'contact_fax')
  text_field(:notes, id: 'contact_notes')
  button(:submit, id: 'contact_submit')

  def enter_contact_info(contact)
    first_name_element.when_present
    self.first_name = contact.first_name
    self.last_name = contact.last_name
    self.street = contact.street
    self.city = contact.city
    self.state = contact.state
    self.postal_code = contact.postal_code
    self.cell_phone = contact.cell_phone
    self.home_phone = contact.home_phone
    self.fax = contact.fax
    self.notes = contact.notes
    submit
  end
end
