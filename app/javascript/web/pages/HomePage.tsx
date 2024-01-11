import React from 'react';
import StockTable from '../components/StockTable';

const HomePage: React.FC = () => {
    return (
        <div>
            <h1>Welcome from homepage</h1>
            <StockTable />
        </div>
    );
};

export default HomePage;
