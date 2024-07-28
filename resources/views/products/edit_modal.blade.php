<div class="modal fade" tabindex="-1" role="dialog" id="editModal">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ __('messages.products.edit_product') }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            {{ Form::open(['id' => 'editForm']) }}
            <div class="modal-body">
                <div class="alert alert-danger d-none" id="editValidationErrorsBox"></div>
                {{ Form::hidden('product_id', null, ['id'=>'productId']) }}
                <div class="row">
                    <div class="form-group col-sm-12">
                        {{ Form::label('title', __('messages.products.title').':') }}<span class="required">*</span>
                        {{ Form::text('title', null, ['class' => 'form-control', 'required', 'id' => 'editTitle','autocomplete' => 'off','placeholder'=> __('messages.products.title')]) }}
                    </div>
                    <div class="form-group col-sm-12 mb-0">
                        {{ Form::label('description', __('messages.common.description').':') }}
                        {{ Form::textarea('description', null, ['class' => 'form-control textarea-sizing', 'id' => 'editProductDescription']) }}
                    </div>
                    <div class="form-group col-sm-12 col-lg-6 col-md-12">
                        {{ Form::label('rate ', __('messages.products.rate').':') }}<span class="required">*</span>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="{{getCurrencyClass()}}"></i>
                                </div>
                            </div>
                            {{ Form::text('rate', null, ['class' => 'form-control price-input', 'required', 'id' => 'editRate','autocomplete' => 'off','placeholder'=>__('messages.products.rate')]) }}
                        </div>
                    </div>
                    <div class="form-group col-sm-12 col-lg-6 col-md-12">
                        {{ Form::label('product_group ', __('messages.products.product_group').':') }}<span
                                class="required">*</span>
                        <div class="input-group">
                            {{ Form::select('item_group_id', $data['itemGroups'], null, ['class' => 'form-control', 'required', 'id' => 'editProductGroup','placeholder' => __('messages.placeholder.select_product_group')]) }}
                            <div class="input-group-append plus-icon-height">
                                <div class="input-group-text">
                                    <a href="#" data-toggle="modal" data-target="#editProductGroupModal"><i
                                                class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-sm-12 col-lg-6 col-md-12">
                        {{ Form::label('tax_1 ', __('messages.products.tax').' 1:') }}
                        {{ Form::select('tax_1_id', $data['taxes'], null, ['class' => 'form-control', 'id' => 'editTaxSelectOne','placeholder' => __('messages.placeholder.select_tax1')]) }}
                    </div>
                    <div class="form-group col-sm-12 col-lg-6 col-md-12">
                        {{ Form::label('tax_2 ', __('messages.products.tax').' 2:') }}
                        {{ Form::select('tax_2_id', $data['taxes'], null, ['class' => 'form-control', 'id' => 'editTaxSelectTwo','placeholder' => __('messages.placeholder.select_tax2')]) }}
                    </div>
                </div>
                <div class="text-right">
                    {{ Form::button(__('messages.common.save'), ['type' => 'submit', 'class' => 'btn btn-primary', 'id' => 'btnEditSave','data-loading-text' => "<span class='spinner-border spinner-border-sm'></span> Processing..."]) }}
                    <button type="button" id="btnEditCancel" class="btn btn-light ml-1"
                            data-dismiss="modal">{{ __('messages.common.cancel') }}
                    </button>
                </div>
            </div>
            {{ Form::close() }}
        </div>
    </div>
</div>
