<template>
  <nav >
    <v-navigation-drawer v-model="sideNav" app dark >
      <v-layout column align-center>
        <v-flex >
          <v-divider />
        </v-flex>
        <v-flex mt-5 mb-3>
          <AddFillUp/>
        </v-flex>
      </v-layout>
     <v-list dense>
       <v-list-item v-for="link in links" :key="link.text" router :to="link.route">
         <v-list-item-action>
           <v-icon> {{link.icon}}</v-icon>
        </v-list-item-action>
        <v-list-item-content>
          <v-list-item-title>{{link.text}}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>

  <v-app-bar app dark>
    <v-app-bar-nav-icon @click.stop="sideNav = !sideNav"></v-app-bar-nav-icon>
    <v-toolbar-title class="text-center">CARrect</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items class="d-none d-sm-flex">
      <v-btn text v-if="isLoggedIn"> <v-icon left>mdi-logout</v-icon>Logout</v-btn>
      <v-btn text v-if="!isLoggedIn"> <v-icon left>mdi-login</v-icon>Login</v-btn>
    </v-toolbar-items>
  </v-app-bar>
  </nav>
</template>

<script>
import AddFillUp from "./Gas-Mileage-Form";
    export default {
        name: "Navbar",
        components: {
          AddFillUp
        },
        data:() => ({
          sideNav:true,
          links: [
            { icon: "mdi-home", text:"Home", route:"/"},
            { icon: "mdi-gas-station", text:"Add a fill up", route: "/mileage"},
            { icon: "mdi-car", text:"Cars", route: "/Cars"},
            { icon: "mdi-account", text:"Account", route: "/Account"}
          ]
        }),
        computed: {
          isLoggedIn: function () {
            return this.$store.state.loggedIn;
          }
        }

    }
</script>

<style scoped>

</style>
