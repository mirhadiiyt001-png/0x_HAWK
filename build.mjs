import * as esbuild from 'esbuild';
import { pinoPlugin } from 'esbuild-plugin-pino';

await esbuild.build({
  entryPoints: ['src/index.ts'],
  bundle: true,
  platform: 'node',
  target: 'node20',
  outfile: 'dist/index.mjs',
  external: ['pg-native'],
  sourcemap: true,
  plugins: [pinoPlugin()],
  define: {
    'process.env.NODE_ENV': '"production"',
  },
});

console.log('✓ Backend built successfully');
