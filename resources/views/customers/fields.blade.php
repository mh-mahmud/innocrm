
<div class="tab-content" id="myTabContent2">
    <div class="tab-pane fade show active" id="cForm" role="tabpanel" aria-labelledby="customerForm">
        <div class="row">
            <div class="form-group col-md-3 col-sm-12">
                <label for="customer_code">{{__('messages.customer.customer_code').':'}}<span
                    class="required">*</span></label>
                <input type="text" name="customer_code" value="{{old('customer_code')}}" class="form-control" id="customer_code" autocomplete="off" placeholder="{{__('messages.customer.customer_code')}}" autofocus required>
            </div>
            <div class="form-group col-md-6 col-sm-12">
                <label for="customer_name">{{__('messages.customer.customer_name').':'}}<span
                    class="required">*</span></label>
                <input type="text" name="customer_name" value="{{old('customer_name')}}" class="form-control" id="customer_name" autocomplete="off" placeholder="{{__('messages.customer.customer_name')}}" required>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="short_name">{{__('messages.customer.short_name').':'}}<span
                    class="required">*</span></label>
                <input type="text" name="short_name" value="{{old('short_name')}}" class="form-control" id="short_name" autocomplete="off" placeholder="{{__('messages.customer.short_name')}}" required>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                {{ Form::label('default_n',__('messages.customer.default_n').':') }}<br>
                <label class="custom-switch pl-0">
                    <input type="checkbox" name="default_n" value="1" class="custom-switch-input" @if(old('default_n')==1) {{'checked'}} @endif>
                    <span class="custom-switch-indicator"></span>
                </label>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                {{ Form::label('groups', __('messages.customer.groups').':') }}
                <div class="input-group">
                    {{ Form::select('groups[]', $data['customerGroups'],isset($customer->customerGroups)?$customer->customerGroups:null, ['id'=>'groupId','class' => 'form-control select2', 'multiple' => 'multiple']) }}
                    <div class="input-group-append">
                        <div class="input-group-text plus-icon-height">
                            <a href="#" data-toggle="modal" data-target="#customerGroupModal"><i
                                        class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                {{ Form::label('currency', __('messages.customer.currency').':') }}
                <select id="currencyId" data-show-content="true" class="form-control select2" name="currency">
                    <option value="0"
                            disabled="true" {{ isset($customer->currency) ? '' : 'selected' }}>{{ __('messages.placeholder.select_currency') }}
                    </option>
                    @foreach($data['currencies'] as $key => $currency)
                        <option value="{{$key}}" {{ (isset($customer->currency) ? $customer->currency : getCurrencyIcon($key)) == $key ? 'selected' : ''}} @if(old('currency')==$key) {{'selected'}} @endif>
                            &#{{getCurrencyIcon($key)}}&nbsp;&nbsp;&nbsp; {{$currency}}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                {{ Form::label('phone', __('messages.customer.phone').(':')) }}<br>
                {{ Form::tel('phone', null, ['class' => 'form-control','id' => 'phoneNumber', 'onkeyup' => 'if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,"")', 'placeholder'=>__('messages.customer.phone')]) }}
                {{ Form::hidden('prefix_code',old('prefix_code'),['id'=>'prefix_code']) }}
                <span id="valid-msg" class="hide">{{ __('messages.placeholder.valid_number') }}</span>
                <span id="error-msg" class="hide"></span>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                {{ Form::label('mobile', __('messages.customer.mobile').(':')) }}<br>
                {{ Form::tel('mobile', null, ['class' => 'form-control','id' => 'mobileNumber', 'onkeyup' => 'if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,"")', 'placeholder'=>__('messages.customer.mobile')]) }}
                {{ Form::hidden('mobile_prefix_code',old('mobile_prefix_code'),['id'=>'mobile_prefix_code']) }}
                <span id="valid-msg" class="hide">{{ __('messages.placeholder.valid_number') }}</span>
                <span id="error-msg" class="hide"></span>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="email">{{__('messages.customer.email').':'}}<span
                    class="required">*</span></label>
                <input type="email" name="email" value="{{old('email')}}" class="form-control" id="email" autocomplete="off" placeholder="{{__('messages.customer.email')}}">
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="website">{{__('messages.customer.website').':'}}<span
                    class="required">*</span></label>
                <input type="text" name="website" value="{{old('website')}}" class="form-control" id="website" autocomplete="off" placeholder="{{__('messages.customer.website')}}">
            </div>
            <div class="form-group col-md-3 col-sm-12">
                {{ Form::label('default_language', __('messages.customer.default_language').':') }}
                <div class="input-group">
                    <select class="select2" name="default_language" id="language" style="width:80% !important;">
                        <option selected disabled>Select Language</option>
                        @foreach($data['languages'] as $key=>$value)
                            <option value="{{$key}}" @if(old('default_language')==$key) {{'selected'}} @endif>{{$value}}</option>
                        @endforeach
                    </select>
                    <div class="input-group-append ">
                        <div class="input-group-text plus-icon-height">
                            <a href="#" data-toggle="modal" data-target="#customerGroupModal"><i
                                        class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="street">{{__('messages.customer.street').':'}}</label>
                <input type="text" name="street" value="{{old('street')}}" class="form-control" id="street" autocomplete="off" placeholder="{{__('messages.customer.street')}}">
            </div>
            <div class="form-group col-md-3 col-sm-12">
                {{ Form::label('city', __('messages.customer.city').':') }}
                <div class="input-group">
                    {{-- {{ Form::select('groups[]', $data['customerGroups'],isset($customer->customerGroups)?$customer->customerGroups:null, ['id'=>'groupId','class' => 'form-control', 'multiple' => 'multiple']) }} --}}
                    <select class="select2" name="city" id="cityId" style="width:80% !important;">
                        <option selected disabled>Select City</option>
                        @foreach($data['cities'] as $key=>$value)
                            <option value="{{$key}}" @if(old('city')==$key) {{'selected'}} @endif>{{$value}}</option>
                        @endforeach
                    </select>
                    <div class="input-group-append ">
                        <div class="input-group-text plus-icon-height">
                            <a href="#" data-toggle="modal" data-target="#customerGroupModal"><i
                                        class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="zip">{{__('messages.customer.zip').':'}}</label>
                <input type="text" name="zip" value="{{old('zip')}}" class="form-control" id="zip" autocomplete="off" placeholder="{{__('messages.customer.zip')}}">
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="state" style="margin-right: 200px;">{{__('messages.customer.state').':'}}</label>
                {{-- <input type="text" name="state" class="form-control" id="state" autocomplete="off" placeholder="{{__('messages.customer.state')}}"> --}}
                <div class="input-group">
                    <select class="select2" name="state" id="stateId" style="width:80% !important;">
                        <option selected disabled>Select State</option>
                        @foreach($data['states'] as $key=>$value)
                            <option value="{{$key}}" @if(old('state')==$key) {{'selected'}} @endif>{{$value}}</option>
                        @endforeach
                    </select>
                    <div class="input-group-append ">
                        <div class="input-group-text plus-icon-height">
                            <a href="#" data-toggle="modal" data-target="#customerGroupModal"><i
                                        class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="country">{{__('messages.customer.country').':'}}</label>
                <select class="custom-select select2" name="country" id="countryId">
                    <option selected disabled>Select Country</option>
                    @foreach($data['countries'] as $key=>$value)
                        <option value="{{$key}}" @if(old('country')==$key) {{'selected'}} @endif>{{$value}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="vat_number">{{__('messages.customer.vat_number').':'}}</label>
                <input type="text" name="vat_number" value="{{old('vat_number')}}" minlength="4" maxlength="15" class="form-control" id="vat_number" autocomplete="off" placeholder="{{__('messages.customer.vat_number')}}">
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="credit_limit">{{__('messages.customer.credit_limit').':'}}</label>
                <input type="text" name="credit_limit" value="{{old('credit_limit')}}" class="form-control" id="credit_limit" autocomplete="off" placeholder="{{__('messages.customer.credit_limit')}}">
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="previous_dues">{{__('messages.customer.previous_dues').':'}}</label>
                <input type="text" name="previous_dues" value="{{old('previous_dues')}}" class="form-control" id="previous_dues" autocomplete="off" placeholder="{{__('messages.customer.previous_dues')}}">
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-3">
                <div class="row no-gutters">
                    <div class="col-6">
                        {{ Form::label('images', __('messages.customer.attachment').':',['class' => 'profile-label-color']) }}
                        <label class="image__file-upload"> {{ __('messages.customer.choose') }}
                            {{ Form::file('images[]',['id'=>'attachment','class' => 'd-none','accept' => '.pdf,.xls,.docx,.png,.jpg,.jpeg', 'multiple'=>true]) }}
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-3 col-sm-12">
                <label for="location">{{__('messages.customer.location').':'}}</label>
                <input type="text" name="location_link" value="{{old('location_link')}}" class="form-control" id="location" autocomplete="off" placeholder="{{__('messages.customer.location')}}">
           </div>
            <div class="form-group col-md-3 col-sm-12">
                {{ Form::label('is_supplier',__('messages.customer.is_supplier').':') }}<br>
                <label class="custom-switch pl-0">
                    <input type="checkbox" name="is_supplier" value="1" class="custom-switch-input" @if(old('is_supplier')==1) {{'checked'}} @endif>
                    <span class="custom-switch-indicator"></span>
                </label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-sm-12">
            {{ Form::button(__('messages.common.save'), ['type'=>'submit','class' => 'btn btn-primary', 'id' => 'btnSave','data-loading-text'=>"<span class='spinner-border spinner-border-sm'></span> Processing..."]) }}
            <a href="{{ route('customers.index') }}"
               class="btn btn-secondary text-dark">{{ __('messages.common.cancel') }}</a>
        </div>
    </div>
</div>
