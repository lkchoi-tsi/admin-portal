<?php

namespace Tsi;

trait SearchableTrait
{
    /**
     * Search table by term
     * @param   $term
     * @param  array  $fields
     * @param  array  $select
     * @return Illuminate\Database\Eloquent\Builder
     */
    public static function search($term, $fields = [], $select = ['*'])
    {
        // start new query
        $query = static::query()->select($select);

        $model = (new static);

        // fields on which to search
        $fields = $fields ?: $model->getSearchableFields();

        $relations = $model->relationsToArray();

        // add search to each term
        foreach ($fields as $field)
        {
            if (is_array($field))
            {
                $class = $field['class'];
                $columns = @$field['columns'] ?: [];
                $fk = $field['foreign_key'];

                $ids = $class::search($term, $columns)->pluck($fk);
                $query = $query->orWhereIn('id', $ids);
            }
            else
            {
                $query = $query->orWhere($field, 'like', "%{$term}%");
            }
        }

        return $query;
    }

    /**
     * Get searchable fields
     * 
     * @return array
     */
    public function getSearchableFields()
    {
        return $this->searchable ?: [];
    }

    /**
     * Set searchable fields
     * 
     * @param array
     */
    public function setSearchableFields(array $fields)
    {
        return $this->searchable = $fields;
    }
}