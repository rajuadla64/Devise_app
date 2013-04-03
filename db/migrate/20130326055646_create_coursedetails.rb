class CreateCoursedetails < ActiveRecord::Migration
  def change
    create_table :coursedetails do |t|
      t.string :coursename
      t.string :trainingtype
      t.string :tutor
      t.string :rating
      t.string :paytype
      t.decimal :price
      t.string :exp

      t.timestamps
    end
  end
end
