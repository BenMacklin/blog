class Article < ApplicationRecord

  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: {in: VALID_STATUSES}

  def change
    create_table :articles do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end

  def archived?
    status == 'archived'
  end
end
