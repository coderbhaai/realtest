<template>
    <div class="q-pa-md">
        <q-table title="Media Files" :data="adminMedia" :columns="columns" row-key="id" class="fixedHeader" :pagination.sync="pagination">
            <template v-slot:header="props"><q-tr :props="props" class="xxx"><q-th v-for="col in props.cols" :key="col.name" :props="props">{{ col.label }}</q-th></q-tr></template>
            <template v-slot:body="props">
                <q-tr :props="props">
                    <q-td key="id" :props="props">{{ props.row.id }}</q-td>
                    <q-td key="fileURL" :props="props" class="previewImg"><img :src="'/images/'+ props.row.fileURL"/></q-td>
                    <q-td key="alt" :props="props">{{ props.row.alt }}</q-td>
                    <q-td key="title" :props="props">{{ props.row.title }}</q-td>
                    <q-td key="description" :props="props">{{ props.row.description }}</q-td>
                    <q-td key="caption" :props="props">{{ props.row.caption }}</q-td>
                    <q-td key="updated_at" :props="props" v-html="refineDate(props.row.updated_at)"></q-td>
                    <q-td><q-icon name="edit" @click="updateDialog(props.row)"/></q-td>
                </q-tr>
            </template>
        </q-table>
        <q-dialog v-model="medium" persistent transition-show="scale" transition-hide="scale">
            <q-card style="width: 70vw; max-width: 80vw;">
                <q-card-section class="modalHead"><div class="text-h6">Update Media</div><q-btn flat label="Close" color="primary" v-close-popup @click="resetData()"/></q-card-section>
                <q-card-section class="q-pt-none">
                <q-form class="q-gutter-md" @submit="updateSubmit">
                    <div class="row">
                        <div class="col-2 q-pr-lg previewImg"><img :src="'/images/'+ this.image"/></div>
                        <div class="col-5 q-pr-lg"><q-input v-model="alt" label="Alt" :rules="[...rules.required]"/></div>
                        <div class="col-5 q-pr-lg"><q-input v-model="title" label="Title"/></div>
                        <div class="col-6 q-pr-lg"><q-input v-model="caption" label="Caption"/></div>
                        <div class="col-6 q-pr-lg"><q-input v-model="description" label="Description"/></div>
                    </div>
                    <div class="text-center"><q-btn label="Submit" type="submit" color="primary" class="q-mr-lg"/></div>
                </q-form>
                </q-card-section>
            </q-card>
        </q-dialog>
    </div>
</template>
<script>
import { mapGetters } from 'vuex';
import {rules, refineDate} from '../../store/functions'

export default {
    data() {
        return {
            rules : rules,
            refineDate: refineDate,
            id: '',
            image: '',
            alt: '',
            title: '',
            description: '',
            caption: '',
            medium: false,
            columns: [
                { name: 'id', label: 'Sl No.', align: 'left', field: 'Edit', },
                { name: 'fileURL', label: 'Media', align: 'left', field: 'fileURL', sortable: true, },
                { name: 'alt', label: 'Alt', align: 'left', field: 'alt', sortable: true, },
                { name: 'title', label: 'Title', align: 'left', field: 'title', sortable: true, },
                { name: 'caption', label: 'Caption', align: 'left', field: 'caption', sortable: true, },
                { name: 'description', label: 'Description', align: 'left', field: 'description', sortable: true, },
                { name: 'updated_at', label: 'Date', align: 'left', field: 'updated_at', sortable: true, },
                { name: 'id', label: 'Edit', align: 'left', field: 'id', sortable: true, },
            ],
            pagination: { rowsPerPage: 30 },
        };
    },
    methods: {
        resetData() {
            this.id = '';
            this.image = '';
            this.alt = '';
            this.title = '';
            this.description = '';
            this.caption = '';
            this.medium = false;
        },
        updateDialog(data) {
            this.id = data.id;
            this.image = data.fileURL;
            this.alt = data.alt;
            this.title = data.title;
            this.description = data.description;
            this.caption = data.caption;
            this.medium = true;
        },
        updateSubmit(e) {
            e.preventDefault();
            const data = {
                id: this.id,
                alt: this.alt,
                title: this.title,
                description: this.description,
                caption: this.caption,
            };
            this.$store.dispatch('updateMedia', data);
            this.resetData();
        },
    },
    computed: {
        ...mapGetters(['adminMedia']),
    },
    created() {
        this.$store.dispatch('adminMedia');
    },
};
</script>
<style>
</style>
