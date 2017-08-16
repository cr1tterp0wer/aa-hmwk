require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
   plays =  PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title=?
    SQL
   Play.new(plays) if plays.length > 0
  end
  
  def self.find_by_playwright(name)
    PlayDBConnection.instance.execute(<<-SQL, @playwright_id)
      SELECT
        *
      FROM
        plays
      JOIN playwrights
      ON playwright_id = playwrights.id
      WHERE
       playwright_id=?
    SQL

  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
  def get_plays
    raise "No Playright" if @playright.nil?

   PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
     SELECT
       *
     FROM
       plays
   SQL

  end
end


class Playwright

  def self.all
     data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
     data.map { |datum| Play.new(datum) }
  end
  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL,name)
      SELECT
        *
      FROM
        playwright
      WHERE
        name=?
    SQL
    return Play.new(playwright) if playwright.length>0
  end
  def initialize(options)
    @id = nil
    @name = options['name']
    @birth_year = options['birth_year']
  end
  def create
    raise "invalid id" unless @id.nil?
    raise "already in db" if dupes?

    PlayDBConnection.instance.execute(<<-SQL,@name,@birth_year)
    INSERT INTO
      playwrights(name,birth_year)
    VALUES( ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  private 
  def dupes?
    dupes = PlayDBConnection.instance.execute(<<-SQL,@name,@birth_year)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ? AND birth_year = ?
    SQL
    !dupes.empty?
  end

end


