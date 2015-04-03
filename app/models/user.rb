class User < ActiveRecord::Base
   validates_format_of :firstname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
 
end
