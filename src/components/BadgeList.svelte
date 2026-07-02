<script>
	import TabButton from './TabButton.svelte';
	import { badges } from '../data/badges.json';
</script>

<div class="panel">
	{#each badges as badge (badge.id)}
		<TabButton href={badge.href}>
			<img style="image-rendering: pixelated;" src={badge.src} alt="" />
		</TabButton>
	{/each}
</div>

<style>
	div {
		gap: 16px;
		max-height: calc(100dvh - 32px);
		padding: 16px;
		width: fit-content;
		display: grid;
		overflow-y: scroll;

		transform-origin: top;

		transform: scaleY(0);
		animation: expand 0.4s cubic-bezier(0.33, 1, 0.68, 1) forwards;
	}

	div :global(a) {
		display: block;
		break-inside: avoid;
	}
</style>
