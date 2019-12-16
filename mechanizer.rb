require 'rubygems'
require 'mechanize'

agent = Mechanize.new # mechanize object
page = agent.get('file:///home/er/projects/mechanize/demo.html') # call the specific page using mechanize object

# print all the links present on the page
puts "********* Links **********\n\n"
page.links.each do |link|
  puts link
end
puts "\n**************************\n"
# to find specific link
contact_link = page.link_with(text: 'contact')

# to redirect to the link
puts "You redirected to contact link"
contact_page = contact_link.click

# to extract data from page
puts "****** Page content ******\n\n"
puts contact_page.at('span').text
puts "\n**************************\n"

# Form Operations
  # It'll give you the form
  form = page.form
  # To insert value in form field
  form['q'] = 'write anything'
  # To submit Form
  submit_form = form.submit

# You'll successfully redirect to Google
puts "*******Redirected URL*****\n\n"
puts submit_form.uri.to_s
puts "\n**************************\n"
