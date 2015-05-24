class ArtistsController < ApplicationController
require 'rspotify'

  def index
  end

  def show
  end

  def results
    @artist_1 = params["artist_1"]
    @artist_2 = params["artist_2"]

    # require 'pry'
    # binding.pry

    @artist_1_summary = RSpotify::Artist.search(@artist_1)
    @artist_2_summary = RSpotify::Artist.search(@artist_2)

    @artist_1_followers = @artist_1_summary[0].followers["total"]
    @artist_2_followers = @artist_2_summary[0].followers["total"]

    # @clean_1 = Artist.separate_comma(@artist_1_followers)


  #   @___ = access your business logic (aka model)
  # ^^^store that in an instance variable
  end

end
