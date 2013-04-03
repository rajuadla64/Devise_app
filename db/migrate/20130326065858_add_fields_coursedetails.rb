class AddFieldsCoursedetails < ActiveRecord::Migration
  def change
    add_column :coursedetails,:gender,:string
  end
end
