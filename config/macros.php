<?php

use Illuminate\Support\Collection;
use Psy\Exception\ErrorException;

Collection::macro('divide', function ($n) {
    if (!is_int($n) || $n < 1)
    {
        throw new ErrorException('Number of chunks must be positive integer');
    }
    $size = ceil($this->count() / $n);
    return $this->chunk($size);
});