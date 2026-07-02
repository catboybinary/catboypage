<script lang="ts">
	import './layout.css';
	import './fonts.css';
	import favicon from '$lib/assets/favicon.png';
	import Header from '../components/Header.svelte';
	import Footer from '../components/Footer.svelte';
	import BadgeList from '../components/BadgeList.svelte';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>

<div class="page">
	<div class="wrapper">
		<BadgeList />
	</div>

	<div class="layout panel">
		<Header />
		<div class="content">{@render children()}</div>
		<Footer />
	</div>
</div>

<style>
	.page {
		display: grid;
		grid-template-columns: max-content max-content;
		justify-content: center;
		align-items: start;
		column-gap: 16px;
		min-height: 100%;
	}

	.wrapper {
		width: fit-content;
	}

	.layout {
		display: flex;
		max-width: min-content;
		min-width: 256px;
		flex-direction: column;
		min-height: 100%;
		padding: 16px;
	}

	.content {
		flex: 1;
	}
</style>
