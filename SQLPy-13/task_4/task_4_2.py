import sqlalchemy

"""
    название и год выхода альбомов, вышедших в 2018 году;
    название и продолжительность самого длительного трека;
    название треков, продолжительность которых не менее 3,5 минуты;
    названия сборников, вышедших в период с 2018 по 2020 год включительно;
    исполнители, чье имя состоит из 1 слова;
    название треков, которые содержат слово "мой"/"my".
"""


db = 'postgresql://postgres:example@localhost:5432/music_db'
engine = sqlalchemy.create_engine(db)
connection = engine.connect()

t1 = connection.execute(f"SELECT album, album_year FROM Albums WHERE album_year = 2018;").fetchall()
print(t1)

t2 = connection.execute(f"SELECT track, duration FROM Tracks WHERE duration = (SELECT MAX (duration) FROM Tracks);").fetchall()
print(t2)

t3 = connection.execute(f"SELECT track FROM Tracks WHERE duration > 60 * 1000 * 3.5;").fetchall()
print(t3)

t4 = connection.execute(f"SELECT collection FROM Collections WHERE album_year BETWEEN 2018 AND 2020;").fetchall()
print(t4)

t5 = connection.execute(f"SELECT author FROM Authors WHERE author NOT LIKE '%% %%';").fetchall()
print(t5)

t6 = connection.execute(f"SELECT track FROM Tracks WHERE track LIKE '%%my%%' OR track LIKE '%%мой%%' ;").fetchall()
print(t6)
