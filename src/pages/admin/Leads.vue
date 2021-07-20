<template>
    <div class="q-pa-md">
        <q-table title="Leads" :data="adminLeads" :columns="columns" row-key="id" class="fixedHeader" :pagination.sync="pagination">
            <template v-slot:header="props"><q-tr :props="props" class="xxx"><q-th v-for="col in props.cols" :key="col.name" :props="props">{{ col.label }}</q-th></q-tr></template>
            <template v-slot:body="props">
                <q-tr :props="props">
                    <q-td key="id" :props="props">{{ props.row.id }}</q-td>
                    <q-td key="name" :props="props">{{ props.row.name }}<br/>{{ props.row.email }} | {{ props.row.phone }}</q-td>
                    <q-td key="url" :props="props">{{ props.row.url }}</q-td>
                    <q-td key="status" :props="props">
                        <!-- <q-toggle v-model="props.row.status==1 ? true : false" color="primary" @input="changeStatus(props.row.id, props.row.status)"></q-toggle> -->
                    </q-td>
                    <q-td key="updated_at" :props="props" v-html="refineDate(props.row.updated_at)"></q-td>
                    <q-td><q-icon name="edit" @click="updateDialog(props.row)"/></q-td>
                </q-tr>
            </template>
        </q-table>
        <q-dialog v-model="medium" persistent transition-show="scale" transition-hide="scale">
            <q-card style="width: 70vw; max-width: 80vw;">
                <q-card-section class="modalHead"><div class="text-h6">Update Lead</div><q-btn flat label="Close" color="primary" v-close-popup @click="resetData()"/></q-card-section>
                <q-card-section class="q-pt-none">
                <q-form class="q-gutter-md" @submit="updateSubmit">
                    <div class="row">
                        <div class="col-3 q-pr-lg"><q-input v-model="name" label="Name" readonly/></div>
                        <div class="col-3 q-pr-lg"><q-input v-model="email" label="Email"/></div>
                        <div class="col-3 q-pr-lg"><q-input v-model="phone" label="Phone"/></div>
                        <div class="col-3 q-pr-lg"><q-input v-model="url" label="url"/></div>
                        <div class="col-12 q-pr-lg"><q-input v-model="message" label="Message"/></div>
                        <div class="col-12 q-pr-lg"><q-input v-model="remarks" label="Remarks"/></div>
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
            id : '',
            name : '',
            email : '',
            phone : '',
            url : '',
            status : '',
            message : '',
            remarks : '',
            medium: false,
            columns: [
                { name: 'id', label: 'Sl No.', align: 'left', field: 'Edit', },
                { name: 'name', label: 'Lead', align: 'left', field: 'name', sortable: true, },
                { name: 'url', label: 'URL', align: 'left', field: 'url', sortable: true, },
                { name: 'status', label: 'Status', align: 'left', field: 'status', sortable: true, },
                { name: 'updated_at', label: 'Date', align: 'left', field: 'updated_at', sortable: true, },
                { name: 'id', label: 'Edit', align: 'left', field: 'id', sortable: true, },
            ],
            pagination: { rowsPerPage: 30 },
        };
    },
    methods: {
        resetData() {
            this.id = '';
            this.name = '';
            this.email = '';
            this.phone = '';
            this.url = '';
            this.status = '';
            this.message = '';
            this.remarks = '';
            this.medium = false;
        },
        updateDialog(data) {
            this.id = data.id;
            this.name = data.name;
            this.email = data.email;
            this.phone = data.phone;
            this.url = data.url;
            this.status = data.status;
            this.message = data.message;
            this.remarks = data.remarks;
            this.medium = true;
        },
        updateSubmit(e) {
            e.preventDefault();
            const data = {
                id: this.id,
                status: this.status,
                remarks: this.remarks
            };
            this.$store.dispatch('updateLeads', data);
            this.resetData();
        },
        changeStatus(id, status){
            if(status == 0){ var change = 1 }else{ var change = 0}
            const data = {
                id: id,
                status: change,
            };
            this.$store.dispatch('changeLeadStatus', data);
        },
    },
    computed: {
        ...mapGetters(['adminLeads']),
    },
    created() {
        this.$store.dispatch('adminLeads');
    },
};
</script>
<style>
</style>
