require_relative 'environment'

class SQLRunner
  def initialize(db)
    @db = db
  end

  def execute_create
    sql = File.read('lib/create.sql')
    @db.execute_batch(sql)
  end

  def execute_seed
    sql = File.read('lib/seed.sql')
    @db.execute_batch(sql)
  end
end
