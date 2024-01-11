// StockTable.tsx
// @ts-ignore
import React, { useEffect, useState } from 'react';
// @ts-ignore
import axios from 'axios';

interface Stock {
    id: number;
    name: string;
    symbol: string;
    price: number;
    status: string;
}

const StockTable: React.FC = () => {
    const [stocks, setStocks] = useState<Stock[]>([]);

    useEffect(() => {
        axios.get('/admin/stocks.json')
            .then(response => {
                setStocks(response.data);
            })
            .catch(error => {
                console.error("Error fetching stocks", error);
            });
    }, []);

    return (
        <table>
            <thead>
            <tr>
                <th>Name</th>
                <th>Symbol</th>
                <th>Price</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
            {stocks.map(stock => (
                <tr key={stock.id}>
                    <td>{stock.name}</td>
                    <td>{stock.symbol}</td>
                    <td>{stock.price}</td>
                    <td>{stock.status}</td>
                </tr>
            ))}
            </tbody>
        </table>
    );
};

export default StockTable;
