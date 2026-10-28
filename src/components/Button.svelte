<script>
	import { page } from '$app/state';
	let {
		href = undefined,
		label = undefined,
		children = undefined,
		showLines = true,
		onclick = undefined,
		...rest
	} = $props();
	let active = $derived(href ? page.url.pathname === href : false);
</script>

{#snippet content()}
	<div class:active class:no-lines={!showLines}>
		{#if children}
			<span class="icon">{@render children()}</span>
		{/if}
		{#if label}
			<span class="label">{label}</span>
		{/if}
	</div>
{/snippet}

{#if href}
	<a {href} {...rest}>{@render content()}</a>
{:else}
	<button type="button" {onclick} {...rest}>{@render content()}</button>
{/if}

<style>
    button {
		cursor: pointer;
	}

	.icon {
		color: var(--text-shadow);
		transition:
			color 0.1s,
			background-color 0.1s;
		height: 1em;
		display: flex;
		align-items: center;
	}

	.icon:has(:global(svg)) {
		background-color: var(--text-color);
	}

	.icon:has(:global(img)) {
		filter: sepia(75%);
	}

	.icon :global(svg),
	.icon :global(img) {
		height: 100%;
		width: auto;
	}

	div {
		display: flex;
		flex-direction: row;
		align-items: center;
		gap: 0.3em;
		padding: 0.6rem;
		background-image: linear-gradient(to right, var(--text-color), var(--text-color));
		background-size: 0% 100%;
		background-repeat: no-repeat;
		background-color: var(--text-shadow);
		text-wrap-mode: nowrap;
		color: var(--text-color);
		transition:
			background-size 0.175s,
			color 0.1s,
			margin-bottom 0.2s,
			padding-bottom 0.2s,
			--selection-background 0.175s,
			--selection-color 0.175s;
		width: fit-content;
		line-height: 1em;
		min-width: var(--min-width);
		letter-spacing: 0.075em;
		font-size: 2rem;
		position: relative;
	}

	div::before,
	div::after {
		content: '';
		position: absolute;
		left: 0;
		width: 100%;
		height: 3px;
		background-color: transparent;
		transition: background-color 0.2s;
		pointer-events: none;
	}

	div::before {
		top: -8px;
	}

	div::after {
		bottom: -8px;
	}

	div:hover {
		background-size: 100% 100%;
		color: var(--primary-color);

		.icon {
			color: var(--text-color);
		}

		.icon:has(:global(svg)) {
			background-color: var(--primary-color);
		}

		--selection-background: var(--background-color);
		--selection-color: var(--text-color);
	}

	div.active {
		margin-bottom: calc(0px - var(--header-gap, 0px));
		padding-bottom: calc(0.3em + var(--header-gap, 0px));
		background-size: 100% 100%;
		color: var(--primary-color);
		animation: pulse 2s ease-in-out infinite;

		.icon {
			color: var(--text-color);
		}

		.icon:has(:global(svg)) {
			background-color: var(--primary-color);
		}

		--selection-background: var(--background-color);
		--selection-color: var(--text-color);
	}

	@keyframes pulse {
		0%,
		25%,
		50%,
		100% {
			opacity: 1;
		}
		75% {
			opacity: 0.75;
		}
	}

	div:not(.active):not(.no-lines):hover::before,
	div:not(.active):not(.no-lines):hover::after {
		background-color: var(--text-color);
	}

	@media (max-width: 848px) {
		div {
			font-size: 1.25rem;
			padding: 0.4rem;
			min-width: var(--min-width-mobile, auto);
		}

		div::before,
		div::after {
			height: 2px;
		}

		div::before {
			top: -6px;
		}

		div::after {
			bottom: -6px;
		}
	}
</style>
