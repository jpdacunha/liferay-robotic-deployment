import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.getByRole('button', { name: 'Open Applications Menu Ctrl' }).click();
  await page.getByRole('tab', { name: 'Control Panel' }).click();
  await page.getByRole('menuitem', { name: 'Sites' }).click();
  await page.getByRole('link', { name: 'Add Site' }).click();
  await page.getByRole('button', { name: 'Select Template: Blank Site' }).click();
  await page.locator('iframe[title="Add Site"]').contentFrame().getByRole('textbox', { name: 'Name Required' }).click();
  await page.locator('iframe[title="Add Site"]').contentFrame().getByRole('textbox', { name: 'Name Required' }).fill('Liferay RObotic');
  await page.locator('iframe[title="Add Site"]').contentFrame().getByRole('button', { name: 'Add' }).click();
  await page.getByRole('tab', { name: 'Open Product Menu' }).click();
  await page.getByRole('button', { name: 'Page Tree' }).click();
  await page.getByRole('button', { name: 'Add Page' }).click();
  await page.getByRole('menuitem', { name: 'Add Page' }).click();
  await page.getByRole('button', { name: 'Blank' }).click();
  await page.locator('iframe[title="Add Page"]').contentFrame().getByRole('textbox', { name: 'Name Required' }).click();
  await page.locator('iframe[title="Add Page"]').contentFrame().getByRole('textbox', { name: 'Name Required' }).fill('test');
  await page.locator('iframe[title="Add Page"]').contentFrame().getByRole('button', { name: 'Add' }).click();
  await page.getByRole('button', { name: 'Publish' }).click();
  await page.getByRole('tab', { name: 'Open Product Menu' }).click();
  await page.getByRole('link', { name: 'Home' }).click();
});