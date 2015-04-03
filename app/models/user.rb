class User < ActiveRecord::Base
<<<<<<< HEAD
   validates_format_of :firstname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
 
=======

has_many :tests 

>>>>>>> 4574f83de676e2ff9aca7b1a3a92f48cd7e24ef0
end
