"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sportsRouter = void 0;
const express_1 = require("express");
const sportsService_1 = require("../services/sportsService");
exports.sportsRouter = (0, express_1.Router)();
exports.sportsRouter.get('/sports', (_req, res) => {
    res.json({ sports: (0, sportsService_1.getAllSports)() });
});
exports.sportsRouter.get('/sports/search', (req, res) => {
    const normalize = (value) => {
        const str = value?.toString() ?? '';
        return str.length > 0 ? str : undefined;
    };
    const filters = {
        teamNameQuery: normalize(req.query.teamName),
        leagueNameQuery: normalize(req.query.leagueName),
        startDate: normalize(req.query.startDate),
        endDate: normalize(req.query.endDate),
    };
    const results = (0, sportsService_1.searchSports)(filters);
    res.json({ sports: results });
});
exports.sportsRouter.get('/games/:id', (req, res) => {
    const game = (0, sportsService_1.findGameById)(req.params.id);
    if (!game) {
        return res.status(404).json({ error: 'Game not found' });
    }
    return res.json({ game });
});
