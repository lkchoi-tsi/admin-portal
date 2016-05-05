<?php

namespace Tsi\Http\Requests;

use Illuminate\Http\Request;

class DataTableRequest
{
    /**
     * Request to be wrapped
     * @var Tsi\Http\Requests\Request
     */
    protected $request;
    protected $columns;

    public function __construct(Request $request)
    {
        if (empty($request->get('_dt')))
        {
            throw new \InvalidArgumentException(
                "Set parameter _dt=1 for datatable request"
            );
        }
        $this->request = $request;
    }

    public static function create(Request $request)
    {
        return new static($request);
    }

    public function length()
    {
        return $this->request->length;
    }

    public function page()
    {
        return intval($this->request->start/$this->request->length)+1;
    }

    public function draw()
    {
        return intval($this->request->get('draw'));
    }

    public function columns()
    {
        return array_column($this->request->columns ?: [], 'data');
    }

    public function searchTerm()
    {
        return $this->request->search['value'];
    }

    public function hasSearchTerm()
    {
        return !empty($this->request->search['value']);
    }

    public function order()
    {
        $order = [];
        $columns = $this->columns();

        foreach ($this->request->order as $o)
        {
            $offset = intval($o['column']);
            $dir = $o['dir'];
            $key = $columns[$offset];
            $order[$key] = $dir;
        }

        return $order;
    }

    public function column($offset)
    {
        $columns = $this->columns();
        $offset = intval($offset);
        return $columns[$offset];
    }
}
