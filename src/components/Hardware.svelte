<script>
	import Window from './Window.svelte';
	import hardware from '../data/hardware.json';
	import { CircuitBoard, Cpu, Gpu, HardDrive, MemoryStick } from '@lucide/svelte';

	const lines = [
		{ label: 'Mobo', name: hardware.motherboard, specs: [], icon: CircuitBoard },
		{
			label: 'CPU',
			name: hardware.cpu.name,
			specs: [
				`${hardware.cpu.cores} cores`,
				`${hardware.cpu.min_frequency}-${hardware.cpu.max_frequency} GHz`
			],
			icon: Cpu
		},
		{
			label: 'GPU',
			name: hardware.gpu.name,
			specs: [`${hardware.gpu.vendor}`, `${hardware.gpu.memory_gb} GB`, `${hardware.gpu.bus_width}-bit`],
			icon: Gpu
		},
		{
			label: 'RAM',
			name: hardware.ram.name,
			specs: [hardware.ram.type, `${hardware.ram.memory_gb} GB x ${hardware.ram.amount}`],
			icon: MemoryStick
		},
		{
			label: 'Storage',
			name: hardware.storage.name,
			specs: [`${hardware.storage.capacity_gb} GB`],
			icon: HardDrive
		}
	];
</script>

<Window title="Hardware">
	<div class="lines">
		{#each lines as { label, name, specs, icon: Icon }, index (label)}
			<p>
				<span class="label">
					<Icon size={24} aria-hidden="true" />
					{label}:
				</span>
				<span class="details">
					<span> {name}</span>
					{#each specs as spec (spec)}
						<span>{spec}</span>
					{/each}
				</span>
			</p>
			{#if index < lines.length - 1}
				<hr />
			{/if}
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
		display: flex;
		align-items: center;
		align-self: flex-start;
		gap: 8px;
		white-space: nowrap;
		min-width: 132px;
	}

	.label :global(svg) {
		flex-shrink: 0;
	}

	.details {
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		text-align: right;
	}
</style>
