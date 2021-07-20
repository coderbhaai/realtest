<template>
    <div class="col-sm-3">
        <q-card class="my-card" flat bordered>
            <a :href="'/property/'+url">
                <img :src="'/images'+fileURL" :alt="alt"/>
                <q-card-section>
                    <div class="text-h5 q-mt-sm q-mb-xs">{{name}}</div>
                    <div class="text-caption text-grey">{{shortdesc}}</div>
                    <div class="text-overline text-orange-9">Discount: {{discount}}</div>
                </q-card-section>
            </a>
            <q-card-actions>
                <q-btn flat color="dark" label="Check Property" type="a" :href="'/property/'+url"/>
                <q-space />
                <q-btn color="grey" round flat dense :icon="expanded ? 'keyboard_arrow_up' : 'keyboard_arrow_down'" @click="expand(id)"/>
            </q-card-actions>
            <q-slide-transition>
                <div v-show="parseInt(expandedId) == id? true : false">
                    <q-separator />
                    <q-card-section class="text-subitle2">
                        {{ lorem }}
                    </q-card-section>
                </div>
            </q-slide-transition>
        </q-card>
    </div>
</template>
<script>
export default {
    name: 'EssentialLink',
    data () {
        return {
            expanded: false,
            expandedId: '',
            lorem: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
        }
    },
    methods: {
        expand(id){
            if(this.expandedId != id){
                this.expandedId = id;
            }else{
                this.expandedId = '';
            }
        }
    },
    props: {
        fileURL: { type: String, required: true, default: '' },
        name: { type: String, required: true, default: '' },
        shortdesc: { type: String, required: false, default: '' },
        discount: { type: String, required: true, default: '' },
        id: { type: Number, required: true, default: '' },
        url: { type: String, required: true, default: '' },
        alt: { type: String, required: false, default: '' },
    }
}
</script>
