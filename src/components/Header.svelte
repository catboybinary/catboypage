<script>
	import TabButton from './TabButton.svelte';
</script>

{#snippet homeIcon()}
	<svg
		xmlns="http://www.w3.org/2000/svg"
		width="24"
		height="24"
		viewBox="0 0 24 24"
		fill="none"
		stroke="currentColor"
		stroke-width="2.25"
		stroke-linecap="square"
		stroke-linejoin="miter"
		><path d="M3 10 L12 3 L21 10 L21 21 L15 21 L15 13 L9 13 L9 21 L3 21 Z" /></svg
	>
{/snippet}

<div>
	<TabButton href="/" icon={homeIcon} label="HOME" />
</div>

<style>
	div {
		margin-top: 8px;
		margin-bottom: 16px;
		margin-left: auto;
		margin-right: auto;
		display: flex;
		flex-direction: row;
		column-gap: 48px;
	}
</style>
