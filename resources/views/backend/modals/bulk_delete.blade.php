<!-- Bulk Delete Modal -->
<div id="bulkDeleteModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content modal-filled bg-danger">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="ri-close-circle-line h1"></i>
                    <h4 class="mt-2">{{ translate('Delete Confirmation') }}</h4>
                    <p class="mt-3">{{ translate('Are you sure to delete those files?') }}</p>
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">{{translate('Cancel')}}</button>
                    <a href="javascript:void(0)" onclick="bulk_delete()" class="btn btn-warning">{{ translate('Delete') }}</a>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

                                   