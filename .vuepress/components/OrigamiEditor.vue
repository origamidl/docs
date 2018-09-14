<template>
    <div>
        <codemirror
            :value="editableCode"
            :options="codemirrorOptions"
        />
        <origami-preview />
    </div>
</template>

<script>
import { codemirror } from 'vue-codemirror'
import 'codemirror/lib/codemirror.css'

// For custom language support see
// https://codemirror.net/doc/manual.html#modeapi

export default {

    components: { codemirror },
    
    props: ['code'],

    data () {
        return {
            editableCode: this.code,
            codemirrorOptions: {
                tabSize: 4,
                mode: 'text/origami',
                theme: 'base16-light',
                lineNumbers: true,
                line: true
            }
        }
    }

}
</script>

<style lang="stylus">

</style>
