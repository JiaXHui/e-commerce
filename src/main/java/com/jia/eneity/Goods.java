package com.jia.eneity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;


@NoArgsConstructor
@AllArgsConstructor
@Accessors
@Data
public class Goods {
    private Integer gid;
    private String  name;
    private Double price;
    private String  description;
    private String  picture;
    private String  product_date;
    private Integer cid;
    private Category category;
}
