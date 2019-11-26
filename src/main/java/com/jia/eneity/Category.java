package com.jia.eneity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;


@NoArgsConstructor
@AllArgsConstructor
@Accessors
@Data
public class Category {
    private Integer cid;
    private String name;
    private Integer state;
    private Integer order_number;
    private String description;
    private String create_time;
}
