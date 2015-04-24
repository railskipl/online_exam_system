class User < ActiveRecord::Base

belongs_to :exam
validates :firstname, :lastname,
              presence: true,
 length: { maximum: 50  ,:message => " must be 6 to 12 characters"},
                 
             format: {
               with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ ,
               message: "must be formatted correctly"
             }


# # # validates     {:case_sensitive => false, message:  "Email already exists!"}        \A([^@\s]+)@((?:[-a-z]+\.)+[a-z]{2,})\z

  validates :email, 
            presence:  true, 
            format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z-]+\.[A-Za-z]+\z/ , message: "Enter a valid Email address !"} ,
            uniqueness: true 

 validates :contact , numericality: true , length: { maximum: 12  ,:message => " must be less than 12 characters"}
 validates :exam_id , :presence => {:message => "Select any exam before submitting" }

 

end
