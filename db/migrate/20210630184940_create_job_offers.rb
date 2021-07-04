class CreateJobOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :job_offers do |t|
      t.belongs_to :company
      
      t.string :name
      t.text :description
      t.string :status
      t.string :company_name


      t.timestamps
    end
  end
end
