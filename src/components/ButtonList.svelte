<script>
	import TabButton from './TabButton.svelte';
</script>

<div class="panel">
	<TabButton label="TestButton" />
	<TabButton label="TestButton2" />
	<TabButton label="TestButton3" />
</div>

<style>
	div {
		display: flex;
		flex-direction: column;
		row-gap: 16px;
		padding: 16px;
		width: 50%;

		:global(div) {
			min-width: 100%;
		}
	}
</style>
