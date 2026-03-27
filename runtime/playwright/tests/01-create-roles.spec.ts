import { test } from '@playwright/test';

type SiteRole = {
  title: string;
  description: string;
  key: string;
};

test('test', async ({ page }) => {

  const roles: SiteRole[] = [
    {
      title: 'Site Contributor',
      description: 'Allow a user to create content',
      key: 'site-contributor',
    },
    {
      title: 'Site Publisher',
      description: 'Allow a user to publish approved content',
      key: 'site-publisher',
    },
    {
      title: 'Site Moderator',
      description: 'Allow a user to moderate content and discussions',
      key: 'site-moderator',
    },
  ];

  await page.goto('http://localhost:8080/');
  await page.getByRole('button', { name: 'Sign In' }).click();
  await page.getByRole('textbox', { name: 'Screen Name' }).click();
  await page.getByRole('textbox', { name: 'Screen Name' }).fill('superadmin');
  await page.getByRole('textbox', { name: 'Screen Name' }).press('Tab');
  await page.getByRole('textbox', { name: 'Password' }).fill('test');
  await page.getByLabel('Sign In- Loading').getByRole('button', { name: 'Sign In' }).click();
  await page.getByRole('button', { name: 'Open Applications Menu Ctrl' }).click();
  await page.getByRole('tab', { name: 'Control Panel' }).click();
  await page.getByRole('menuitem', { name: 'Roles' }).click();
  await page.getByRole('link', { name: 'Site Roles' }).click();
 

  for (const role of roles) {

    await page.getByRole('link', { name: 'Site Role', exact: true }).click();

    await page.getByRole('textbox', { name: 'Title A title is a' }).click();
    await page.getByRole('textbox', { name: 'Title A title is a' }).fill(role.title);

    await page.getByRole('textbox', { name: 'Description' }).click();
    await page.getByRole('textbox', { name: 'Description' }).clear();
    await page.getByRole('textbox', { name: 'Description' }).fill(role.description);

    await page.getByRole('textbox', { name: 'Key Required A key provides a' }).click();
    await page.getByRole('textbox', { name: 'Key Required A key provides a' }).clear();
    await page.getByRole('textbox', { name: 'Key Required A key provides a' }).fill(role.key);

    await page.getByRole('button', { name: 'Save' }).click();

    await page.waitForTimeout(2000);

    await page.waitForSelector('.alert-success', { timeout: 2000});

    await page.getByRole('link', { name: 'Go to Roles' }).click();

  }
});