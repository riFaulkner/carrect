package com.rifaulkner.carrect.users;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;


class UserTransformerTest {

    @Test
    void userEntityToUserDto() {
       assertThat(UserTransformer.userEntityToUserDto(getUserEntity()).equals(getUserEntity()));
    }

    @Test
    void userDtoToUserEntity() {
        assertThat(UserTransformer.userDtoToUserEntity(getUserDto()).equals(getUserDto()));
    }


    private UserDto getUserDto() {
        UserDto userDto = new UserDto();

        userDto.setId(1);
        userDto.setFirstName("First");
        userDto.setLastName("Last");

        return userDto;
    }

    private UserEntity getUserEntity() {
        UserEntity userEntity = new UserEntity();

        userEntity.setId(1L);
        userEntity.setFirstName("First");
        userEntity.setLastName("Last");

        return userEntity;
    }
}