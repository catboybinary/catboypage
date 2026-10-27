import type { Handle } from '@sveltejs/kit';

export const handle: Handle = async ({ event, resolve }) => {
	const theme = event.cookies.get('theme');

	return resolve(event, {
		transformPageChunk: ({ html }) =>
			theme === 'light' || theme === 'dark'
				? html.replace('<html lang="en">', `<html lang="en" data-theme="${theme}">`)
				: html
	});
};
