2.times do |i|
  Admin.create!(
    email: "hr_#{i+1}@example.com",
    password: '12345678',
    first_name: 'Ivan',
    last_name: 'Ivanov'
  )
  5.times do |j|
    Employee.create!(
      email: "employee_#{j+1}_by_hr_#{i+1}@example.com",
      password: '12345678',
      first_name: 'Vasya',
      last_name: 'Vasilyev'
    )
  end
end