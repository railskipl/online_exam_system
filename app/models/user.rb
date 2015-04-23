class User < ActiveRecord::Base

   # validates_format_of :firstname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/  

    validates_format_of :lastname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
    
 belongs_to :exam

#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

#  validates :firstname, :lastname,
#              presence: true,

# #              #validates_length_of :user_name, :in => 6..12 , :message => " must be 6 to 12 characters"
# #              length: { maximum: 12 }
# #             #:length => { :maximum => 12 }
# #             #uniqueness: true,
# #             format: {
# #               with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ ,
# #               message: "must be formatted correctly"
# #             }

# # # validates     {:case_sensitive => false, message:  "Email already exists!"}        \A([^@\s]+)@((?:[-a-z]+\.)+[a-z]{2,})\z

  validates :email, 
            presence:  true, 
            format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z-]+\.[A-Za-z]+\z/ , message: "Enter a valid Email address !"} ,
            uniqueness: true 

  validates :contact , numericality: true



  validates :exam_id , :presence => {:message => "Select any exam before submitting" }

 

end
