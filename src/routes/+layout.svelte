<script lang="ts">
	import './layout.css';
	import './fonts.css';
	import favicon from '$lib/assets/favicon.svg';
	import Header from '../components/Header.svelte';
	import Footer from '../components/Footer.svelte';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>

<div class="layout panel">
	<Header />
	<div class="content">{@render children()}</div>
	<Footer />
</div>

<style>
	.layout {
		display: flex;
		max-width: min-content;
		min-width: 50%;
		flex-direction: column;
		min-height: 100%;
		margin: auto;
		padding: 16px;
	}

	.content {
		flex: 1;
	}
</style>
