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
	<div class="layout panel">
		<Header />
		<div class="content">{@render children()}</div>
		<Footer />
	</div>

	<div class="wrapper">
		<BadgeList />
	</div>
</div>

<style>
	.page {
		display: flex;
		justify-content: center;
		column-gap: 16px;
		min-height: 100%;
	}

	.layout {
		display: flex;
		max-width: 848px;
		min-width: 256px;
		flex-direction: column;
		min-height: 100%;
		padding: 16px;
	}

	.wrapper {
		width: fit-content;
		align-self: flex-start;
	}

	.content {
		flex: 1;
	}

	@media (max-width: 848px) {
		.page {
			flex-direction: column;
			align-items: center;
			column-gap: 0;
			row-gap: 16px;
		}

		.wrapper {
			width: 100%;
			align-self: auto;
		}

		.layout {
			min-width: 100%;
			min-height: auto;
		}
	}
</style>
