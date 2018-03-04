class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  enum role: {ADMIN: 'ADMIN', VISITOR: 'VISITOR', CUSTOMER: 'CUSTOMER'}

  before_create :initialize_role

  private

  def initialize_role
    self.role = User.roles['VISITOR']
  end

end
