<template>
    <div>
        <q-card class="my-card q-mb-lg">
            <q-card-section>
                <q-form class="q-gutter-md q-mb-lg" @submit="onSubmit">
                    <h2 class="heading">{{title}}</h2>
                    <p class="text-center">{{para}}</p>
                    <div class="row q-pb-lg">
                        <div class="col-12"><q-input v-model="name" label="Name" :rules="[...rules.required]"/></div>
                        <div class="col-6 q-pr-lg"><q-input v-model="email" label="Email" :rules="[...rules.required]"/></div>
                        <div class="col-6"><q-input v-model="phone" label="Phone" :rules="[...rules.required]"/></div>
                        <div class="col-12 q-pr-lg"><q-input v-model="message" label="Message" type="textarea"/></div>
                    </div>
                    <div class="text-center"><q-btn label="Connect for More" type="submit" color="primary" class="q-mr-lg" /></div>
                </q-form>
            </q-card-section>
        </q-card>
    </div>
</template>

<script>
import {rules} from '../../store/functions'

export default {
    data() {
    return {
      rules : rules,
      name: '',
      email: '',
      phone: '',
      message: '',
      url: this.$route.path
    };
  },
  methods: {
    onSubmit(e) {
      e.preventDefault();
      const data ={
          name:                 this.name,
          email:                this.email,
          phone:                this.phone,
          message:              this.message,
          url:                  this.url,
      }
      this.$store.dispatch('addLeads', data);
      this.resetData();
    },
    resetData() {
      this.name = '';
      this.email = '';
      this.phone = '';
      this.message = 0;
    },
  },
  props: {
      title: { type: String, required: false, default: '' },
      para: { type: String, required: false, default: '' },
  }
 
}
</script>