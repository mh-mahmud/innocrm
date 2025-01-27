@extends('layouts.app')
@section('title')
    {{ __('messages.customer.customer_details') }}
@endsection
@section('page_css')
    <link href="{{ asset('assets/css/select2.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/css/jquery.dataTables.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('css/bootstrap-datetimepicker.css') }}" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="{{ asset('assets/css/bs4-summernote/summernote-bs4.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/@fortawesome/fontawesome-free/css/all.css') }}" type="text/css">
    <link href="{{ asset('assets/css/owl.carousel.min.css') }}" rel="stylesheet" type="text/css"/>
@endsection
@section('content')
    <section class="section">
        <div class="section-header item-align-right">
            <h1>{{ __('messages.customer.customer_details') }}</h1>
            <div class="section-header-breadcrumb mr-3 float-right">
                <h6>
                    {{Form::select('customer', $customers, $customer->id, ['id' => 'customerId', 'class' => 'form-control']) }}
                </h6>
            </div>
            <div class="float-right">
                <a href="{{ route('customers.edit', ['customer' => $customer->id]) }}"
                   class="btn btn-warning mr-2 form-btn">{{ __('messages.common.edit') }}</a>
                <a href="{{ url()->previous() }}"
                   class="btn btn-primary form-btn">{{ __('messages.common.back') }}</a>
            </div>
        </div>
        <div class="section-body">
            <div class="card">
                @include('flash::message')
                <div class="card-body">
                    @include('customers.show_fields')
                </div>
            </div>
        </div>
    </section>
@endsection
@section('page_scripts')
    <script src="{{ asset('assets/js/select2.min.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ mix('assets/js/custom/custom-datatable.js') }}"></script>
    <script src="{{ asset('js/bootstrap-datetimepicker.min.js') }}"></script>
    <script src="{{ mix('assets/js/bs4-summernote/summernote-bs4.js') }}"></script>
    <script src="{{ asset('assets/js/owl.carousel.min.js') }}"></script>
@endsection
@section('scripts')
    <script>
        let customerId = "{{ $customer->id }}"
        let ownerId = "{{ $customer->id }}"
        let ownerType = 'App\\Models\\Customer'
        let ownerUrl = "{{ route('customers.index') }}"
        let authId = '{{ getLoggedInUserId() }}'
    </script>
    <script>
        function printtag(tagid) {
               var hashid = "#"+ tagid;
               var tagname =  $(hashid).prop("tagName").toLowerCase() ;
               var attributes = "";
               var attrs = document.getElementById(tagid).attributes;
                 $.each(attrs,function(i,elem){
                   attributes +=  " "+  elem.name+" ='"+elem.value+"' " ;
                 })
               var divToPrint= $(hashid).html() ;
               var head = "<html><head>"+ $("head").html() + "</head>" ;
               var allcontent = head + "<body  onload='window.print()'  style='background: white;'>"+ "<" + tagname + attributes + ">" +  divToPrint + "</" + tagname + ">" +  "</body></html>"  ;
               var newWin=window.open('','Print-Window');
               newWin.document.open();
               newWin.document.write(allcontent);
               newWin.document.close();
              setTimeout(function(){newWin.close();},5000);
           }
   </script>
    @stack('page-scripts')
    <script src="{{mix('assets/js/customers/create-edit.js')}}"></script>
    <script src="{{mix('assets/js/notes/new-notes.js')}}"></script>
@endsection
