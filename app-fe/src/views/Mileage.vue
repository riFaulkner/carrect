<template>
    <div>
        <v-container >

            <v-row row warp justify-center>
                <v-col xs10>
                    <h1 class="subheading grey--text text-center">Fill Ups</h1>
                </v-col>
            </v-row>

            <v-row row wrap>
                <v-col xs11 md6 justify-center>
                    <GasMileageForm/>
                </v-col>
            </v-row>
            <br/>
            <v-row>
                <v-col>
                    HOLD OTHER ITEMS HERE
                </v-col>
            </v-row>
        </v-container>
    </div>
</template>

<script>
import GasMileageForm from "@/components/Gas-Mileage-Form.vue";
    export default {
        name: 'Mileage',
        components: {
            GasMileageForm
        },
        data:() => ({
            text:null,
            notes:null,


        }),
        methods: {
            submit() {
                console.log(this.text, this.notes);
            }
        }
    }
</script>

<style scoped>

</style>
