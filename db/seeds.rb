require 'ffaker'

company = Company.create!(name: 'Test Company')

10.times do
  company.clients.create!(
    name: FFaker::Name.unique.name,
    email: FFaker::Internet.unique.email,
    birthdate: FFaker::Date.birthday(min_age: 18, max_age: 65),
    phone: FFaker::PhoneNumber.unique.short_phone_number,
    profession: FFaker::Lorem.sentence,
    social: '@'+FFaker::Internet.unique.domain_word
  )
end

company.professionals.create!(
  name: 'Professional',
  email: 'test@email.com',
  password: '123456',
  phone: FFaker::PhoneNumber.unique.short_phone_number
)