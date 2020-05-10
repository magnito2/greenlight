class School < ApplicationRecord

  before_create :setup

  has_many :users
  has_many :rooms

  private

  # Generates a uid for the room.
  def setup
    self.uid = random_room_uid
  end

  # Generates a three character uid chunk.
  def uid_chunk
    charset = ("a".."z").to_a - %w(b i l o s) + ("2".."9").to_a - %w(5 8)
    (0...3).map { charset.to_a[rand(charset.size)] }.join
  end

  # Generates a random room uid that uses the users name.
  def random_room_uid
    ["school", uid_chunk].join('-').downcase
  end

end
