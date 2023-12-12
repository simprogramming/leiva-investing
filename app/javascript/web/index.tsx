import React from 'react';
import { createRoot } from 'react-dom/client';
import "@hotwired/turbo-rails";
// @ts-ignore
import App from './components/App';

document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('react-app');
    const root = createRoot(container); // create a root
    root.render(<React.StrictMode><App /></React.StrictMode>);
});
