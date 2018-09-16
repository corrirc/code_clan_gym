require("pry-byebug")

require_relative('../models/members')
require_relative('../models/gymclass')
require_relative('../models/bookclass')

Member.delete_all()
BookClass.delete_all()
GymClass.delete_all()

member1 = Member.new({
 'first_name' => 'Ricky',
 'last_name' => 'Corrigan',
 'membership_type' => 'Basic'
})
member1.save()

member2 = Member.new({
 'first_name' => 'Cristiano',
 'last_name' => 'Ronaldo',
 'membership_type' => 'Basic'
})
member2.save()

member3 = Member.new({
 'first_name' => 'Lionel',
 'last_name' => 'Messi',
 'membership_type' => 'Basic'
})
member3.save()

member4 = Member.new({
 'first_name' => 'Gareth',
 'last_name' => 'Bale',
 'membership_type' => 'Premium'
})
member4.save()

gymclass1 = GymClass.new({
  'gymclass_name' => 'MMA',
  'description' => 'Using techniques from different martial arts',
  'instructor' => 'Rhonda Rousey',
  'cost' => '5',
  'classtime' => '09:00:00'
})
gymclass1.save()

gymclass2 = GymClass.new({
  'gymclass_name' => 'BodyWeightTraining',
  'description' => 'Pushups, pullups, crunches and much more.',
  'instructor' => 'Jimmy Abs',
  'cost' => '10',
  'classtime' => '11:00:00'
})
gymclass2.save()

gymclass3 = GymClass.new({
  'gymclass_name' => 'Yoga',
  'description' => 'Helps prevent injury and improves mental health',
  'instructor' => 'Some Hot Women',
  'cost' => '7',
  'classtime' => '13:00:00'
})
gymclass3.save()

gymclass4 = GymClass.new({
  'gymclass_name' => 'Spinning',
  'description' => 'Intense workout to burn calories',
  'instructor' => 'Lance Armstong',
  'cost' => '6',
  'classtime' => '15:00:00'
})
gymclass4.save()

booking1 = BookClass.new({
  'member_id' => member1.id,
  'gym_class_id' => gymclass4.id
})
booking1.save()

booking2 = BookClass.new({
  'member_id' => member2.id,
  'gym_class_id' => gymclass3.id
})
booking2.save()

booking3 = BookClass.new({
  'member_id' => member3.id,
  'gym_class_id' => gymclass1.id
})
booking3.save()

booking4 = BookClass.new({
  'member_id' => member2.id,
  'gym_class_id' => gymclass2.id
})
booking4.save()

binding.pry
nil
