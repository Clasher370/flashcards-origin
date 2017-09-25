class ChangeReviewStepForCards < ActiveRecord::Migration[5.1]
  def change
    change_column :cards, :review_step, :integer, null: false, default: 0
  end
end
