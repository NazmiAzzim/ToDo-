class TodoList < ApplicationRecord	
	belongs_to :correct_user
	has_many :todo_items, dependent: :destroy
	validates :title, presence: true, length: { minimum: 4 }
	validates :description, presence: true
end
