import React from 'react';

import { createRoot } from 'react-dom/client';
// @ts-ignore
import App from './main/App';
// @ts-ignore
import { BrowserRouter as Router } from 'react-router-dom';

document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('root');
    const root = createRoot(container); // create a root
    root.render(
        <React.StrictMode>
            <Router>
                <App />
            </Router>
        </React.StrictMode>
    );
});
