<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order_detail extends Model
{
    
    protected $fillable = ['order_code', 'product_code', 'quantity', 'price', 'created_at', 'updated_at'];
}
