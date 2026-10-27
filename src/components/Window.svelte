<script lang="ts">
    import { draggable } from '@neodrag/svelte';
    let { children, title = undefined, class: className = '' } = $props();
</script>

<div class="panel {className}" use:draggable={{ handle: '.panel-header' }}>
    {#if title}
        <div class="panel-header inverted">
            {title}
        </div>
    {/if}
    <div class="contents">
        {@render children()}
    </div>
</div>

<style>
    .panel {
        transform-origin: top;

		transform: scaleY(0);
		animation: expand 0.4s cubic-bezier(0.33, 1, 0.68, 1) forwards;
    }

	.panel-header {
	    background-color: var(--text-color);
		color: var(--background-color);
		padding: 0px 16px 0px 16px;
		user-select: none;
	}
</style>
