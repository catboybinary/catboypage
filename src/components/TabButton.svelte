<script>
	let { href, label = 'BUTTON', icon } = $props();
</script>

<a {href}>
	<div>
		{#if icon}
			<span class="icon">{@render icon()}</span>
		{:else}
			[ ]
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
			color 0.1s;
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

	div:hover::before,
	div:hover::after {
		background-color: var(--text-color);
	}
</style>
