import sqlalchemy
import pandas as pd
from random import randint, seed

"""
ToDo
1. Anaconda встроенный Python 3.8, в ОС Python 3.9
   Ошибка при установке psycopg2 для Python 3.8, пока без Jupiter Notebook
2. Экранирование ' (apostrov) при работе с RAW запросами
"""

seed(42)

db = 'postgresql://postgres:example@localhost:5432/music_db'
engine = sqlalchemy.create_engine(db)
connection = engine.connect()


# get https://www.kaggle.com/mrmorj/dataset-of-songs-in-spotify/version/1
df_track = pd.read_csv("genres_v2.csv", sep=',', dtype={"song_name": "object"})

# https://www.kaggle.com/revilrosa/music-label-dataset?select=albums.csv
df_albums = pd.read_csv("albums.csv", sep=',')
df_artists = pd.read_csv("artists.csv", sep=',')
df_artists.rename(columns={'id': 'artist_id'}, inplace=True)
df_merge = pd.merge(df_artists, df_albums, on=['artist_id'])
df_res = df_merge.drop_duplicates(subset=['real_name'], keep='last')

# https://www.kaggle.com/siropo/spotify-multigenre-playlists-data?select=rock_music_data.csv
df_rock_music = pd.read_csv("rock_music_data.csv", sep=',')


k = 0
for genre in df_res['genre'].unique():
    connection.execute(f"INSERT INTO Genre VALUES({k}, '{genre}');")
    k += 1

k = 0
for index, row in df_res.dropna().head(100).iterrows():
    connection.execute(f"INSERT INTO Authors VALUES({k}, '{row['art_name']}', '{row['real_name']}');")

    album = row['album_title'][:42].replace("'", "")
    connection.execute(f"INSERT INTO Albums VALUES({k}, '{album}', '{row['year_of_pub']}');")

    g = connection.execute(f"SELECT * FROM genre WHERE genre LIKE '{row['genre']}';").fetchall()
    connection.execute(f"INSERT INTO AuthorGenres VALUES({k}, '{g[0][0]}', '{k}');")

    al = connection.execute(f"SELECT * FROM albums WHERE album LIKE '{album}';").fetchall()
    connection.execute(f"INSERT INTO albumauthors VALUES({k}, '{k}', '{al[0][0]}');")
    k += 1

k = 0
for index, row in df_track.head(1000).iterrows():
    track = row['song_name'][:42].replace("'", "")
    connection.execute(f"INSERT INTO Tracks VALUES({k}, '{track}', '{k//10}', '{row['duration_ms']}');")
    k += 1

k = 0
t = 0
for playlist in df_rock_music['Playlist'].unique()[0:20]:
    connection.execute(f"INSERT INTO Collections VALUES({k}, '{playlist}', {randint(2015, 2020)});")
    for i in range(randint(15, 25)):
        r = connection.execute(f"SELECT track_id FROM tracks ORDER BY RANDOM() LIMIT 1;").fetchall()
        connection.execute(f"INSERT INTO trackcollections VALUES({t}, {k}, {r[0][0]});")
        t += 1
    k += 1
