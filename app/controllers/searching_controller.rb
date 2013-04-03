class SearchingController < ApplicationController
  layout "searching"

  def searching
    @search = Coursedetails.search do
      fulltext params[:search]
      paginate(:page=>params[:page],:per_page=>3)


    end
    @courses = @search.results
  end
  def tutoring
    @courses=Coursedetails.where("trainingtype=?","tutoring").page(params[:page]).per(2)

  end
  def online
    @courses=Coursedetails.where("trainingtype=?","online").page(params[:page]).per(2)

  end
def all

  if ((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=?",params[:course_name]).page(params[:page]).per(2)
  end
   if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]=="")&&(params[:rating1]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and rating between ? and ?",params[:course_name],params[:rating1],'5').page(params[:page]).per(2)
       end
   if((params[:course_name]!="")  &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and rating between ? and ?",params[:course_name],'1',params[:rating2]).page(params[:page]).per(2)
       end
   if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and rating between ? and ?",params[:course_name],params[:rating1],params[:rating2]).page(params[:page]).per(2)
   end
  if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]=="")&&(params[:rating1]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and paytype=? and rating between ? and ?",params[:course_name],params[:paytype],params[:rating1],'5').page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and paytype=? and rating between ? and ?",params[:course_name],params[:paytype],'1',params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and paytype=? and rating between ? and ?",params[:course_name],params[:paytype],params[:rating1],params[:rating2]).page(params[:page]).per(2)
  end
  if ((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and paytype=?",params[:course_name],params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("paytype=?",params[:paytype]).page(params[:page]).per(2)
  end
  if((params[:course_name]=="")&&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]=="")&&(params[:rating1]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("rating between ? and ?",params[:rating1],'5').page(params[:page]).per(2)
  end
  if((params[:course_name]=="")&&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("rating between ? and ?",'1',params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]=="")&&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("rating between ? and ?",params[:rating1],params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]=="")&&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]=="")&&(params[:rating1]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("rating between ? and ? and paytype=?",params[:rating1],'5',params[:paytype]).page(params[:page]).per(2)
  end
  if((params[:course_name]=="")&&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("rating between ? and ? and paytype=?",'1',params[:rating2],params[:paytype]).page(params[:page]).per(2)
  end
  if((params[:course_name]=="")&&(params[:gender_male]=="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("rating between ? and ? and paytype=?",params[:rating1],params[:rating2],params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("gender=?","male").page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("gender=?","female").page(params[:page]).per(2)
  end
  if ((params[:course_name]!="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and gender=?",params[:course_name],"male").page(params[:page]).per(2)
  end
  if ((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and gender=?",params[:course_name],"female").page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]!="")&&(params[:rating2]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("gender=? and rating between ? and ?","male",params[:rating1],'5').page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("gender=? and rating between ? and ?","male",'1',params[:rating2]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]!="")&&(params[:rating2]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("gender=? and rating between ? and ?","male",params[:rating1],params[:rating2]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]!="")&&(params[:rating2]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("gender=? and rating between ? and ?","female",params[:rating1],'5').page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]=="")&&(params[:rating2]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("gender=? and rating between ? and ?","female",'1',params[:rating2]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]!="")&&(params[:rating2]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("gender=? and rating between ? and ?","female",params[:rating1],params[:rating2]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("paytype=? and gender=?",params[:paytype],"male").page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("paytype=? and gender=?",params[:paytype],"female").page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating2]=="")&&(params[:rating1]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and gender=? and paytype=? and rating between ? and ?",params[:course_name],"male",params[:paytype],params[:rating1],'5').page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and gender=? and paytype=? and rating between ? and ?",params[:course_name],"male",params[:paytype],'1',params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and gender=? and paytype=? and rating between ? and ?",params[:course_name],"male",params[:paytype],params[:rating1],params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating2]=="")&&(params[:rating1]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and gender=? and paytype=? and rating between ? and ?",params[:course_name],"female",params[:paytype],params[:rating1],'5').page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating2]!="")&&(params[:rating1]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and gender=? and paytype=? and rating between ? and ?",params[:course_name],"female",params[:paytype],'1',params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating2]!="")&&(params[:rating1]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and gender=? and paytype=? and rating between ? and ?",params[:course_name],"female",params[:paytype],params[:rating1],params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating2]=="")&&(params[:rating1]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and gender=? and rating between ? and ?",params[:course_name],"male",params[:rating1],'5').page(params[:page]).per(2)
  end
  if((params[:course_name]!="")  &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and gender=? and rating between ? and ?",params[:course_name],"male",'1',params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating2]!="")&&(params[:rating1]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and gender=? and rating between ? and ?",params[:course_name],"male",params[:rating1],params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating2]=="")&&(params[:rating1]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and gender=? and rating between ? and ?",params[:course_name],"female",params[:rating1],'5').page(params[:page]).per(2)
  end
  if((params[:course_name]!="")  &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating2]!="")&&(params[:rating1]=="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and gender=? and rating between ? and ?",params[:course_name],"female",'1',params[:rating2]).page(params[:page]).per(2)
  end
  if((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating2]!="")&&(params[:rating1]!="")&&(params[:paytype]==""))
    @courses=Coursedetails.where("coursename=? and gender=? and rating between ? and ?",params[:course_name],"female",params[:rating1],params[:rating2]).page(params[:page]).per(2)
  end
  if ((params[:course_name]!="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and gender=? and paytype=?",params[:course_name],"male",params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]!="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]=="")&&(params[:rating2]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("coursename=? and gender=? and paytype=?",params[:course_name],"female",params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]!="")&&(params[:rating2]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("gender=? and rating between ? and ? and paytype=?","male",params[:rating1],'5',params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]=="")&&(params[:rating2]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("gender=? and rating between ? and ? and paytype=?","male",'1',params[:rating2],params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]!="false")&&(params[:gender_female]=="false")&&(params[:rating1]!="")&&(params[:rating2]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("gender=? and rating between ? and ? and paytype=?","male",params[:rating1],params[:rating2],params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]!="")&&(params[:rating2]=="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("gender=? and rating between ? and ? and paytype=?","female",params[:rating1],'5',params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]=="")&&(params[:rating2]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("gender=? and rating between ? and ? and paytype=?","female",'1',params[:rating2],params[:paytype]).page(params[:page]).per(2)
  end
  if ((params[:course_name]=="") &&(params[:gender_male]=="false")&&(params[:gender_female]!="false")&&(params[:rating1]!="")&&(params[:rating2]!="")&&(params[:paytype]!=""))
    @courses=Coursedetails.where("gender=? and rating between ? and ? and paytype=?","female",params[:rating1],params[:rating2],params[:paytype]).page(params[:page]).per(2)
  end
  end

  end


