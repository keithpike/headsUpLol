class User < ActiveRecord::Base
  attr_reader :password
  before_validation :ensure_session_token
  validates :email, :password_digest, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true, on: [:create]

  validates :password, length: {minimum: 4, allow_blank: true}

  has_many(
    :blogs,
    foreign_key: :owner_id
  )
  has_many(
    :posts,
    through: :blogs,
    source: :posts
  )

  def primary_blog
    self.blogs.each do |blog|
      return blog if blog.primary
    end
  end

  def selected_blog
    @selected_blog ||= self.primary_blog
  end

  def selected_blog=(blog)
    @selected_blog = blog
  end

  def generate_token
    SecureRandom::urlsafe_base64(32)
  end

  def self.find_by_credentials(username, pt_password)
    user = User.find_by_username(username)
    return nil unless user.try(:is_password?, pt_password)
    user
  end

  def reset_session_token!
    self.session_token = generate_token
    self.save!
    self.session_token
  end

  def password=(pt_password)
    @password = pt_password
    self.password_digest = BCrypt::Password.create(pt_password)
  end

  def is_password?(pt_password)
    BCrypt::Password.new(self.password_digest) == pt_password
  end

  private

  def ensure_session_token
    self.session_token ||= generate_token
  end

end
