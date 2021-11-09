<?php

declare(strict_types=1);

function accumulate(array $input, callable $accumulator): array
{
    $result = [];
    foreach ($input as $i)
        $result[] = $accumulator($i);
    return $result;
}
