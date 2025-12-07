"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getSampleSports = getSampleSports;
const players = {
    lebron: player('p-bball-1', 'LeBron James', 'Los Angeles Lakers', 'SF'),
    tatum: player('p-bball-2', 'Jayson Tatum', 'Boston Celtics', 'SF'),
    davis: player('p-bball-3', 'Anthony Davis', 'Los Angeles Lakers', 'C'),
    jokic: player('p-bball-4', 'Nikola Jokic', 'Denver Nuggets', 'C'),
    murray: player('p-bball-5', 'Jamal Murray', 'Denver Nuggets', 'PG'),
    butler: player('p-bball-6', 'Jimmy Butler', 'Miami Heat', 'SF'),
    musa: player('p-bball-7', 'Dzanan Musa', 'Real Madrid', 'SG'),
    laprovittola: player('p-bball-8', 'Nicolas Laprovittola', 'FC Barcelona', 'PG'),
    deck: player('p-bball-9', 'Gabriel Deck', 'Real Madrid', 'SF'),
    saka: player('p-foot-1', 'Bukayo Saka', 'Arsenal', 'RW'),
    salah: player('p-foot-2', 'Mohamed Salah', 'Liverpool', 'RW'),
    vvd: player('p-foot-3', 'Virgil van Dijk', 'Liverpool', 'CB'),
    haaland: player('p-foot-4', 'Erling Haaland', 'Manchester City', 'ST'),
    kdb: player('p-foot-5', 'Kevin De Bruyne', 'Manchester City', 'CM'),
    palmer: player('p-foot-6', 'Cole Palmer', 'Chelsea', 'RW'),
    kane: player('p-foot-7', 'Harry Kane', 'Bayern Munich', 'ST'),
    martinez: player('p-foot-8', 'Lautaro Martinez', 'Inter Milan', 'ST'),
    kimmich: player('p-foot-9', 'Joshua Kimmich', 'Bayern Munich', 'CM'),
    judge: player('p-base-1', 'Aaron Judge', 'New York Yankees', 'RF'),
    soto: player('p-base-2', 'Juan Soto', 'New York Yankees', 'LF'),
    devers: player('p-base-3', 'Rafael Devers', 'Boston Red Sox', '3B'),
    betts: player('p-base-4', 'Mookie Betts', 'Los Angeles Dodgers', 'SS'),
    ohtani: player('p-base-5', 'Shohei Ohtani', 'Los Angeles Dodgers', 'DH'),
    webb: player('p-base-6', 'Logan Webb', 'San Francisco Giants', 'P'),
    suzuki: player('p-base-7', 'Seiya Suzuki', 'Chicago Cubs', 'RF'),
    swanson: player('p-base-8', 'Dansby Swanson', 'Chicago Cubs', 'SS'),
    goldschmidt: player('p-base-9', 'Paul Goldschmidt', 'St. Louis Cardinals', '1B'),
    altuve: player('p-base-10', 'Jose Altuve', 'Houston Astros', '2B'),
    alvarez: player('p-base-11', 'Yordan Alvarez', 'Houston Astros', 'LF'),
    seager: player('p-base-12', 'Corey Seager', 'Texas Rangers', 'SS'),
    guerrero: player('p-base-13', 'Vladimir Guerrero Jr.', 'Toronto Blue Jays', '1B'),
    bichette: player('p-base-14', 'Bo Bichette', 'Toronto Blue Jays', 'SS'),
    arozarena: player('p-base-15', 'Randy Arozarena', 'Tampa Bay Rays', 'LF'),
};
const sports = [
    {
        id: '1001',
        name: 'Basketball',
        leagues: [
            {
                id: '2001',
                name: 'NBA',
                sportId: '1001',
                games: [
                    game({
                        id: '3001',
                        sportId: '1001',
                        leagueId: '2001',
                        homeTeam: 'Los Angeles Lakers',
                        awayTeam: 'Boston Celtics',
                        date: '2025-11-01T02:00:00.000Z',
                        venue: 'Crypto.com Arena',
                        players: [players.lebron, players.tatum, players.davis],
                    }),
                    game({
                        id: '3002',
                        sportId: '1001',
                        leagueId: '2001',
                        homeTeam: 'Denver Nuggets',
                        awayTeam: 'Miami Heat',
                        date: '2025-11-05T01:00:00.000Z',
                        venue: 'Ball Arena',
                        players: [players.jokic, players.murray, players.butler],
                    }),
                ],
            },
            {
                id: '2002',
                name: 'EuroLeague',
                sportId: '1001',
                games: [
                    game({
                        id: '3003',
                        sportId: '1001',
                        leagueId: '2002',
                        homeTeam: 'Real Madrid',
                        awayTeam: 'FC Barcelona',
                        date: '2025-12-01T18:00:00.000Z',
                        venue: 'WiZink Center',
                        players: [players.musa, players.laprovittola, players.deck],
                    }),
                ],
            },
        ],
    },
    {
        id: '1002',
        name: 'Football',
        leagues: [
            {
                id: '2003',
                name: 'Premier League',
                sportId: '1002',
                games: [
                    game({
                        id: '3004',
                        sportId: '1002',
                        leagueId: '2003',
                        homeTeam: 'Arsenal',
                        awayTeam: 'Liverpool',
                        date: '2025-10-12T15:00:00.000Z',
                        venue: 'Emirates Stadium',
                        players: [players.saka, players.salah, players.vvd],
                    }),
                    game({
                        id: '3005',
                        sportId: '1002',
                        leagueId: '2003',
                        homeTeam: 'Manchester City',
                        awayTeam: 'Chelsea',
                        date: '2025-10-20T17:00:00.000Z',
                        venue: 'Etihad Stadium',
                        players: [players.haaland, players.kdb, players.palmer],
                    }),
                ],
            },
            {
                id: '2004',
                name: 'UEFA Champions League',
                sportId: '1002',
                games: [
                    game({
                        id: '3006',
                        sportId: '1002',
                        leagueId: '2004',
                        homeTeam: 'Bayern Munich',
                        awayTeam: 'Inter Milan',
                        date: '2025-09-29T20:00:00.000Z',
                        venue: 'Allianz Arena',
                        players: [players.kane, players.martinez, players.kimmich],
                    }),
                    game({
                        id: '3007',
                        sportId: '1002',
                        leagueId: '2004',
                        homeTeam: 'Real Madrid',
                        awayTeam: 'Barcelona',
                        date: '2025-09-29T20:00:00.000Z',
                        venue: 'Santiago Bernabeu',
                        players: [players.kane, players.martinez, players.kimmich],
                    }),
                ],
            },
        ],
    },
    {
        id: '1003',
        name: 'Baseball',
        leagues: [
            {
                id: '2005',
                name: 'MLB',
                sportId: '1003',
                games: [
                    game({
                        id: '4001',
                        sportId: '1003',
                        leagueId: '2005',
                        homeTeam: 'New York Yankees',
                        awayTeam: 'Boston Red Sox',
                        date: '2025-07-04T23:05:00.000Z',
                        venue: 'Yankee Stadium',
                        players: [players.judge, players.soto, players.devers],
                    }),
                    game({
                        id: '4002',
                        sportId: '1003',
                        leagueId: '2005',
                        homeTeam: 'Los Angeles Dodgers',
                        awayTeam: 'San Francisco Giants',
                        date: '2025-08-12T02:10:00.000Z',
                        venue: 'Dodger Stadium',
                        players: [players.betts, players.ohtani, players.webb],
                    }),
                    game({
                        id: '4003',
                        sportId: '1003',
                        leagueId: '2005',
                        homeTeam: 'Chicago Cubs',
                        awayTeam: 'St. Louis Cardinals',
                        date: '2025-06-18T18:15:00.000Z',
                        venue: 'Wrigley Field',
                        players: [players.suzuki, players.swanson, players.goldschmidt],
                    }),
                    game({
                        id: '4004',
                        sportId: '1003',
                        leagueId: '2005',
                        homeTeam: 'Houston Astros',
                        awayTeam: 'Texas Rangers',
                        date: '2025-09-01T00:35:00.000Z',
                        venue: 'Minute Maid Park',
                        players: [players.altuve, players.alvarez, players.seager],
                    }),
                    game({
                        id: '4005',
                        sportId: '1003',
                        leagueId: '2005',
                        homeTeam: 'Toronto Blue Jays',
                        awayTeam: 'Tampa Bay Rays',
                        date: '2025-05-22T17:07:00.000Z',
                        venue: 'Rogers Centre',
                        players: [players.guerrero, players.bichette, players.arozarena],
                    }),
                ],
            },
        ],
    },
];
function player(id, name, team, position) {
    return { id, name, team, position };
}
function game(input) {
    return { ...input };
}
function getSampleSports() {
    return sports;
}
