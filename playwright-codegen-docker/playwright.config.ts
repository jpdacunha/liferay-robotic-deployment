import { defineConfig } from '@playwright/test';

export default defineConfig({
  use: {
    baseURL: process.env.BASE_URL || 'http://localhost',
    headless: false,
    screenshot: 'only-on-failure',
    video: 'retain-on-failure'
  }
});
