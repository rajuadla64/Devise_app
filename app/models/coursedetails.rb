class Coursedetails < ActiveRecord::Base
  #paginates_per 1
  attr_accessible :coursename, :exp, :paytype, :price, :rating, :trainingtype, :tutor, :gender

  searchable do
    text :coursename
    text :exp
    text :paytype
    text :trainingtype
    text :tutor
    text :gender


end

  end