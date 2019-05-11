# refactor 1 for quiz

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

mailing_campaign_leads.each do |lead|
  names = lead[:name].split
  lead[:name] = names.map { |name| name.capitalize }.join(' ')
end

usable_leads = mailing_campaign_leads.select do |lead|
  lead[:days_since_login] < 60 && lead[:mailing_list]
end

puts mailing_campaign_leads
puts
puts usable_leads