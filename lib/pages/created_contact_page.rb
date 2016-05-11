class CreatedContactPage
  include PageObject

  paragraph(:success, id: 'notice')
  paragraph(:first_name, index: 1)
  paragraph(:last_name, index: 2)
  paragraph(:street, index: 3)
  paragraph(:city, index: 4)
  paragraph(:state, index: 5)
  paragraph(:postal_code, index: 6)
  paragraph(:cell_phone, index: 7)
  paragraph(:home_phone, index: 8)
  paragraph(:fax, index: 9)
  paragraph(:notes, index: 10)

  link(:home, href: '/')
  link(:my_account, href: '/users/edit')
  link(:my_contacts, href: '/contacts')
end
