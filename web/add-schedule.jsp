<%
    if(!session.getAttribute("role").equals("Admin")){
        response.sendRedirect("index.jsp");
    }
%>

<%@include file="template/header.jsp" %>
    <!-- Carousel==================================================* -->
    <div class="wrapper container">
        <h2>Add Schedule</h2>

        <div class="wrapper-box">
            <form class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="inputTheater">Theater</label>
                    <div class="controls">
                        <select id="inputTheater" data-placeholder="Theater List" class="chosen-select span8" tabindex="6">
                            <option value=""></option>
                            <optgroup label="Jakarta">
                                <option>Anggrek</option>
                                <option>Syahdan</option>
                                <option>Kijang</option>
                                <option>JWC</option>
                                <option>Simprug</option>
                            </optgroup>
                            <optgroup label="Tangerang">
                                <option>Serpong</option>
                                <option>Alam Sutera</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputMovie">Movie</label>
                    <div class="controls">
                        <select id="inputMovie" data-placeholder="Movie List" class="chosen-select span8" tabindex="6">
                            <option value=""></option>
                            <optgroup label="Now Playing">
                                <option>Thor: The Dark World</option>
                                <option>Despicable Me 2</option>
                                <option>Conjuring</option>
                                <option>Insidious 2</option>
                            </optgroup>
                            <optgroup label="Coming Soon">
                                <option>Hunger Games: Catching Fire</option>
                                <option>Avengers 2</option>
                            </optgroup>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputDuration">Duration</label>
                    <div class="controls">
                        <input type="number" id="inputDuration" class="span8" disabled />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputDate">Date</label>
                    <div class="controls">
                        <input type="date" id="inputDate" class="span8">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPrice">Price</label>
                    <div class="controls">
                        <input type="text" id="inputPrice" class="span8" disabled>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls span8">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Playing ID</th>
                                    <th>Shift</th>
                                    <th>Auditorium</th>
                                    <th>Capacity</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>P001</td>
                                    <td>19.15</td>
                                    <td>Studio 1</td>
                                    <td>75</td>
                                    <td>
                                        <a>
                                            <i class="icon icon-remove"></i>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>P002</td>
                                    <td>21.15</td>
                                    <td>Studio 1</td>
                                    <td>75</td>
                                    <td>
                                        <a href="DeleteSchedule">
                                            <i class="icon icon-remove"></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls right span8">
                        <a href="#add-playing" id="addPlaying" data-toggle="modal">Add Playing</a>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </form>
        </div>
        <!--Popup add auditorium-->
        <div class="modal hide fade" id="add-playing">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3>Add Playing</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label" for="inputShift">Shift</label>
                        <div class="controls">
                            <select id="inputShift" data-placeholder="Shift">
                                <optgroup label="Shift 1">
                                    <option>18.00</option>
                                    <option>18.15</option>
                                    <option>18.30</option>
                                    <option>18.45</option>
                                </optgroup>
                                <optgroup label="Shift 2">
                                    <option>21.00</option>
                                    <option>21.15</option>
                                    <option>21.30</option>
                                    <option>21.45</option>
                                </optgroup>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputAuditorium">Auditorium</label>
                        <div class="controls">
                            <select id="inputAuditorium" data-placeholder="Auditorium">
                                <option>Studio 1</option>
                                <option>Studio 2</option>
                                <option>Studio 3</option>
                                <option>Studio 4</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn" data-dismiss="modal">Close</a>
                <a href="#" class="btn btn-primary">Save</a>
            </div>
        </div>
        <!-- /.wrapper-box -->
        <%@include file="template/footer.jsp" %>