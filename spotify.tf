terraform {
  required_providers {
    spotify = {
      source = "conradludgate/spotify"
      version = "0.2.7"
    }
  }
}

provider "spotify" {
  api_key = var.apikey
}

data "spotify_search_track" "telugu" {
  artist = "Anirudh Ravichander"
}

resource "spotify_playlist" "anirudh"{
  name = "telugu anirudh"
  tracks = [data.spotify_search_track.telugu.tracks[0].id, data.spotify_search_track.telugu.tracks[1].id]
}
