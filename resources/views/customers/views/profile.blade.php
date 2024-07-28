@extends('customers.show')
@section('section')
    {{-- <ul class="nav nav-tabs mb-3" id="customer" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="customerDetails" data-toggle="tab" href="#cDetails" role="tab"
                   aria-controls="home" aria-selected="true">{{ __('messages.customer.customer_details') }}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="#addressDetails" data-toggle="tab" href="#aDetails" role="tab"
                   aria-controls="profile"
                   aria-selected="false">{{ __('messages.customer.address_details') }}</a>
            </li>
    </ul> --}}
    <div class="row">
        <div class="col-lg-12 pull-right">
            <input type="button" class="btn btn-primary float-right" value="Print" onclick='printtag("myTabContent2");'>
        </div>
    </div>

    <div class="tab-content" id="myTabContent2">
        <div class="tab-pane fade show active" id="cDetails" role="tabpanel" aria-labelledby="customerDetails">
            <div class="row">
                <div class="form-group col-sm-3">
                    {{ Form::label('customer_code', __('messages.customer.customer_code').':') }}
                    <p>{{ html_entity_decode($customer->customer_code) }}</p>
                </div>
                <div class="form-group col-sm-6 text-center">
                    {{ Form::label('customer_name', __('messages.customer.customer_name').':') }}
                    <p>{{ html_entity_decode($customer->customer_name) }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('short_name', __('messages.customer.short_name').':') }}
                    <p>{{ html_entity_decode($customer->short_name) }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('default_n', __('messages.customer.default_n').':') }}
                    <p>{{ html_entity_decode($customer->default_n==1 ? 'Yes' : 'No') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('groups', __('messages.customer.groups').':') }}
                    <p>
                        @forelse($customerGroups as $customerGroup)
                            <span class="badge border border-secondary mb-1">{{ html_entity_decode($customerGroup) }}</span>
                        @empty
                            {{ __('messages.common.n/a') }}
                        @endforelse
                    </p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('currency', __('messages.customer.currency').':') }}
                    <p>{{ html_entity_decode( $customer->currency) }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('phone', __('messages.customer.phone').':') }}
                    <p>{{ html_entity_decode($customer->phone) }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('mobile', __('messages.customer.mobile').':') }}
                    <p>{{ html_entity_decode($customer->mobile) }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('email', __('messages.customer.email').':') }}
                    <p>{{ html_entity_decode($customer->email) }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('website', __('messages.customer.website').':') }}
                    <p>{{ html_entity_decode($customer->website) }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('default_language', __('messages.customer.default_language').':') }}
                    <p>{{ html_entity_decode($customer->default_language) }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('street', __('messages.customer.street').':') }}
                    <p>{{ !empty($customer->street)?$customer->street : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('city', __('messages.customer.city').':') }}
                    <p>{{ !empty($customer->city)?$customer->customerCity->city_name : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('zip', __('messages.customer.zip').':') }}
                    <p>{{ !empty($customer->zip)?$customer->zip : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('state', __('messages.customer.state').':') }}
                    <p>{{ !empty($customer->state)?$customer->customerState->state_name : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('country', __('messages.customer.country').':') }}
                    <p>{{ !empty($customer->country)?$customer->country : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('vat_number', __('messages.customer.vat_number').':') }}
                    <p>{{ !empty($customer->vat_number)?$customer->vat_number : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('credit_limit', __('messages.customer.credit_limit').':') }}
                    <p>{{ !empty($customer->credit_limit)?$customer->credit_limit : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('previous_dues', __('messages.customer.previous_dues').':') }}
                    <p>{{ !empty($customer->previous_dues)?$customer->previous_dues : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('location_link', __('messages.customer.location_link').':') }}
                    <p>{{ !empty($customer->location_link)?$customer->location_link : __('messages.common.n/a') }}</p>
                </div>
                <div class="form-group col-sm-3">
                    {{ Form::label('is_supplier', __('messages.customer.is_supplier').':') }}
                    <p>{{ !empty($customer->is_supplier)?($customer->is_supplier==1? 'Yes': 'No') : __('messages.common.n/a') }}</p>
                </div>
            </div>
    {{-- @include('customers.address-modal') --}}
@endsection
