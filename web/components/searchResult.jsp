
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<form action="search" method="post">
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Search medical record</h5>
                    <button type="button" class="close" onclick="CancelResult()" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <c:if test="${requestScope.mess==null}">
                        <input type="text" name="code" style="width: 100%;height: 42px;border-radius: 3px;" placeholder="Enter the code that the doctor gave you">
                    </c:if>
                    <c:if test="${requestScope.mess!=null}">
                        <input class="code-error" type="text" name="code" placeholder="Code is not true">
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="CancelResult()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>
        </div>
    </div>
</form>
