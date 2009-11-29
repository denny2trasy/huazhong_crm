function check_input_bill(){
    if (check_material() && check_brand()){
        m_amount = document.getElementById("warehouse_voucher_amount");
        unit_price = document.getElementById("warehouse_voucher_unit_price");
        purchaser = document.getElementById("warehouse_voucher_purchaser_id"); 
        if (m_amount.value == "" || unit_price.value == "" || purchaser.value == ""){
            document.getElementById("input_info").firstChild.nodeValue =" Please input amount!";
            document.getElementById("warehouse_voucher_amount").focus();
            return false;
        }      

        if (unit_price.value == ""){
            document.getElementById("input_info").firstChild.nodeValue =" Please input unit price!";
            document.getElementById("warehouse_voucher_unit_price").focus();
            return false;
        }    

        if (purchaser.value == ""){
            document.getElementById("input_info").firstChild.nodeValue =" Please choose purchaser!";
            return false;
        }
        return true;
    }
    return false;    
}


function check_output_bill(){
    if (check_material() && check_brand()){
        m_amount = document.getElementById("warehouse_voucher_amount");
        unit_price = document.getElementById("warehouse_voucher_unit_price");
        purchaser = document.getElementById("warehouse_voucher_purchaser_id"); 
        if (m_amount.value == "" || unit_price.value == "" || purchaser.value == ""){
            document.getElementById("input_info").firstChild.nodeValue =" Please input amount!";
            document.getElementById("warehouse_voucher_amount").focus();
            return false;
        }      

        if (unit_price.value == ""){
            document.getElementById("input_info").firstChild.nodeValue =" Please input unit price!";
            document.getElementById("warehouse_voucher_unit_price").focus();
            return false;
        }    

        if (purchaser.value == ""){
            document.getElementById("input_info").firstChild.nodeValue =" Please choose purchaser!";
            return false;
        }
        return true;
    }
    return false;    
}


function check_material(){
    m_type = document.getElementById("material_m_type");
    m_class = document.getElementById("material_m_class");
    sub_class = document.getElementById("material_sub_class");
    diameter = document.getElementById("material_diameter");
    if (m_type.value == "" || m_class.value == "" || sub_class.value == "" || diameter.value == ""){
        document.getElementById("material_info").firstChild.nodeValue =" Please choose material!";
        return false;       
    }
    return true;    
}

function check_brand(){
    b_name = document.getElementById("brand_name");
    b_style = document.getElementById("brand_style");
    b_capacity = document.getElementById("brand_capacity");
    if (b_name.value == "" || b_style.value == "" || b_capacity.value == ""){
        document.getElementById("brand_info").firstChild.nodeValue =" Please choose brand!";
        return false;       
    }
    return true;    
}