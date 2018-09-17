<template>
    <div class="editor">
        <ClientOnly placeholder="Codemirror loading ...">
            <codemirror
                
                class="codemirror"
                :value="editableCode"
                :options="codemirrorOptions"
            />
        </ClientOnly>

        <origami-preview class="preview" />
    </div>
</template>

<script>
import 'codemirror/lib/codemirror.css'

// For custom language support see
// https://codemirror.net/doc/manual.html#modeapi

let mounted = false

export default {
    
    components: {
        codemirror: () => {
            return new Promise((resolve, reject) => {
                let retries = 0
                let interval = setInterval(async () => {
                    if (++retries > 20) clearInterval(interval)
                    if (!mounted) return

                    clearInterval(interval)
                    let { codemirror } = await import('vue-codemirror')
                    resolve(codemirror)
                }, 20)
            })
        }
    },

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
    },

    mounted () {
        mounted = true
    }

}
</script>

<style lang="stylus">
.editor
  display: flex

.codemirror, .preview
  flex: 1
  max-width: 50%
</style>
