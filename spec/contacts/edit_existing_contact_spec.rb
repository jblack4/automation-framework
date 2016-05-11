include SignUpHelper
include RemoveUser
include AddContactHelper

describe 'Editing a contact' do
  before(:all) do
    @user = create(:user)
    sign_up_user(@user)

    @initial_contact = create(:contact)
    add_contact(@initial_contact)

    @new_contact = create(:contact)
  end
  context 'Edits a contact on My Contacts Page' do
    before(:all) do
      visit MyContactsPage do |page|
        page.edit
      end
    end
    it 'Edits the contact' do
      on EditContactPage do |page|
        expect(page.edit_contact_title).to be_truthy
        page.edit_contact_info(@new_contact)
      end
      on CreatedContactPage do |page|
        expect(page.success).to eq('Contact was successfully created.')
        # TODO: BUG - Should be 'edited'
      end
    end
  end

  context 'On the show contact page' do
    it 'Verifies the first name' do
      on CreatedContactPage do |page|
        expect(page.first_name).to eq("First name: #{@new_contact.first_name}")
      end
    end

    it 'Verifies the last name' do
      on CreatedContactPage do |page|
        expect(page.last_name).to eq("Last name: #{@new_contact.last_name}")
      end
    end

    it 'Verifies the street' do
      on CreatedContactPage do |page|
        expect(page.street).to eq("Street: #{@new_contact.street}")
      end
    end

    it 'Verifies the city' do
      on CreatedContactPage do |page|
        expect(page.city).to eq("City: #{@new_contact.city}")
      end
    end

    it 'Verifies the state' do
      on CreatedContactPage do |page|
        expect(page.state).to eq("State: #{@new_contact.state}")
      end
    end

    it 'Verifies the postal code' do
      on CreatedContactPage do |page|
        expect(page.postal_code).to eq("Postal code: #{@new_contact.postal_code}")
      end
    end

    it 'Verifies the cell phone' do
      on CreatedContactPage do |page|
        expect(page.cell_phone).to eq("Cell phone: #{@new_contact.cell_phone}")
      end
    end

    it 'Verifies the home phone' do
      on CreatedContactPage do |page|
        expect(page.home_phone).to eq("Home phone: #{@new_contact.home_phone}")
      end
    end

    it 'Verifies the fax' do
      on CreatedContactPage do |page|
        expect(page.fax).to eq("Fax: #{@new_contact.fax}")
      end
    end

    it 'Verifies the notes' do
      on CreatedContactPage do |page|
        expect(page.notes).to eq("Notes: #{@new_contact.notes}")
      end
    end
  end

  context 'On the My Contacts Page' do
    before(:all) do
      on CreatedContactPage do |page|
        page.my_contacts
      end
      on MyContactsPage do |page|
        @tbl_hash = page.tbl_contacts[0]
      end
    end

    it 'Verifies the first name' do
      expect(@tbl_hash['First Name']).to eq(@new_contact.first_name)
      # TODO: BUG - should be First name (most consistent)
    end

    it 'Verifies the last name' do
      expect(@tbl_hash['Last name']).to eq(@new_contact.last_name)
    end

    it 'Verifies the street' do
      expect(@tbl_hash['Street']).to eq(@new_contact.street)
    end
    it 'Verifies the city' do
      expect(@tbl_hash['City']).to eq(@new_contact.city)
    end

    it 'Verifies the state' do
      expect(@tbl_hash['State']).to eq(@new_contact.state)
    end

    it 'Verifies the postal code' do
      expect(@tbl_hash['Postel code']).to eq(@new_contact.postal_code)
      # TODO: BUG - should be Postal code
      # TODO: BUG - doesn't match the entered postal code
    end

    it 'Verifies the cell phone' do
      expect(@tbl_hash['Cell phone']).to eq(@new_contact.cell_phone)
    end

    it 'Verifies the home phone' do
      expect(@tbl_hash['Home phone']).to eq(@new_contact.home_phone)
    end

    it 'Verifies the fax' do
      expect(@tbl_hash['Fax']).to eq(@new_contact.fax)
    end

    it 'Verifies the notes' do
      expect(@tbl_hash['Notes']).to eq(@new_contact.notes)
    end
  end

  after(:all) do
    remove_user
  end
end
