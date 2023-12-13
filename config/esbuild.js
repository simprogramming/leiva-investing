const esbuild = require('esbuild');
const { rails } = require('esbuild-rails');

esbuild.build({
    entryPoints: ['app/javascript/admin/index.js', 'app/javascript/web/index.tsx'],
    outdir: 'app/assets/builds',
    bundle: true,
    sourcemap: true,
    loader: { '.ts': 'ts', '.tsx': 'tsx', '.js': 'js' }, // Include '.js' if needed
    plugins: [rails()],
    logLevel: 'info',
}).catch(() => process.exit(1));
