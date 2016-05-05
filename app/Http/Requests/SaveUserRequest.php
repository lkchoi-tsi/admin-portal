<?php

namespace Tsi\Http\Requests;

use Tsi\Http\Requests\Request;
use Tsi\User;

class SaveUserRequest extends Request
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
        $id = $this->route('users');
        \Log::info($this->all());
        return (new User)->rules($id);
    }
}
