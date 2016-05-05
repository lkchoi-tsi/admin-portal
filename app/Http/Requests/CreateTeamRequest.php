<?php

namespace Tsi\Http\Requests;

use Tsi\Http\Requests\Request;

class CreateTeamRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required',
            'manager_id' => 'required|integer|min:1'
        ];
    }
}
