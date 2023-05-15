<?php

namespace App\Models;

use Carbon\Carbon;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    use Sluggable;

    protected $table = "products";
    protected $guarded = ['id'];
    protected $appends = ['quantity_check', 'sale_check', 'price_check'];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }

    public function getIsActiveAttribute($is_active)
    {
        return $is_active ? 'فعال' : 'غیر فعال';
    }

    public function scopeFilter($query)
    {
        if (request()->has('variation')) {
            $query->whereHas('variations', function ($query) {
                foreach (explode('-', request()->variation) as $index => $variation) {
                    if ($index == 0) {
                        $query->where('value', $variation);
                    } else {
                        $query->orWhere('value', $variation);
                    }
                }
            });
        }
        if (request()->has('attr')) {
            foreach (request()->attr as $attr) {
                $query->whereHas('attributes', function ($query) use ($attr) {
                    foreach (explode('-', $attr) as $index => $attrValue) {
                        if ($index == 0) {
                            $query->where('value', $attrValue);
                        } else {
                            $query->orWhere('value', $attrValue);
                        }
                    }
                });
            }
        }
        if (request()->has('sortBy')) {
            $sortBy=request()->sortBy;
            switch ($sortBy){
                case 'max':
                    $query->orderByDesc(
                        ProductVariation::select('price')->whereColumn('product_variations.product_id','products.id')->orderBy('sale_price','desc')->take(1)
                    );
                    break;
                case 'min':
                    $query->orderBy(
                        ProductVariation::select('price')->whereColumn('product_variations.product_id', 'products.id')->orderBy('sale_price', 'asc')->take(1)
                    );
                    break;
                case 'latest':
                    $query->latest();
                    break;
                case 'oldest':
                    $query->oldest();
                    break;
                default:
                    $query;
                    break;

            }
        }

//        dd($query->toSql());

        return $query;
    }

    public function scopeSearch($query)
    {
        $search=request()->search;
        if (request()->has('search')&& trim($search)!=''){

            $query->where('name','LIKE','%'.trim($search).'%');
        }
        return $query;
    }

    public function getQuantityCheckAttribute()
    {
        return $this->variations()->where('quantity', '>', 0)->first() ?? 0;
    }

    public function getPriceCheckAttribute()
    {
        return $this->variations()->where('quantity', '>', 0)->orderBy('price')->first() ?? false;
    }

    public function getSaleCheckAttribute()
    {
        return $this->variations()->where('quantity', '>', 0)->where('sale_price', '!=', null)->where('date_on_sale_from', '<', Carbon::now())->where('date_on_sale_to', '>', Carbon::now())->orderBy('sale_price')->first() ?? false;
    }

    public function tags()
    {
//        many to many relations
        return $this->belongsToMany(Tag::class, 'product_tag');
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }

    public function attributes()
    {
        return $this->hasMany(ProductAttribute::class, 'product_id');
    }

    public function variations()
    {
        return $this->hasMany(ProductVariation::class, 'product_id');
    }

    public function rates()
    {
        return $this->hasMany(ProductRate::class);
    }

    public function approvedComments()
    {
        return $this->hasMany(Comment::class)->where('approved',1);
    }

    public function checkUserWishlist($userId)
    {
        return $this->hasOne(Wishlist::class)->where('user_id',$userId)->exists();
    }

}
