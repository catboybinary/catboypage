<script>
	import TabButton from './TabButton.svelte';

	let prev = $state({
		label: '...',
		icon: '',
		href: 'https://webring.otomir23.me/catboybinary/prev'
	});
	let next = $state({
		label: '...',
		icon: '',
		href: 'https://webring.otomir23.me/catboybinary/next'
	});
	let curr = $state({ icon: '' });

	$effect(() => {
		fetch('https://webring.otomir23.me/catboybinary/data')
			.then((r) => r.json())
			.then((data) => {
				const resolve = (favicon) => {
					if (!favicon) return '';
					return new URL(favicon, 'https://webring.otomir23.me/media/').href;
				};
				prev = {
					label: (data.prev?.name ?? 'PREV').toUpperCase(),
					icon: resolve(data.prev?.favicon),
					href: data.prev?.url ?? 'https://webring.otomir23.me/catboybinary/prev'
				};
				next = {
					label: (data.next?.name ?? 'NEXT').toUpperCase(),
					icon: resolve(data.next?.favicon),
					href: data.next?.url ?? 'https://webring.otomir23.me/catboybinary/next'
				};
				curr = {
					icon: resolve(data.curr?.favicon)
				};
			})
			.catch(() => {
				prev = { label: 'PREV', icon: '', href: 'https://webring.otomir23.me/catboybinary/prev' };
				next = { label: 'NEXT', icon: '', href: 'https://webring.otomir23.me/catboybinary/next' };
				curr = { icon: '' };
			});
	});
</script>

<div>
	<TabButton {...prev} />
	<TabButton href="/" label="HOME" icon={curr.icon} />
	<TabButton {...next} />
</div>

<style>
	div {
		margin-top: 8px;
		margin-bottom: 8px;
		display: flex;
		flex-direction: row;
		column-gap: 48px;
	}
</style>
