<template>
    <section class="subscribe">
        <div class="subs">
            <div>
                <h3>Subscribe to Our Newsletter</h3>
                <p>Keep yourself informed</p>
            </div>
            <q-form @submit="onSubmit">
                <div>
                    <q-input v-model="name" label="Name" :rules="[...rules.required]"/>
                    <q-input v-model="email" label="Email" :rules="[...rules.required]"/>
                </div>
                <button class="amitBtn">Subscribe Now</button>
            </q-form>
        </div>
    </section>
</template>
<script>
import { mapGetters } from 'vuex';
import {rules} from '../store/functions'

export default {
    data() {
        return {
        rules : rules,
        name: '',
        email: ''
        };
    },
    methods: {
        onSubmit(e) {
            e.preventDefault();
            const data = {
                name: this.name,
                email: this.email
            }
            this.$store.dispatch('subscribe', data);
        },
    },
    computed: {
        ...mapGetters(['user']),    
    }, 
    created() {
        // if(this.user.role){
        //     this.name = this.user.name
        //     this.email = this.user.email
        // }
    },
}
</script>