import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const read = (path) => readFile(new URL(`../src/pages/${path}`, import.meta.url), 'utf8');

test('publishes required app-store routes', async () => {
  for (const page of ['index.astro', 'privacy.astro', 'terms.astro', 'support.astro', '404.astro']) {
    assert.ok((await read(page)).length > 200, `${page} should contain meaningful content`);
  }
});

test('privacy policy states the local-only boundary and backup limitation', async () => {
  const privacy = await read('privacy.astro');
  assert.match(privacy, /no CareCache app records/i);
  assert.match(privacy, /not encrypted/i);
  assert.match(privacy, /no account/i);
  assert.match(privacy, /on-device text recognition/i);
});

test('terms include medical and reminder disclaimers', async () => {
  const terms = await read('terms.astro');
  assert.match(terms, /not a medical device/i);
  assert.match(terms, /Do not change therapy/i);
  assert.match(terms, /delay or suppress notifications/i);
});

test('site source does not include trackers or remote asset URLs', async () => {
  const source = (await Promise.all(['index.astro', 'privacy.astro', 'terms.astro', 'support.astro'].map(read))).join('\n');
  assert.doesNotMatch(source, /google-analytics|googletagmanager|segment\.com|mixpanel|posthog/i);
  assert.doesNotMatch(source, /<img[^>]+src=["']https?:/i);
});
