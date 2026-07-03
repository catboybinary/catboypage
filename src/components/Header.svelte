<script>
	import TabButton from './TabButton.svelte';
</script>

{#snippet homeIcon()}
	<svg
		xmlns="http://www.w3.org/2000/svg"
		width="24"
		height="24"
		viewBox="-3 -3 30 30"
		fill="none"
		stroke="currentColor"
		stroke-width="2.5"
		stroke-linecap="square"
		stroke-linejoin="miter"
		><path d="M3 10 L12 3 L21 10 L21 21 L15 21 L15 13 L9 13 L9 21 L3 21 Z" /></svg
	>
{/snippet}

<div>
	<TabButton href="/" children={homeIcon} label="HOME" />
	<TabButton href="/test" children={homeIcon} label="TEST" />
</div>

<style>
	div {
		--header-gap: 16px;
		--min-width: 240px;
		padding-bottom: var(--header-gap);
		margin-bottom: var(--header-gap);
		margin-left: auto;
		margin-right: auto;
		display: flex;
		flex-direction: row;
		overflow-x: scroll;
		overflow-y: hidden;
		width: 100%;
		column-gap: 48px;
		border-bottom: 2px solid var(--text-color);
	}
</style>
