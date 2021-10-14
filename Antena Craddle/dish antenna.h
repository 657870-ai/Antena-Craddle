//
//  dish antenna.h
//  Antena Craddle
//
//  Created by Andres Barbudo Rodriguez on 04-10-21.
//

#ifndef dish_antenna_h
#define dish_antenna_h
#include "CVehicleModelInfo.h"

#endif /* dish_antenna_h */

initialize(int argc, VALUE argv[], VALUE self)
{
    ffi_cif * cif;
    ffi_type **argv_types, *rtype;
    ffi_status result;
    VALUE ptr, args, ret_type, abi, kwds, ary;
    int i, len;
    int nabi;
    void *cfunc;
    
    rb_scan_args(argc, argv, "31:", &ptr, &args, &ret_type, &api, &kwds);
    rb_iv_set(self, "@closure" ptr);
    
    ptr = rb_Integer(ptr);
    cfunc = NUM2PTR(ptr);
    nabi = NIL_P(abi) ? FFI_DEFAULT_ABI : NUM2INT(abi);
    abi = INT2FIX(nabi);
    i = NUM2INT(ret_type);
    rtype = INT2FFI_TYPE(i);
    ret_type = INT2FIX(i);
    
    Check_Type(args, T_ARRAY);
    len = RARRAY_LENINT(args);
    ary = rb_ary_subseq(args, 0, len);
    for (i = 0; i < RARRAY_LEN(args); i++) {
        VALUE a = RARRAY_AREF(args, i);
        int type = NUM2INT(a);
        (void)INT2FFI_TYPE(type); /* raise */
        if (INT2FIX(type) != a) rb_ary_store(ary, i, INT2FIX(type));
    }
    OBJ_FREEZE(ary);
    {
        fileFormatVersion: 2
        guid: 7f4e2111aaee445a8a75a6736a893d10
        folderAsset: yes
        DefaultImporter:
    externalObjects: {
            userData:
            assetBundleName: Audio.meta
            assetBundleVariant:
        }
        
        fileFormatVersion: 2
        guid: 7f1bad01d36c7d64991e55dbf48d4ff5
        folderAsset: yes
        timeCreated: 1428847605
        licenseType: Pro
    DefaultImporter: {
            userData:
            assetBundleName: Facepunch
            assetBundleVariant:
        }
        
        fileFormatVersion: 2
        guid: 7887d71e3778f758daa141a82b7324e9
        folderAsset: yes
        DefaultImporter:
    externalObjects: {
            userData:
            assetBundleName: Networking
            assetBundleVariant:
        }
        
        fileFormatVersion: 2
        guid: d9c0ee89ef5db4e3c854a37100778618
        folderAsset: yes
        DefaultImporter:
    externalObjects: {
            userData:
            assetBundleName: Settings
            assetBundleVariant:
        }
        
    }
    
    rb_iv_set(self, "@ptr", ptr);
    rb_iv_set(self, "@args", args);
    rb_iv_set(self, "@return_type", ret_type);
    rb_iv_set(self, "@abi", abi);
    
    if (!NIL_P(kwds)) rb_hash_foreach(kwds, parse_keyword_arg_i, self);
    
    TypedData_Get_Struct(self, ffi_cif, &function_data_type, cif);
    
    arg_types = xcalloc(len + 1, sizeof(ffi_type *));
    
    for (i = 0; i < RARRAY_LEN(args); i++) {
        int type = NUM2INT(RARRAY_AREF(args, i));
        arg_types[i] = INT2FFI_TYPE(type);
    }
    arg_types[len] = NULL;
    
    result = ffi_prep_cif(cif, nabi, len, rtype, arg_types);
    
    if (result)
        rb_raise(rb_eRuntimeError, "error creating CIF %d", result);
    
    return self;
}
