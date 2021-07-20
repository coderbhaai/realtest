<template>
    <div class="homeBlogs container my-5">
        <div class="row">
            <div class="col-sm-12">
                <q-card>
                    <q-tabs v-model="tab" class="text-white" align="justify" narrow-indicator>
                        <q-tab :name="i.id" v-for="i,index in userPropTypeOptions" :key="index" 
                        :label="i.name" 
                        :v-if="homeBlogs.filter(j=>j.type == i.id).length"
                        />
                    </q-tabs>
                    <!-- v-if="homeBlogs.filter(j=>j.type == i.id).length"
                    :label="i.name" -->
                    <q-separator />
                    <q-tab-panels v-model="tab" animated class="bg-purple-1 text-center">
                        <q-tab-panel :name="i.id" v-for="i,index in userPropTypeOptions" :key="index">
                            <div class="row homeBlogList">
                                <PropertyCardItem v-for="j,index2 in homeBlogs.filter(j=>j.type == i.id).slice(0,4)" :key="index2" v-bind="j"/>
                            </div>
                        </q-tab-panel>
                    </q-tab-panels>
                </q-card>
            </div>
        </div>
    </div>
</template>
<script>
import { mapGetters} from 'vuex';
import PropertyCardItem from 'components/PropertyCardItem.vue'

export default {
    components: { PropertyCardItem },
    data () {
        return {
            tab: '',
            blogs: [],
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
    computed: {
        ...mapGetters(['homeBlogs', 'userPropTypeOptions' ]),
    },
    created() {
        this.$store.dispatch('getHomeBlogs');
        if(this.$store.getters.userPropTypeOptions[0]){
            this.tab = this.$store.getters.userPropTypeOptions[0].id
        }else{
        }
    },
};
</script>
<style>
</style>
