class ArtistsController < ApplicationController
require 'rspotify'

  def index
  end

  def example
  end

  def results
    # Saves artist name AKA "Hardwell" to be called later in the results page
    @artist_1 = params["artist_1"]
    @artist_2 = params["artist_2"]

    # Saves all results for artist AKA "Hardwell" and all associated artists
    # under the same name
    @artist_1_summary = RSpotify::Artist.search(@artist_1)
    @artist_2_summary = RSpotify::Artist.search(@artist_2)

    # 1) Calls first search result for artist AKA "Hardwell" + first result for the artist
    # 2) Calls followers method to return total number of followers
    # 3) Saves the number of followers for the first return of the artist.
    @artist_1_followers = @artist_1_summary[0].followers["total"]
    @artist_2_followers = @artist_2_summary[0].followers["total"]

    @artist_1_pic = @artist_1_summary[0].images[0]["url"]
    @artist_2_pic = @artist_2_summary[0].images[0]["url"]

    # Calls the method created under the artist model to separate the number of
    # followers with a comma to read the number of followers easier
    @clean_1_number = Artist.separate_comma(@artist_1_followers)
    @clean_2_number = Artist.separate_comma(@artist_2_followers)

  end

end
