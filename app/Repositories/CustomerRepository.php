<?php

namespace App\Repositories;

use App\Models\Address;
use App\Models\City;
use App\Models\Contact;
use App\Models\Country;
use App\Models\Customer;
use App\Models\CustomerAttachment;
use App\Models\CustomerGroup;
use App\Models\CustomerToCustomerGroup;
use App\Models\Lead;
use App\Models\Note;
use App\Models\Permission;
use App\Models\Reminder;
use App\Models\Role;
use App\Models\State;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

/**
 * Class CustomerRepository
 *
 * @version April 3, 2020, 6:37 am UTC
 */
class CustomerRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'company_name',
        'vat_number',
        'phone',
        'website',
        'currency',
    ];

    /**
     * Return searchable fields
     *
     * @return array
     */
    public function getFieldsSearchable()
    {
        return $this->fieldSearchable;
    }

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Customer::class;
    }

    /**
     * @return array
     */
    public function getSyncList()
    {
        $data = [];
        $data['customerGroups'] = CustomerGroup::orderBy('name', 'asc')->pluck('name', 'id')->toArray();
        $data['currencies'] = Customer::CURRENCIES;
        $data['languages'] = Customer::LANGUAGES;
        $data['countries'] = Country::orderBy('name', 'asc')->pluck('name', 'id')->toArray();
        $data['cities'] = City::orderBy('city_name', 'asc')->pluck('city_name', 'id')->toArray();
        $data['states'] = State::orderBy('state_name', 'asc')->pluck('state_name', 'id')->toArray();

        return $data;
    }

    /**
     * @param  array  $input
     * @return bool|Model
     */
    public function create($input)
    {
        $customer = new Customer();
        $customer->customer_code =    isset($input['customer_code']  )  && !empty($input['customer_code']  )  ? $input['customer_code'] : '';
        $customer->customer_name =    isset($input['customer_name']  )  && !empty($input['customer_name']  )  ? $input['customer_name'] : '';
        $customer->short_name =       isset($input['short_name']     )  && !empty($input['short_name']     )  ? $input['short_name'] : '';
        $customer->default_n =        isset($input['default_n']      )  && !empty($input['default_n']      )  ? $input['default_n'] : 0;
        $customer->vat_number =       isset($input['vat_number']     )  && !empty($input['vat_number']     )  ? $input['vat_number'] : '';
        $customer->credit_limit =     isset($input['credit_limit']   )  && !empty($input['credit_limit']   )  ? $input['credit_limit'] : '';
        $customer->previous_dues =    isset($input['previous_dues']  )  && !empty($input['previous_dues']  )  ? $input['previous_dues'] : '';
        $customer->phone =            isset($input['phone']          )  && !empty($input['phone']          )  ? $input['phone'] : '';
        $customer->mobile =           isset($input['mobile']         )  && !empty($input['mobile']         )  ? $input['mobile'] : '';
        $customer->email =            isset($input['email']          )  && !empty($input['email']          )  ? $input['email'] : '';
        $customer->website =          isset($input['website']        )  && !empty($input['website']        )  ? $input['website'] : '';
        $customer->currency =         isset($input['currency']       )  && !empty($input['currency']       )  ? $input['currency'] : '';
        $customer->street =           isset($input['street']         )  && !empty($input['street']         )  ? $input['street'] : '';
        $customer->city =             isset($input['city']           )  && !empty($input['city']           )  ? $input['city'] : '';
        $customer->state =            isset($input['state']          )  && !empty($input['state']          )  ? $input['state'] : '';
        $customer->zip =              isset($input['zip']            )  && !empty($input['zip']            )  ? $input['zip'] : '';
        $customer->country =          isset($input['country']        )  && !empty($input['country']        )  ? $input['country'] : '';
        $customer->default_language = isset($input['default_language']) && !empty($input['default_language']) ? $input['default_language'] : '';
        $customer->location_link =    isset($input['location_link']  )  && !empty($input['location_link']  )  ? $input['location_link'] : '';
        $customer->is_supplier =      isset($input['is_supplier']    )  && !empty($input['is_supplier']    )  ? $input['is_supplier'] : 0;
        $customer->save();

        if (isset($input['groups']) && ! empty(array_filter($input['groups']))) {
            foreach ($input['groups'] as $group) {
                CustomerToCustomerGroup::create([
                    'customer_id' => $customer->id,
                    'customer_group_id' => $group,
                ]);
            }
        }

        return $customer;
    }

    /**
     * @param  Customer  $customer
     * @param  bool  $isEdit
     * @return array
     */
    public function prepareAddress($customer, $isEdit = false)
    {
        $query = Address::with('addressCountry')->whereOwnerType(Customer::class)->whereOwnerId($customer->id)->get();
        $billingAddress = $query->where('type', '=', Address::ADDRESS_TYPES[1])->first();

        if ($billingAddress != null && ! $isEdit) {
            $billingAddress->country = $billingAddress->country != null ? $billingAddress->addressCountry->name : null;
        }

        $shippingAddress = $query->where('type', '=', Address::ADDRESS_TYPES[2])->first();

        if ($shippingAddress != null && ! $isEdit) {
            $shippingAddress->country = $shippingAddress->country != null ? $shippingAddress->addressCountry->name : null;
        }

        return [$billingAddress, $shippingAddress];
    }

    /**
     * @param  Customer  $customer
     * @return Customer
     */
    public function prepareCustomerData($customer)
    {
        $customer->currency = $customer->currency != null ? Customer::CURRENCIES[$customer->currency] : null;
        $customer->default_language = $customer->default_language != null ? Customer::LANGUAGES[$customer->default_language] : null;
        $customer->country = $customer->country != null ? $customer->customerCountry->name : null;

        return $customer;
    }

    /**
     * @param  array  $input
     * @param  Customer  $customer
     * @return bool
     *
     * @throws Exception
     */
    public function update($input, $customer)
    {
        $customer->customer_code =    isset($input['customer_code']  )  && !empty($input['customer_code']  )  ? $input['customer_code'] : '';
        $customer->customer_name =    isset($input['customer_name']  )  && !empty($input['customer_name']  )  ? $input['customer_name'] : '';
        $customer->short_name =       isset($input['short_name']     )  && !empty($input['short_name']     )  ? $input['short_name'] : '';
        $customer->default_n =        isset($input['default_n']      )  && !empty($input['default_n']      )  ? $input['default_n'] : 0;
        $customer->vat_number =       isset($input['vat_number']     )  && !empty($input['vat_number']     )  ? $input['vat_number'] : '';
        $customer->credit_limit =     isset($input['credit_limit']   )  && !empty($input['credit_limit']   )  ? $input['credit_limit'] : '';
        $customer->previous_dues =    isset($input['previous_dues']  )  && !empty($input['previous_dues']  )  ? $input['previous_dues'] : '';
        $customer->phone =            isset($input['phone']          )  && !empty($input['phone']          )  ? $input['phone'] : '';
        $customer->mobile =           isset($input['mobile']         )  && !empty($input['mobile']         )  ? $input['mobile'] : '';
        $customer->email =            isset($input['email']          )  && !empty($input['email']          )  ? $input['email'] : '';
        $customer->website =          isset($input['website']        )  && !empty($input['website']        )  ? $input['website'] : '';
        $customer->currency =         isset($input['currency']       )  && !empty($input['currency']       )  ? $input['currency'] : '';
        $customer->street =           isset($input['street']         )  && !empty($input['street']         )  ? $input['street'] : '';
        $customer->city =             isset($input['city']           )  && !empty($input['city']           )  ? $input['city'] : '';
        $customer->state =            isset($input['state']          )  && !empty($input['state']          )  ? $input['state'] : '';
        $customer->zip =              isset($input['zip']            )  && !empty($input['zip']            )  ? $input['zip'] : '';
        $customer->country =          isset($input['country']        )  && !empty($input['country']        )  ? $input['country'] : '';
        $customer->default_language = isset($input['default_language']) && !empty($input['default_language']) ? $input['default_language'] : '';
        $customer->location_link =    isset($input['location_link']  )  && !empty($input['location_link']  )  ? $input['location_link'] : '';
        $customer->is_supplier =      isset($input['is_supplier']    )  && !empty($input['is_supplier']    )  ? $input['is_supplier'] : 0;
        $customer->save();

        if (! empty($input['groups'])) {
            $customer->customerGroups()->sync($input['groups']);
        }

        return $customer;
    }

    /**
     * @param  int  $customerId
     * @param  array  $address
     * @param $addressType
     * @return bool
     */
    public function createAddress($customerId, $address, $addressType)
    {
        $ownerId = $customerId;
        $ownerType = Customer::class;
        Address::create(array_merge($address,
            ['owner_id' => $ownerId, 'owner_type' => $ownerType, 'type' => $addressType]));

        return true;
    }

    /**
     * @return int
     */
    public function customerCount()
    {
        return Customer::selectRaw('count(*) as total_customers')->first();
    }

    /**
     * @param  int  $id
     * @param  string  $class
     * @return array
     */
    public function getReminderData($id, $class)
    {
        $data = [];
        $data['reminderTo'] = Contact::whereCustomerId($id)->with('user')->get()->where('user.is_enable', '=',
            true)->pluck('user.full_name', 'user.id')->toArray();
        $data['ownerId'] = $id;

        foreach (Reminder::REMINDER_MODULES as $key => $value) {
            if ($value == $class) {
                $data['moduleId'] = $key;
                break;
            }
        }

        return $data;
    }

    /**
     * @param $customer
     * @return mixed
     */
    public function getNoteData($customer)
    {
        return Note::with('user.media')->where('owner_id', '=', $customer->id)
            ->where('owner_type', '=', Customer::class)->orderByDesc('created_at')->get();
    }

    /**
     * @param $searchData
     * @return mixed
     */
    public function searchCustomerData($searchData)
    {
        return Customer::where('company_name', 'LIKE', '%'.$searchData.'%')->get();
    }

    /**
     * @param $input
     */
    public function addCustomerAddress($input)
    {
        $addressInputArray = Arr::only($input, ['street', 'city', 'state', 'zip', 'country']);
        $addressArray = Address::prepareInputForAddress($addressInputArray);
        $isBillingAddressEmpty = Address::containsOnlyNull($addressArray[1]);
        $isShippingAddressEmpty = Address::containsOnlyNull($addressArray[2]);
        $ownerId = $input['customer_id'];

        if (! $isBillingAddressEmpty) {
            $this->createAddress($ownerId, $addressArray[1], Address::ADDRESS_TYPES[1]);
        }

        if (! $isShippingAddressEmpty) {
            $this->createAddress($ownerId, $addressArray[2], Address::ADDRESS_TYPES[2]);
        }

        return true;
    }

    /**
     * @param $input
     * @return bool
     */
    public function leadConvertToCustomer($input)
    {
        $leadConvertCustomerUpdate = Lead::whereId($input['lead_id'])->update([
            'lead_convert_customer' => true, 'lead_convert_date' => Carbon::now()->format('Y-m-d'),
        ]);
        $customer = Customer::create($input);
        $input['password'] = Hash::make($input['password']);

        if (isset($input['groups']) && ! empty(array_filter($input['groups']))) {
            foreach ($input['groups'] as $group) {
                CustomerToCustomerGroup::create([
                    'customer_id' => $customer->id,
                    'customer_group_id' => $group,
                ]);
            }
        }

        /* @var  User $user */
        $user = User::create([
            'first_name' => $input['company_name'],
            'email' => $input['email'],
            'password' => $input['password'],
        ]);

        $roles = Role::whereName('client')->first()->id;
        $user->roles()->sync($roles);

        /** @var Contact $contact */
        $contact = Contact::create([
            'customer_id' => $customer->id,
            'user_id' => $user->id,
        ]);

        Contact::whereCustomerId($customer->id)->update(['primary_contact' => true]);

        $permissions = Permission::whereType('Contacts')->get();
        $user->permissions()->sync($permissions);

        $user->update(['owner_id' => $contact->id, 'owner_type' => Contact::class]);
        $contact->update(['user_id' => $user->id]);

        return true;
    }
}
