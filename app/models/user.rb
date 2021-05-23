class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: {maximum: 80}
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  before_save { self.email = email.downcase }

  has_one :video

  def self.search(search)
      if search
          #   find(:all, :conditions => ['nome LIKE ?', "%#{search}%"])
          self.where("name like ?", "%#{search}%")
          # events = self.where('name LIKE ? OR place LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")

      else
          self.find(:all)
      end
  end

  def self.search_by(search)
      if search
        self.find_by(name: search)
      else
        find(:all)
      end
  end

end
