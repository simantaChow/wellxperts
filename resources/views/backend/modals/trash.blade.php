<!-- Trash Modal -->
<div id="trashModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="ri-alert-line h1 text-warning"></i>
                    <h4 class="mt-2">{{ translate('Trash Confirmation') }}</h4>
                    <p class="mt-3">{{ translate('Are you sure to trash this?') }}</p>
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">{{translate('Cancel')}}</button>
                    <form class="d-inline" id="trash-link" action="" method="post">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-warning rounded-0">{{translate('Trash')}}</button>
                    </form>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
