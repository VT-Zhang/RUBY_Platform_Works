
*************************************
# Gemfile:
gem 'bcrypt', '~> 3.1.7'
gem 'hirb'
gem 'rails-footnotes', '~> 4.0'

*************************************
# install gems
rails generate rails_footnotes:install


*************************************
# authenticity_token:
<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">

# patch / delete hidden method:
<input type="hidden" name="_method" value="patch" />
<input type="hidden" name="_method" value="delete" />
#textarea
<textarea name="content" rows="6" cols="50">Add Your Comments Here...</textarea>
*************************************
# application_controller:

def current_user
     @current_user ||= User.find_by_id(session[:user_id])
end

helper_method :current_user
*************************************
#error message:
# in the function:
flash[:errors] = user.errors.full_messages

# in the html:
    <% if flash[:errors] %>
        <% flash[:errors].each do |e| %>
            <p class="red"><%= e %></p>
        <% end %>
    <% end %>
    <% if flash[:notices] %>
        <% flash[:notices].each do |n| %>
            <p class="green"><%= n %></p>
        <% end %>
    <% end %>
# in the header:
<style>
   .red{
       color:red;
   }
   .green{
       color:green;
   }
</style>
**************************************
# a link for delete method
<a href="/events/<%=event.id%>/show" data-method="get">

**************************************
#model validation
  has_secure_password
  has_many :events
  has_many :participations, dependent: :destroy
  has_many :events_participated, through: :participations, source: :event
  has_many :comments, dependent: :destroy
  has_many :events_commented, through: :comments, source: :event

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :location, :state, presence:true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: true
  before_create :password, :password_confirmation, length: {minimum: 8}, presence:true

  validate :date_only_in_the_future

    def date_only_in_the_future
      if date < Date.today
        errors.add(:date, "must be in the future.")
      end
    end
***************************************
#log in authentication
def create
      if user = User.find_by(email: params[:email])
          if user.try(:authenticate, params[:password]) == false
              flash[:errors] = ["Invalid Password/Email Combination, Please try again."]
              redirect_to "/"
          else
              session[:user_id] = user.id
              session[:name] = user.first_name
              redirect_to "/events"
          end
      else
          flash[:errors] = ["The user does not exist, please register."]
          redirect_to "/"
      end
end
*****************************************
# PASSWORD_REGEX

Minimum 8 characters at least 1 Alphabet and 1 Number:

"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:

"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet and 1 Number:

"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
Minimum 8 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:

"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}"
Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character:

"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,10}"

*****************************************
