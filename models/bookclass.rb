require_relative('../db/sql_runner')

class BookClass

    attr_reader :id, :member_id, :gym_class_id

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @member_id = options['member_id'].to_i
      @gym_class_id = options['gym_class_id'].to_i
    end

    def save()
      sql = "INSERT INTO bookings(member_id, gym_class_id) VALUES ($1, $2) RETURNING id"
      values = [@member_id, @gym_class_id]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM bookings"
      results = SqlRunner.run(sql)
      return result.map{|booking|BookClass.new(booking)}
    end

    def self.delete_all()
      sql = "DELETE FROM bookings"
      SqlRunner.run(sql)
    end

    def self.delete(id)
      sql = "DELETE FROM bookings WHERE id = $1"
      values = [id]
      SqlRunner.run(sql, values)
    end

    def member()
      sql = "SELECT * FROM members WHERE id = $1"
      values = [@member_id]
      results = SqlRunner.run(sql, values)
      return Member.new(results.first)
    end

    def gym_class()
      sql = "SELECT * FROM gym_classes WHERE id = $1"
      values = [@gym_class_id]
      results = SqlRunner.run(sql, values)
      return GymClass.new(results.first)
    end

end
