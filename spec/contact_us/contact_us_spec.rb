describe 'Contact us page' do
  context 'With working contact us page' do
    it 'Exists' do
      visit ContactUsPage do |page|
        expect(page.smoke_test(@browser.url)).not_to eq(['404 Not Found'])
      end
    end
  end
end
