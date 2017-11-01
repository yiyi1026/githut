# json.extract! @user, :email, :id, :username
json.partial! "api/users/user", user: @user