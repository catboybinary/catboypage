<script>
	import TabButton from './TabButton.svelte';
	import { badges } from '../data/badges.json';
</script>

<div class="panel">
	<p style="font-family: 'ITC Benguiat Book'; letter-spacing: 0.15rem; font-size: 32px;">frens:</p>
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
		display: flex;
		flex-flow: column;
		overflow-y: scroll;

		transform-origin: top;

		transform: scaleY(0);
		animation: expand 0.4s cubic-bezier(0.33, 1, 0.68, 1) forwards;
	}

	div :global(a) {
		display: block;
		break-inside: avoid;
	}

	@media (max-width: 848px) {
		div {
			max-height: none;
			padding: 16px;
			gap: 8px;
			width: 100%;
			flex-flow: wrap;
			justify-content: center;
			overflow-y: visible;

			p {
				display: none;
			}
		}

		div :global(a) {
			margin-bottom: 0;
		}
	}
</style>
