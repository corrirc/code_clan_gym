require_relative('../db/sql_runner')
# require('pry')
class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :membership_type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @membership_type = options['membership_type']
  end

  def save()
    sql = "INSERT INTO members(first_name, last_name, membership_type)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@first_name, @last_name, @membership_type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results.map{|member| Member.new(member)}
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    member = SqlRunner.run(sql, values)
    results = Member.new(member.first)
    return results
  end

  def update()
    sql = "UPDATE members SET(first_name, last_name, membership_type) = ($1, $2, $3) WHERE id = $4"
    values = [@first_name, @last_name, @membership_type, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM members WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def booked_classes()
    sql = "SELECT members.* FROM members INNER JOIN bookings ON bookings.member_id
    = members.id INNER JOIN gym_classes ON bookins.gym_class_id = gym_classes.id
    WHERE members.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |gym_class|GymClass.new(gym_class)}
  end

end

# binding.pry
# nil
