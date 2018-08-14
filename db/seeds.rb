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
 'membership' => 'Basic'
})
member1.save()

member2 = Member.new({
 'first_name' => 'Cristiano',
 'last_name' => 'Ronaldo',
 'membership' => 'Basic'
})
member2.save()

member3 = Member.new({
 'first_name' => 'Lionel',
 'last_name' => 'Messi',
 'membership' => 'Basic'
})
member3.save()

gymclass1 = GymClass.new({
  'gym_class_name' => 'MMA',
  'description' => 'Using techniques from different types of martial arts. Class members will get to practice grappling, striking and many other techniques.',
  'instuctor' => 'Rhonda Rousey',
  'cost' => '5',
  'classtime' => '60'
})
gymclass1.save()

gymclass2 = GymClass.new({
  'gym_class_name' => 'BodyWeightTraining',
  'description' => 'The old way of training. Pushups, pullups, crunches and many more. Will help target and strengthn all areas of the body',
  'instuctor' => 'Jimmy Abs',
  'cost' => '10',
  'classtime' => '45'
})
gymclass2.save()

gymclass3 = GymClass.new({
  'gym_class_name' => 'Yoga',
  'description' => 'Great for injury prevention and core strength. Yoga will keep you physically and mentally in shape.',
  'instuctor' => 'Belinda Bends',
  'cost' => '7',
  'classtime' => '60'
})
gymclass3.save()

gymclass4 = GymClass.new({
  'gym_class_name' => 'Spinning',
  'description' => 'Get you heart racing with this cardio session to get your body burning calories',
  'instuctor' => 'Lance Armstong',
  'cost' => '6',
  'classtime' => '45'
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
