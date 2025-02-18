import spotipy
from spotipy.oauth2 import SpotifyOAuth

sp = spotipy.Spotify(auth_manager=SpotifyOAuth(client_id="af3ac5362ce54d2ca7a38e95425c36e9",
                                               client_secret="3228b6613e294d158bced3660a6385a5",
                                               redirect_uri="www.google.com",
                                               scope="user-library-read"))

taylor_uri = 'spotify:artist:06HL4z0CvFAxyc27GXpf02'
results = sp.artist_albums(taylor_uri, album_type='album')
albums = results['items']

while results['next']:
    results = sp.next(results)
    albums.extend(results['items'])

for album in albums:
    print(album['name'])