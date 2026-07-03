<script>
	import TabButton from './TabButton.svelte';

	let prev = $state({
		label: '...',
		href: 'https://webring.otomir23.me/catboybinary/prev'
	});
	let next = $state({
		label: '...',
		href: 'https://webring.otomir23.me/catboybinary/next'
	});

	$effect(() => {
		fetch('https://webring.otomir23.me/catboybinary/data')
			.then((r) => r.json())
			.then((data) => {
				prev = {
					...prev,
					label: (data.prev?.name ?? 'PREV').toUpperCase(),
					href: data.prev?.url ?? 'https://webring.otomir23.me/catboybinary/prev'
				};
				next = {
					...next,
					label: (data.next?.name ?? 'NEXT').toUpperCase(),
					href: data.next?.url ?? 'https://webring.otomir23.me/catboybinary/next'
				};
			})
			.catch(() => {
				prev = { ...prev, label: 'PREV', href: 'https://webring.otomir23.me/catboybinary/prev' };
				next = { ...next, label: 'NEXT', href: 'https://webring.otomir23.me/catboybinary/next' };
			});
	});
</script>

{#snippet leftIcon()}
	<svg
		xmlns="http://www.w3.org/2000/svg"
		width="24"
		height="24"
		viewBox="0 0 24 24"
		fill="none"
		stroke="currentColor"
		stroke-width="2.75"
		stroke-linecap="square"
		stroke-linejoin="bevel"><path d="m15 6-8 6 8 6" /></svg
	>
{/snippet}

{#snippet webringIcon()}
	<svg
		xmlns="http://www.w3.org/2000/svg"
		width="24"
		height="24"
		viewBox="-3 -3 30 30"
		fill="none"
		stroke="currentColor"
		stroke-width="2.5"
		stroke-linecap="round"
		stroke-linejoin="round"
		class="lucide lucide-globe-icon lucide-globe"
		><circle cx="12" cy="12" r="10" /><path
			d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20"
		/><path d="M2 12h20" /></svg
	>
{/snippet}

{#snippet rightIcon()}
	<svg
		xmlns="http://www.w3.org/2000/svg"
		width="24"
		height="24"
		viewBox="0 0 24 24"
		fill="none"
		stroke="currentColor"
		stroke-width="2.75"
		stroke-linecap="square"
		stroke-linejoin="bevel"><path d="m9 18 8-6-8-6" /></svg
	>
{/snippet}

<div>
	<TabButton {...prev} children={leftIcon} />
	<TabButton label="OTORING" children={webringIcon} href="https://webring.otomir23.me/" />
	<TabButton {...next} children={rightIcon} />
</div>

<style>
	div {
		--min-width: 240px;
		padding-top: 16px;
		margin-top: 16px;
		margin-left: auto;
		margin-right: auto;
		display: flex;
		flex-direction: row;
		justify-content: center;
		overflow-x: scroll;
		overflow-y: hidden;
		width: 100%;
		column-gap: 48px;
		border-top: 2px solid var(--text-color);
	}
</style>
