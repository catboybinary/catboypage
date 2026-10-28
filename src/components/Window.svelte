<script lang="ts">
	import { Draggable, scrollLock } from '@neodrag/svelte';
	let { children, title = undefined, class: className = '' } = $props();

	const drag = new Draggable({
		use: [scrollLock()]
	});

	let collapsed = $state(false);

	function toggleCollapsed() {
		collapsed = !collapsed;
	}

	function handleTitleKeydown(event: KeyboardEvent) {
		if (event.key === 'Enter' || event.key === ' ') {
			event.preventDefault();
			toggleCollapsed();
		}
	}
</script>

<div class="main-window panel {className}" class:collapsed {...drag.attach}>
	{#if title}
		<div
			class="panel-header inverted"
			{...drag.handle()}
			role="button"
			tabindex="0"
			aria-expanded={!collapsed}
			ondblclick={toggleCollapsed}
			onkeydown={handleTitleKeydown}
		>
			{title}
		</div>
	{/if}
	<div class="window-contents">
		{@render children()}
	</div>
</div>

<style>
	.main-window {
		height: fit-content;
	}

	.window-contents {
		transform-origin: top;
		transform: scaleY(0);
		animation: expand 0.4s cubic-bezier(0.33, 1, 0.68, 1) forwards;
	}

	.panel.collapsed .window-contents {
		display: none;
	}

	.panel-header {
		background-color: var(--text-color);
		color: var(--background-color);
		padding: 0px 16px 0px 16px;
		user-select: none;
	}
</style>
