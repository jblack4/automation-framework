require_relative '../../spec/spec_helper'

module RemoveUser
  def remove_user
    visit EditUserPage do |page|
      page.cancel_and_confirm
    end
  end
end
