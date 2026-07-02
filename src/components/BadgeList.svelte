<script>
	import TabButton from './TabButton.svelte';
	import { badges } from '../data/badges.json';
</script>

<div class="panel">
	{#each badges as badge (badge.id)}
		<TabButton href={badge.href} label={badge.name}>
			<img src={badge.src} alt="" />
		</TabButton>
	{/each}
</div>

<style>
	div {
		display: grid;
		--min-width: 100%;
		row-gap: 16px;
		padding: 16px;
		width: fit-content;

		transform-origin: top;

		transform: scaleY(0);
		animation: expand 0.4s cubic-bezier(0.33, 1, 0.68, 1) forwards;
	}
</style>
