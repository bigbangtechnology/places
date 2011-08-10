require 'test_helper'

class InterestsControllerTest < ActionController::TestCase

  context "accessing the interests index view" do
    setup do
      get :index
    end
    
    should respond_with :success
  end
  
  context "accessing a specific interests view" do
    setup do
      interest = Factory(:interest)
      
      get :show, :id => interest.id
    end
    
    should respond_with :success
  end

end
