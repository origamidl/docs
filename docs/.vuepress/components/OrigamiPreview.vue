<template>
    <div ref="renderer"></div>
</template>

<script>
export default {

    async mounted () {
        let { default: Runtime } = await import('@origamidl/webgl')
        let runtime = new Runtime()

        let renderer = runtime.render(this.$refs.renderer, 420, 300)
    }

}
</script>
