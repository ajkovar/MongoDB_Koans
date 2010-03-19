require 'rubygems'
require 'mongo'
require 'edgecase'

class AboutDBConnect < EdgeCase::Koan
  include Mongo
  
  def setup
    @mongo = Connection.new
    @db = @mongo.db('hack0318')
  end
  
  def teardown
    @db.collections.each do |collection|
      @db.drop_collection(collection.name)
    end
  end
  
  def test_connection
    assert @mongo, "MongoDB is not connected"
    assert_instance_of Mongo::Connection, @mongo
  end
  
  def test_database_exist
    assert @db, "DB not available"
    assert_instance_of DB, @db
  end

end
