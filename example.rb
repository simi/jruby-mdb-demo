require 'java'
require 'lock_jar'
require 'set'

LockJar.load

class AccessDatabase
  include_package "com.healthmarketscience.jackcess"
  attr_accessor :file

  def initialize(file)
    self.file = file
  end

  def names
    SortedSet.new(database.getTableNames).to_a
  end

  private

  def database
    @database ||= DatabaseBuilder.open(java.io.File.new(self.file))
  end
end

db = AccessDatabase.new('example.mdb')
p db.names

