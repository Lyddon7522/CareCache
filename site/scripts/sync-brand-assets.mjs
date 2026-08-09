import { cpSync, mkdirSync, rmSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const scriptDirectory = dirname(fileURLToPath(import.meta.url));
const siteDirectory = resolve(scriptDirectory, '..');
const repositoryDirectory = resolve(siteDirectory, '..');
const source = resolve(repositoryDirectory, 'assets', 'brand');
const destination = resolve(siteDirectory, 'public', 'brand');

mkdirSync(resolve(siteDirectory, 'public'), { recursive: true });
rmSync(destination, { recursive: true, force: true });
cpSync(source, destination, { recursive: true });
