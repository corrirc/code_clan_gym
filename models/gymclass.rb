require_relative('../db/sql_runner')

class GymClass

  attr_reader :id
  attr_accessor :gymclass_name, :description, :instructor, :cost, :classtime

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @gymclass_name = options['gymclass_name']
    @description = options['description']
    @instructor = options['instructor']
    @cost = options['cost'].to_i
    @classtime = options['classtime']
  end

  def save()
    sql = "INSERT INTO gym_classes (gymclass_name, description, instructor, cost, classtime)
    VALUES($1, $2, $3, $4, $5) RETURNING id"
    values = [@gymclass_name, @description, @instructor, @cost, @classtime]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run(sql)
    return results.map {|gym_class| GymClass.new(gym_class)}
  end

  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return GymClass.new(results.first)
  end

  def update()
    sql = "UPDATE gym_classes SET(gymclass_name, description, instructor, cost, classtime)
     = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@gymclass_name, @description, @instructor, @cost, @classtime, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def members()
    sql = "SELECT * FROM gym_classes INNER JOIN bookings ON bookings.gym_class_id
    = gym_classes.id INNER JOIN members ON bookings.member_id = members.id WHERE
    gym_classes.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|member|Member.new(member)}
  end
end
