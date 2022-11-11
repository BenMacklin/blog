class Article < ApplicationRecord
  include Visible
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def change
    create_table :articles do |t|
      t.string :title
      t.string :body

      t.timestamps.time_zone
      t.string :status

    end
  end
end
