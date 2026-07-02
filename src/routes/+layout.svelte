<script lang="ts">
	import './layout.css';
	import './fonts.css';
	import favicon from '$lib/assets/favicon.svg';
	import Header from '../components/Header.svelte';
	import Footer from '../components/Footer.svelte';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>

<Header />
{@render children()}
<Footer />

<style>
	:global html {
		padding: 16px;
	}
</style>
