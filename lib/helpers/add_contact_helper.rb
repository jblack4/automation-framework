require_relative '../../spec/spec_helper'

module AddContactHelper
  def add_contact(contact)
    visit MyContactsPage do |page|
      page.new_contact
    end
    on NewContactPage do |page|
      page.enter_contact_info(contact)
    end
  end
end
