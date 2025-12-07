"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getAllSports = getAllSports;
exports.findGameById = findGameById;
exports.searchSports = searchSports;
const sampleSports_1 = require("../data/sampleSports");
const sportsData = (0, sampleSports_1.getSampleSports)();
function getAllSports() {
    return sportsData;
}
function findGameById(id) {
    for (const sport of sportsData) {
        for (const league of sport.leagues) {
            const game = league.games.find((g) => g.id === id);
            if (game)
                return game;
        }
    }
    return undefined;
}
function searchSports(filters) {
    const normalizedTeam = (filters.teamNameQuery ?? '').trim().toLowerCase();
    const normalizedLeague = (filters.leagueNameQuery ?? '').trim().toLowerCase();
    const startDate = parseDate(filters.startDate);
    const endDate = parseDate(filters.endDate);
    return sportsData
        .map((sport) => {
        const filteredLeagues = sport.leagues
            .map((league) => {
            const filteredGames = league.games.filter((game) => matchesFilters(game, league, {
                normalizedTeam,
                normalizedLeague,
                startDate,
                endDate,
            }));
            if (filteredGames.length === 0)
                return undefined;
            return { ...league, games: filteredGames };
        })
            .filter((league) => Boolean(league));
        if (filteredLeagues.length === 0)
            return undefined;
        return { ...sport, leagues: filteredLeagues };
    })
        .filter((sport) => Boolean(sport));
}
function matchesFilters(game, league, filters) {
    if (filters.normalizedLeague &&
        !league.name.toLowerCase().includes(filters.normalizedLeague)) {
        return false;
    }
    if (filters.startDate && new Date(game.date) < filters.startDate) {
        return false;
    }
    if (filters.endDate && new Date(game.date) > filters.endDate) {
        return false;
    }
    if (filters.normalizedTeam) {
        const normalizedTitle = `${game.homeTeam} ${game.awayTeam}`.toLowerCase();
        const normalizedLeagueName = league.name.toLowerCase();
        const matchesTitle = normalizedTitle.includes(filters.normalizedTeam);
        const matchesLeague = normalizedLeagueName.includes(filters.normalizedTeam);
        if (!matchesTitle && !matchesLeague) {
            return false;
        }
    }
    return true;
}
function parseDate(input) {
    if (!input)
        return undefined;
    const parsed = new Date(input);
    return Number.isNaN(parsed.getTime()) ? undefined : parsed;
}
