<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductVariation extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $table = 'product_variations';
    protected $appends = ['is_sale', 'percent_sale'];


    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }

    public function getIsSaleAttribute()
    {
        return (($this->sale_price != null) && ($this->date_on_sale_from < Carbon::now()) && ($this->date_on_sale_to > Carbon::now())) ? true : false;
    }

    public function getPercentSaleAttribute()
    {
        return $this->is_sale ? round((($this->price - $this->sale_price) / $this->price) * 100) : 'dd';
    }
}
