class BucketController < ApplicationController
  def show
    
    @bucket.contents
  end
end
