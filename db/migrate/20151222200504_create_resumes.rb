class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :surname
      t.string :college
      t.integer :year
      t.string :course
      t.string :email
      t.string :keywords
      t.string :attachment
      t.string :member

      t.timestamps null: false
    end
  end
end
