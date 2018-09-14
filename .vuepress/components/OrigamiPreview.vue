<template>
    <div ref="renderer">
    </div>
</template>

<script>
import start from '@origamidl/webgl/src/index'

export default {

    mounted () {
        let renderer = start(this.$refs.renderer)
        renderer.setSize(740, 416)
    }

}
</script>
