<%@include file="../template/header.jsp" %>
    <!-- Carousel==================================================* -->
    <div class="wrapper container">
        <h2>Transaction List</h2>
        <!-- Three columns of text below the carousel -->

        <div class="wrapper-box">

            <div class="row">
                <form class="bs-docs-example form-horizontal">
                    <div class="control-group">
                        <label class="control-label" for="inputScheduleID">Schedule ID</label>
                        <div class="controls">
                            <input type="text" class="span4" id="inputScheduleID" value="S001" disabled />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputDate">Date</label>
                        <div class="controls">
                            <input type="date" id="inputDate" class="span4" disabled>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputTheater">Theater</label>
                        <div class="controls">
                            <input type="text" id="inputTheater" class="span4" disabled>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputMovie">Movie</label>
                        <div class="controls">
                            <input type="text" id="inputMovie" class="span4" disabled>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputShift">Shift</label>
                        <div class="controls">
                            <input type="text" class="span4" id="inputShift" disabled />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputAuditorium">Studio 1</label>
                        <div class="controls">
                            <input type="text" id="inputAuditorium" class="span4" disabled>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputCapacity">Capacity</label>
                        <div class="controls">
                            <input type="number" id="inputCapacity" class="span4" disabled>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputSeat">Sold Seats</label>
                        <div class="controls">
                            <input type="number" id="inputSeat" class="span4" disabled>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputPrice">Price</label>
                        <div class="controls">
                            <input type="number" id="inputPrice" class="span4" disabled>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputTotalIncome">Total Income</label>
                        <div class="controls">
                            <input type="number" id="inputTotalIncome" class="span4" disabled>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="span12">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Customer</th>
                                <th>Seat(s)</th>
                                <th>Total Seat(s)</th>
                                <th>Price</th>
                                <th>Payment Amount</th>
                                <th>Transaction Date</th>
                                <th>Payment Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>T001</td>
                                <td>Kevin Gian</td>
                                <td>C1,C2</td>
                                <td>2</td>
                                <td>35000</td>
                                <td>70000</td>
                                <td>20 December 2013</td>
                                <td>20 December 2013</td>
                            </tr>
                            <tr>
                                <td>T002</td>
                                <td>Ferry Hinardi</td>
                                <td>B1,B2, B3</td>
                                <td>3</td>
                                <td>35000</td>
                                <td>105000</td>
                                <td>20 December 2013</td>
                                <td>22 December 2013</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.span9 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="pagination pagination-right">
                    <ul>
                        <li class="disabled">
                            <a href="#">&laquo;</a>
                        </li>
                        <li class="active">
                            <a href="#">1</a>
                        </li>
                        <li>
                            <a href="#">2</a>
                        </li>
                        <li>
                            <a href="#">3</a>
                        </li>
                        <li>
                            <a href="#">4</a>
                        </li>
                        <li>
                            <a href="#">5</a>
                        </li>
                        <li>
                            <a href="#">&raquo;</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- /.wrapper-box -->
        <%@include file="../template/footer.jsp" %>