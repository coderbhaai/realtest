<template>
    <div class="col-sm-3 mb-5">
        <q-card class="my-card" flat bordered>
            <a :href="'/blog/'+url">
                <img :src="'/images'+fileURL"/>
                <q-card-section>
                    <h2>{{title}}</h2>
                </q-card-section>
            </a>
        </q-card>
    </div>
</template>
<script>
export default {
    props: {
        fileURL: { type: String, required: true, default: '' },
        title: { type: String, required: true, default: '' },
        id: { type: Number, required: true, default: '' },
        url: { type: String, required: true, default: '' },
        index: { type: Number, required: true, default: '' },
    }
}
</script>
