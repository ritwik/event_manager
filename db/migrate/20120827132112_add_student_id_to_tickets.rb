class AddStudentIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :student_id, :string
    add_column :tickets, :faculty, :string
  end
end
