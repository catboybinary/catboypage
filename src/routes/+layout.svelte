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

<div class="layout panel">
	<Header />
	<div class="content">{@render children()}</div>
	<Footer />
</div>

<div class="wrapper">
	<BadgeList />
</div>

<style>
	.wrapper {
		width: fit-content;
		margin-left: auto;
		position: absolute;
		top: 16px;
		right: 16px;
	}

	.layout {
		display: flex;
		max-width: min-content;
		min-width: 256px;
		flex-direction: column;
		min-height: 100%;
		margin: auto;
		padding: 16px;
	}

	.content {
		flex: 1;
	}
</style>
