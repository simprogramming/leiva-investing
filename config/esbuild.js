const esbuild = require('esbuild');
const { rails } = require('esbuild-rails');

esbuild.build({
    entryPoints: ['app/javascript/application.tsx'], // Update with your main entry file
    outdir: 'app/assets/builds',
    bundle: true,
    sourcemap: true,
    loader: { '.ts': 'ts', '.tsx': 'tsx' }, // TypeScript loaders
    plugins: [rails()],
    logLevel: 'info',
}).catch(() => process.exit(1));
