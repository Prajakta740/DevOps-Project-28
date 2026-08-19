import { defineConfig } from 'vitest/config';
import path from 'path';

export default defineConfig({
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './'),
    },
  },

  test: {
    environment: 'jsdom',

    coverage: {
      provider: 'c8',
      reporter: ['text', 'lcov', 'html'],
      reportsDirectory: './coverage',
      exclude: [
        'node_modules/',
        'coverage/',
        '**/*.config.*',
        '**/*.d.ts',
        '**/__tests__/**'
      ]
    }
  }
});
