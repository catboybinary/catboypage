<script>
	import Window from './Window.svelte';
	import hardware from '../data/hardware.json';

	const lines = [
		{ label: 'Mobo', name: hardware.motherboard, specs: [] },
		{
			label: 'CPU',
			name: hardware.cpu.name,
			specs: [
				`${hardware.cpu.cores} cores`,
				`${hardware.cpu.min_frequency}-${hardware.cpu.max_frequency} GHz`
			]
		},
		{
			label: 'GPU',
			name: hardware.gpu.name,
			specs: [`${hardware.gpu.memory_gb} GB`, `${hardware.gpu.bus_width}-bit`]
		},
		{
			label: 'RAM',
			name: hardware.ram.name,
			specs: [hardware.ram.type, `${hardware.ram.memory_gb} GB x ${hardware.ram.amount}`]
		},
		{
			label: 'Storage',
			name: hardware.storage.name,
			specs: [`${hardware.storage.capacity_gb} GB`]
		}
	];
</script>

<Window title="Hardware">
	<div class="lines">
		{#each lines as { label, name, specs } (label)}
			<p>
				<span class="label">{label}:</span>
				<span class="details">
					<span>{name}</span>
					{#each specs as spec (spec)}
						<span>{spec}</span>
					{/each}
				</span>
			</p>
			<hr />
		{/each}
	</div>
</Window>

<style>
	.lines {
		padding: 8px 16px 16px 16px;
		display: flex;
		flex-direction: column;
		row-gap: 8px;
	}

	p {
		display: flex;
		justify-content: space-between;
		gap: 16px;
		margin: 0;
	}

	.label {
		white-space: nowrap;
		min-width: 120px;
	}

	.details {
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		text-align: right;
	}
</style>
