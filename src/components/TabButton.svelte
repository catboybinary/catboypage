<script>
	let { href, label = 'BUTTON', icon = '' } = $props();
</script>

<a {href}>
	<div>
		{#if icon}
			<img src={icon} alt="no icon" />
		{:else}
			[ ]
		{/if}
		{label}
	</div>
</a>

<style>
	img {
		height: 1em;
		filter: sepia(100%) grayscale(50%);
		background-color: var(--text-color);
		transition:
			filter 0.2s,
			background-color 0.2s;
		border: 3px;
		margin-left: 4px;
		padding: 4px;
	}

	div {
		display: flex;
		align-items: center;
		gap: 0.3em;
		background-image: linear-gradient(to right, var(--text-color), var(--text-color));
		background-size: 0% 100%;
		background-repeat: no-repeat;
		background-color: var(--text-shadow);
		color: var(--text-color);
		transition:
			background-size 0.175s,
			color 0.1s;
		width: fit-content;
		min-width: 240px;
		padding: 0.4rem;
		letter-spacing: 0.125rem;
		position: relative;
		display: flex;
		flex-direction: row;
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

		img {
			background-color: var(--text-shadow);
		}
	}

	div:hover::before,
	div:hover::after {
		background-color: var(--text-color);
	}
</style>
