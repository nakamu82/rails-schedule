class Post < ApplicationRecord
  validates :title, :start_time, :end_time, presence: true
  validates :title, length: {maximum: 20}
  validates :content, length: {maximum: 500}
  validate :end_time_after_start_time
  def  end_time_after_start_time
    if end_time < start_time
      errors.add(:end_time,"は開始日以降の日付を入力してください")
    end
  end
end 
