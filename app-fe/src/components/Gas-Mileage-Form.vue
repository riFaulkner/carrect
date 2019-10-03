<template xmlns:v-slot="http://www.w3.org/1999/XSL/Transform">
  <v-dialog v-model="isVisible" max-width="600px">
    <template v-slot:activator=" { on }">
      <v-btn   class="success" v-on="on"> Add Fill Up</v-btn>
    </template>
    <v-card pa-3 >
      <v-container>
        <v-row justify="center">
          <v-card-title >
            <span>Add a New Fill up</span>
          </v-card-title>
        </v-row>

      <v-card-text>
        <v-form px-3>
          <v-select
            v-model="form.car"
            :items="cars"
            label="Car"
            prepend-icon="mdi-car"
            dense
          ></v-select>

          <v-menu
            v-model="datepicker"
            :close-on-content-click="false"
            :nudge-right="40"
            transition="scale-transition"
            offset-y
            full-width
            min-width="290px"
          >
            <template v-slot:activator="{ on }">
              <v-text-field
                v-model="form.date"
                label="Fill Up Date"
                prepend-icon="mdi-calendar-month"
                readonly
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker v-model="form.date" @input="datepicker = false"></v-date-picker>
          </v-menu>

          <v-select
            v-if="!selectedCar.isDiesel"
            v-model="preferredFuelGrade"
            :items="grades"
            label="Gas Grade"
            prepend-icon="mdi-gas-station"
            dense
          > </v-select>
          <v-select
            v-if="selectedCar.isDiesel"
            v-model="preferredFuelGrade"
            :items="diesel"
            label="Gas Grade"
            prepend-icon="mdi-gas-station"
            dense
          ></v-select>
          <v-text-field
            prepend-icon="mdi-currency-usd"
            label="Price per gallon"
            step=".01"
            min="0"
            max="10"
            type="number"
            dense
          > </v-text-field>

          <v-text-field
            prepend-icon="mdi-gauge"
            label="Quantity"
            step="0.001"
            type="number"
            dense
          ></v-text-field>

          <v-text-field
            prepend-icon="mdi-map-marker-distance"
            label="Distance"
            step=".1"
            type="number"
            dense
          ></v-text-field>

          <v-textarea
            label="Notes"
            v-model="form.notes"
            prepend-icon="mdi-notebook"
            dense
          ></v-textarea>

          <v-checkbox
            v-model="form.isFullFillUp"
            :label="`Full Fill Up`"
          ></v-checkbox>

          <v-row row wrap justify="space-between">
              <v-btn text class="success mx-0 mt-3" @click="submit" >Add Fill Up</v-btn>
              <v-btn  class="default mx-3 mt-3" @click="isVisible = false">Cancel</v-btn>
          </v-row>
        </v-form>
      </v-card-text>
      </v-container>
    </v-card>
  </v-dialog>
</template>

<script>
    export default {
        name: "Gas-Mileage-Form",
        data: function() { return {
          isVisible:false,
          datepicker: false,
          grades:this.$store.state.app.fuelGrades,
          diesel: [{value:4, text:"Diesel"}],
          form: {
            car: this.$store.state.userPreferences.preferredCar,
            date: new Date().toISOString().substr(0, 10),
            notes: null,
            isFullFillUp:true
          }
        } },
        computed: {
          cars: function () {
            const cars = [];
            for (const car of this.$store.state.userCars) {
              cars.push({value: car.id, text: car.year + " " + car.make + " " + car.model});
            }
            return cars;
          },
          selectedCar: function () {
            return this.$store.getters.getCarInfo(this.form.car);
          },
          preferredFuelGrade: function () {
            return this.selectedCar.preferredFuelGrade;
          }
        }
        ,
        methods: {
          submit: function (event) {
            console.log("Submit event fired!");
            console.log("Form: ", this.form)
          }
        }

    }
</script>

<style scoped>

</style>
