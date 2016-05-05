<?php

namespace Tsi;

use Illuminate\Database\Eloquent\Model;
use Psy\Exception\FatalErrorException;

abstract class AppModel extends Model
{
    /**
     * Run attributes through validation rules
     * @return boolean true if model passes validation
     */
    public function isValid()
    {
        return \Validator::make(
            $this->toArray(),
            $this->rules()
        )->passes();
    }

    /**
     * Get rules for this model
     * @return array    validation rules
     */
    public function rules($id = null)
    {
        // warn if $this->rules not set
        if (!isset($this->rules))
        {
            trigger_error('No rules found for ' . get_class($this), E_USER_WARNING);
        }

        // rules attribute
        $rules = $this->rules ?: [];

        // 
        foreach ($this->rules as $field => $rule)
        {
            $rules[$field] = $this->excludeFromUnique($rule, $id);
        }

        return $rules;
    }

    /**
     * Add "id" for exclusion on "unique" validation rules
     * @param  string $rule validation rule string
     * @return string       validation rule with added id
     */
    private function excludeFromUnique($rule, $id = null)
    {
        // type check
        if (!is_string($rule))
        {
            throw new FatalErrorException('Rule must be a string');
        }

        $id = $id ?: $this->id;

        // if no unique check is found, return the rule as-is
        if (empty($id) || strpos($rule, 'unique:') === false)
        {
            return $rule;
        }

        // add the model id to the unique rule
        return preg_replace(
            '/unique:([a-zA-Z0-9_]+),([a-zA-Z0-9_]+)/',
            '${0}' . ',' . $id,
            $rule
        );
    }
}
