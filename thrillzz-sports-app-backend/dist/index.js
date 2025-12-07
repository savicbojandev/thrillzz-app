"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const cors_1 = __importDefault(require("cors"));
const express_1 = __importDefault(require("express"));
const sportsRoutes_1 = require("./routes/sportsRoutes");
const app = (0, express_1.default)();
const port = process.env.PORT ?? 3001;
app.use((0, cors_1.default)());
app.use(express_1.default.json());
app.get('/health', (_req, res) => res.json({ status: 'ok' }));
app.use('/api', sportsRoutes_1.sportsRouter);
app.use((_req, res) => {
    res.status(404).json({ error: 'Not found' });
});
// eslint-disable-next-line @typescript-eslint/no-unused-vars
app.use((err, _req, res, _next) => {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
});
app.listen(port, () => {
    console.log(`Thrillzz backend listening on port ${port}`);
});
