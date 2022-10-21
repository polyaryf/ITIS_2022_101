//
//  Playlist.swift
//  CatalogHW
//
//  Created by Полина Рыфтина on 19.10.2022.
//

struct Song {
    let songTitle: String
    let author: String
    let duration: Double
}

struct Playlist {
    let playlistTitle: String
    let numberOfTracks: Int
    let totalDuration: Double
    let isDownloaded: Bool
    let allSongs: [Song]
    
    public static func randomPlaylist() -> Playlist {
        let randomSongs = randomSongs(countOfSongs: Int.random(in: 3...9))
        let randomPlaylist = Playlist(
            playlistTitle: randomPlaylistTitle(),
            numberOfTracks: randomSongs.count,
            totalDuration: totalDuration(songs: randomSongs),
            isDownloaded: Bool.random(),
            allSongs: randomSongs)
        return randomPlaylist
    }
    
    private static func totalDuration(songs: [Song]) -> Double {
        var totalDuration: Double = 0
        for song in songs {
            totalDuration += song.duration
        }
        totalDuration = round(totalDuration * 100)/100
        return totalDuration
    }
    
    public static func randomSong() -> Song {
        [
            Song(songTitle: "Protein", author: "Jeshi, Obongjayar", duration: 2.53),
            Song(songTitle: "Tainted Love", author: "Milky Chance", duration: 2.57),
            Song(songTitle: "Notion", author: "The Rare Occasions", duration: 3.15),
            Song(songTitle: "I don’t let go", author: "XXXTentacion", duration: 2.01),
            Song(songTitle: "The Beach", author: "The Neighbourhood", duration: 4.19),
            Song(songTitle: "Жить как я живу", author: "Скриптонит", duration: 3.33),
            Song(songTitle: "Congratulations", author: "Post Malone, Quavo", duration: 3.45),
            Song(songTitle: "Думай позитивно", author: "Кровосток", duration: 3.36),
            Song(songTitle: "Как тебя покорить", author: "Перемотка", duration: 3.33),
            Song(songTitle: "что для тебя красота", author: "масло черного тмина", duration: 1.55)
        ]
        .randomElement() ?? Song(songTitle: "", author: "", duration: 0)
    }
    
    public static func randomSongs(countOfSongs: Int) -> [Song] {
        var randomSongs: [Song] = []
        for _ in 0...countOfSongs {
            randomSongs.append(randomSong())
        }
        return randomSongs
    }
    
    private static func randomPlaylistTitle() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzUVWXYZ0 "
        return String(
            (0 ..< 8).map { _ in
                letters.randomElement() ?? " " }
        )
    }
}

