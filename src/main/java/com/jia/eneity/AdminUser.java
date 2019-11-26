package com.jia.eneity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@NoArgsConstructor
@AllArgsConstructor
@Accessors
@Data
public class AdminUser {
    private Integer aid;
    private String name;
    private String username;
    private String password;

}
