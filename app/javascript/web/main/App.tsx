import React from 'react';
// @ts-ignore
import { Routes, Route } from 'react-router-dom';
// @ts-ignore
import HomePage from '../pages/HomePage';
import TechPortfolioPage from '../pages/TechPortfolioPage';
const App: React.FC = () => {
    return (
        <Routes>
            <Route path="/" element={<HomePage />} />
            <Route path="/tech-portfolio" element={<TechPortfolioPage />} />
        </Routes>
    );
};

export default App;
