package com.jia.eneity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @ClassName : User
 * @Author : 贾晓辉
 * @Date : 2019/11/19 16:02
 * @introduce :
 **/

@NoArgsConstructor
@AllArgsConstructor
@Accessors
@Data
public class User {
    private Integer uid;
    private String name;
    private Integer sex;
    private String phone_number;
    private String photo;
    private String create_time;
}
