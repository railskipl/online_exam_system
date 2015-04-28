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

  validates :contact , numericality: true , format: { with: /[0-9]\d{11}/, :message => "Atleast 12 digit required" } 
         
              #:length => { :is => 10 }
 #                              # length: { minimum:  12  , maximum:  12 ,  :message => " must be 12 characters"}  #, length: { maximum: 12 , :message => " must be 12 characters"} ,
 #                                          # length: { minimum: 12  ,:message => " must be 12 characters"}   
 #                                         # length:  { minimum:  12 , maximum: 12 }
 #                                         # :length => { :maximum => 1000,
 #                                            format: { 
 #                                         	with:  /\A(\+1)?[0-9]{11}\z/ , 
 #                                         	message:  "Not a valid 10-digit telephone number" 
                                                           # }

#validates_format_of :contact, :with => /[0-9]{9}/ 

 validates :exam_id , :presence => {:message => "Select any exam before submitting" }

end
# validates_length_of :number, is: 10,  message: "Number must be 10 digit long"  