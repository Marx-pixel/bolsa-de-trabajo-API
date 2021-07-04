class CreatePostulations < ActiveRecord::Migration[6.1]
  def change
    create_table :postulations do |t|
      t.belongs_to :job_offer
      t.belongs_to :candidate
      t.string :status
      t.string :candidate_name
      t.string :job_name

      t.timestamps
    end
  end
end
