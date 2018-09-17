<template>
    <div ref="renderer"></div>
</template>

<script>
export default {

    async mounted () {
        const start = await import('@origamidl/webgl')
        let renderer = start.default(this.$refs.renderer)
        renderer.setSize(420, 300)
    }

}
</script>
