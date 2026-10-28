<script lang="ts">
  import {
    draggable,
    axis,
    bounds,
    BoundsFrom,
    events,
  } from '@neodrag/svelte';
    let { children, title = undefined, class: className = '' } = $props();

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

<div class="panel {className}" class:collapsed {@attach draggable()}>
    {#if title}
        <div
            class="panel-header inverted"
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
