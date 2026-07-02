<script>
	import { page } from '$app/stores';
	let { href, label = 'BUTTON', icon } = $props();
	let active = $derived($page.url.pathname === href);
</script>

<a {href}>
	<div class:active>
		{#if icon}
			<span class="icon">{@render icon()}</span>
		{/if}
		{label}
	</div>
</a>

<style>
	.icon {
		color: var(--text-shadow);
		background-color: var(--text-color);
		transition:
			color 0.1s,
			background-color 0.1s;
		height: 1em;
		display: flex;
		align-items: center;
	}

	.icon :global(svg) {
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
		color: var(--text-color);
		transition:
			background-size 0.175s,
			color 0.1s,
			margin-bottom 0.2s,
			padding-bottom 0.2s;
		width: fit-content;
		line-height: 1em;
		min-width: 240px;
		letter-spacing: 0.125rem;
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
			background-color: var(--primary-color);
		}
	}

	div.active {
		margin-bottom: calc(0px - var(--header-gap, 0px));
		padding-bottom: calc(0.6rem + var(--header-gap, 0px));
		background-size: 100% 100%;
		color: var(--primary-color);
		animation: pulse 2s ease-in-out infinite;

		.icon {
			color: var(--text-color);
			background-color: var(--primary-color);
		}
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

	div:not(.active):hover::before,
	div:not(.active):hover::after {
		background-color: var(--text-color);
	}
</style>
