# README
Stack is: Rails 6, Ruby 2.6.2
1. Getting of data is extracted into ContentfulClientCreator service object which creates the client and tries to pull the data as per the object created in recipes_controller
2. In Recipes controller there is set_space private method because we can maybe have other spaces for other entities
3. I have created model Recipe to easier manage cases when the data of entity is not complete
4. I have created a decorator (using Draper gem) to present the data in the view because normally I try to keep controllers and models as thin as possible
5. There are some tests in the /spec directory (you can run them with rspec)
