<script lang="ts">
	import './layout.css';
	import './fonts.css';
	import favicon from '#lib/assets/favicon.png';
	import Header from '../components/Header.svelte';
	import Footer from '../components/Footer.svelte';
	import BadgeList from '../components/BadgeList.svelte';
	import Button from '../components/Button.svelte';
	import Hardware from '../components/Hardware.svelte';

	let { children } = $props();

	function toggleTheme() {
		const forced = document.documentElement.dataset.theme;
		const current =
			forced === 'light' || forced === 'dark'
				? forced
				: window.matchMedia('(prefers-color-scheme: dark)').matches
					? 'dark'
					: 'light';
		const next = current === 'dark' ? 'light' : 'dark';

		document.documentElement.dataset.theme = next;
		document.cookie = `theme=${next}; Path=/; Max-Age=31536000; SameSite=Lax`;
	}
</script>

{#snippet themeIcon()}
	<svg
		class="theme-icon sun"
		xmlns="http://www.w3.org/2000/svg"
		width="16"
		height="16"
		viewBox="-3 -3 30 30"
		fill="none"
		stroke="currentColor"
		stroke-width="2.5"
		stroke-linecap="round"
		stroke-linejoin="round"
	>
		<circle cx="12" cy="12" r="4" />
		<path d="M12 2v2" />
		<path d="M12 20v2" />
		<path d="m4.93 4.93 1.41 1.41" />
		<path d="m17.66 17.66 1.41 1.41" />
		<path d="M2 12h2" />
		<path d="M20 12h2" />
		<path d="m6.34 17.66-1.41 1.41" />
		<path d="m19.07 4.93-1.41 1.41" />
	</svg>
	<svg
		class="theme-icon moon"
		xmlns="http://www.w3.org/2000/svg"
		width="24"
		height="24"
		viewBox="-3 -3 30 30"
		fill="none"
		stroke="currentColor"
		stroke-width="2.5"
		stroke-linecap="round"
		stroke-linejoin="round"
	>
		<path
			d="M20.985 12.486a9 9 0 1 1-9.473-9.472c.405-.022.617.46.402.803a6 6 0 0 0 8.268 8.268c.344-.215.825-.004.803.401"
		/>
	</svg>
{/snippet}

<svelte:head>
	<link rel="icon" href={favicon} />
	<title>catboybinary</title>
</svelte:head>

<div class="page">
	<div class="hardware">
		<Hardware />
	</div>

	<div class="layout panel panel-shadow">
		<Header />
		<div class="content">{@render children()}</div>
		<Footer />
	</div>

	<div class="wrapper">
		<BadgeList />
	</div>
</div>

<div class="theme-toggle">
	<Button
		onclick={toggleTheme}
		aria-label="Toggle color theme"
		children={themeIcon}
		showLines={false}
	/>
</div>

<style>
	.theme-toggle {
		position: fixed;
		top: 16px;
		right: 16px;
	}

	.theme-icon.moon {
		display: none;
	}

	@media (prefers-color-scheme: dark) {
		.theme-icon.sun {
			display: none;
		}

		.theme-icon.moon {
			display: flex;
		}
	}

	:global(html[data-theme='light']) {
		.theme-icon.sun {
			display: flex;
		}
		.theme-icon.moon {
			display: none;
		}
	}

	:global(html[data-theme='dark']) {
		.theme-icon.sun {
			display: none;
		}
		.theme-icon.moon {
			display: flex;
		}
	}

	.page {
		display: flex;
		justify-content: center;
		column-gap: 16px;
		min-height: 100%;
	}

	.layout {
		display: flex;
		order: 2;
		max-width: 848px;
		min-width: 256px;
		flex-direction: column;
		min-height: 100%;
		padding: 16px;
	}

	.wrapper,
	.hardware {
		width: fit-content;
		align-self: flex-start;
	}

	.hardware {
		order: 1;
	}

	.wrapper {
		order: 3;
	}

	.content {
		flex: 1;
	}

	@media (max-width: 848px) {
		.page {
			flex-direction: column;
			align-items: center;
			column-gap: 0;
			row-gap: 16px;
		}

		.wrapper,
		.hardware {
			width: 100%;
			align-self: auto;
		}

		.hardware {
			order: 2;
		}

		.wrapper {
			order: 3;
		}

		.layout {
			order: 1;
			min-width: 100%;
			min-height: auto;
		}
	}
</style>
