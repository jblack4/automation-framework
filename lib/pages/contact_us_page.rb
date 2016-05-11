class ContactUsPage
  include PageObject

  page_url 'http://ec2-54-191-181-182.us-west-2.compute.amazonaws.com/contact_us'

  def smoke_test(url)
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    res.to_hash['status']
  end
end
