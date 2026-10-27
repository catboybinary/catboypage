<script>
	import { badges } from '../data/badges.json';
	import Button from './Button.svelte';
</script>

<div class="panel">
    <div class="panel-header inverted">
        Friends
    </div>
	<div class="badges">
    	{#each badges as badge (badge.id)}
    		<Button href={badge.href} showLines={false}>
    			<img style="image-rendering: pixelated;" src={badge.src} width="88" height="31" alt={badge.name} />
    		</Button>
    	{/each}
	</div>
</div>

<style>
	.badges {
		gap: 16px;
		max-height: calc(100dvh - 70px);
		padding: 8px 16px 8px 16px;
		width: fit-content;
		display: flex;
		flex-flow: column;
		overflow-y: scroll;

		transform-origin: top;

		transform: scaleY(0);
		animation: expand 0.4s cubic-bezier(0.33, 1, 0.68, 1) forwards;
	}

	.badges :global(a) {
		display: block;
		break-inside: avoid;
	}

	.panel-header {
	    background-color: var(--text-color);
		color: var(--background-color);
		padding: 0px 16px 0px 16px;
	}

	@media (max-width: 848px) {
		.badges {
			max-height: none;
			padding: 16px;
			gap: 16px 8px;
			width: 100%;
			flex-flow: wrap;
			justify-content: center;
			overflow-y: visible;
		}

		.badges :global(a) {
			margin-bottom: 0;
		}
	}
</style>
