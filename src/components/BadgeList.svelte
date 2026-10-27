<script>
	import { badges } from '../data/badges.json';
	import Button from './Button.svelte';
	import Window from './Window.svelte';
</script>

<Window title="Friends" class="badges-window" draggable={{ handle: '.panel-header', bounds: 'html' }}>
	<div class="badges">
    	{#each badges as badge (badge.id)}
    		<Button href={badge.href} showLines={false}>
    			<img class="badge" style="image-rendering: pixelated;" src={badge.src} width="88" height="31" alt={badge.name} />
    		</Button>
    	{/each}
	</div>
</Window>

<style>
    :global(.badges-window) {
        min-width: max-content;
    }

	.badges {
		gap: 16px;
		max-height: calc(100dvh - 70px);
		padding: 16px 16px 16px 16px;
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

	@media (max-width: 848px) {
    	:global(.badges-window) {
            min-width: fit-content;
        }

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
