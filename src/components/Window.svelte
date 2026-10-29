<script lang="ts" module>
	let activeWindow: symbol | undefined = $state();
</script>

<script lang="ts">
	import { Draggable, scrollLock } from '@neodrag/svelte';
	import { MediaQuery } from 'svelte/reactivity';
	let { children, title = undefined, class: className = '' } = $props();

	const id = Symbol();
	const raised = $derived(activeWindow === id);
	const isMobile = new MediaQuery('(max-width: 848px)');

	const drag = new Draggable({
		get disabled() {
			return isMobile.current;
		},
		get touchAction() {
			return isMobile.current ? false : undefined;
		},
		use: [scrollLock()],
		onDragStart() {
			activeWindow = id;
		}
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

<div class="main-window {className}" class:collapsed class:raised {...drag.attach}>
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
	<div class="window-contents panel">
		{@render children()}
	</div>
</div>

<style>
	.main-window {
		position: relative;
		height: fit-content;
		z-index: 2;
	}

	.main-window.raised {
		z-index: 3;
	}

	.window-contents {
		transform-origin: top;
		transform: scaleY(0);
		animation: expand 0.4s cubic-bezier(0.33, 1, 0.68, 1) forwards;
	}

	.main-window.collapsed .window-contents {
		height: 0;
		overflow: hidden;
		visibility: hidden;
		animation: none;
		transform: scaleY(0);
	}

	.panel-header {
		background-color: var(--text-color);
		color: var(--background-color);
		padding: 0px 16px 0px 16px;
		user-select: none;
	}
</style>
