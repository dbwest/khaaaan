require 'sinatra'
require 'env.rb'


def khan_string  num
    s_string = "Kh#{'a' * num}n"
end

get '/khan' do
    khan_string 5
  "#{s_string}"

end

