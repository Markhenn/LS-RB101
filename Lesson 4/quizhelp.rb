# Help for quiz

mailing_campaign_leads = [
  {
    name: 'Emma Lopez',
    email: 'emma.lopez@some_mail.com',
    days_since_login: 423,
    mailing_list: true
  },
  {
    name: 'mike richards',
    email: 'michael.richards@some_mail.com',
    days_since_login: 23,
    mailing_list: false
  },
  {
    name: 'JANE WILLIAMS',
    email: 'jane_w95@my_mail.com',
    days_since_login: 16,
    mailing_list: true
  },
  {
    name: 'Ash Patel',
    email: 'ash_patel@my_mail.com',
    days_since_login: 22,
    mailing_list: true
  }
]
# Legacy code:

counter = 0

# The loop capitalizes names in a hash in an array

loop do # loops over every hash in array
  break if counter == mailing_campaign_leads.size # end of array break

  full_name = mailing_campaign_leads[counter][:name]
  names = full_name.split # array with first and last name and extra names

  names_counter = 0
  loop do # loops over all names in name array to capitalize all names
    break if names_counter == names.size # breaks at the end of names

    name = names[names_counter]
    names[names_counter] = name.capitalize # capitalizes this part of the name

    names_counter += 1
  end

  capitalized_full_name = names.join(' ') # Turns name into string
  mailing_campaign_leads[counter][:name] = capitalized_full_name # readd name to hash in array

  counter += 1
end

usable_leads = []
counter = 0

# This loops picks leads based on subscription and last login time

loop do
  break if counter == mailing_campaign_leads.size 

  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter] # add the hash to the array
  end

  counter += 1
end

p usable_leads
puts
p mailing_campaign_leads

numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []
number = 0

until number == numbers.size
  odd_numbers << numbers[number] if number.to_i.odd?

  number += 1
end

p odd_numbers

def star_method(stars)
  for star in stars
    star.downcase
  end
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

p stars_2
