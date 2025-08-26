<%-- 
    Document   : booking
    Created on : Mar 21, 2025, 5:35:50 PM
    Author     : VAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="assets/css/booking.css" />
        <title>Movie Seat Booking</title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <!-- flaticon css -->
        <link rel="stylesheet" href="assets/fonts/flaticon.css">
        <!-- animate.css -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!-- stylesheet -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    </head>
    <style>
        .banner-buttons {
            text-align: center;
            margin-top: 20px;
        }

        .buttons {
            background-color: #ffcc33;
            color: white;
            font-size: 18px;
            font-weight: bold;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .buttons:hover {
            background-color: #3399ff;
            transform: scale(1.05);
        }

        .buttons:active {
            transform: scale(0.95); /* Hiệu ứng nhấn xuống */
        }

    </style>
    <body style="background-color: #242333;color: white">
        <%@include file="header.jsp" %>
        <div class="container mt-4">
            <div class="row mb-3">
                <div class="col">
                    <label>Chọn phim:</label>
                    <select id="movie" class="form-select">
                        <c:forEach var="m" items="${list}">
                            <option value="${m.movieId}">${m.title}</option>
                        </c:forEach>

                    </select>
                </div>
                <div class="col">
                    <label>Chọn rạp:</label>
                    <select id="cinema" class="form-select">
                        <c:forEach var="t" items="${the}">

                            <option value="${t.theaterId}">${t.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <label>Chọn giờ chiếu:</label>
                    <select id="time" class="form-select">
                        <c:forEach var="s" items="${showTime}">
                            <option value="${s.showtimeId}">${s.showDate}</option>
                        </c:forEach>

                    </select>
                </div>
            </div>
            <ul class="showcase">
                <li>
                    <div class="seat"></div>
                    <small>Trống</small>
                </li>

                <li>
                    <div class="seat selected"></div>
                    <small>Đã mua</small>
                </li>

                <li>
                    <div class="seat occupied"></div>
                    <small>Đang giữ chỗ</small>
                </li>
            </ul>
            <div style="justify-content: center" class="containered">
                <div class="screen"></div>
                <div class="row2">
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                </div>
                <div class="row2">
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat occupied"></div>
                    <div class="seat occupied"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                </div>

                <div class="row2">
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat occupied"></div>
                    <div class="seat occupied"></div>
                </div>

                <div class="row2">
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                </div>

                <div class="row2">
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat occupied"></div>
                    <div class="seat occupied"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                </div>

                <div class="row2">
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat"></div>
                    <div class="seat occupied"></div>
                    <div class="seat occupied"></div>
                    <div class="seat occupied"></div>
                    <div class="seat"></div>
                </div>
            </div>

            <p class="text mt-4">
                Bạn đã chọn <span id="count">0</span> ghế, tổng số tiền là <span id="total">0 </span> VND
            </p>
        </div>

        <div class="banner-buttons">
            <button class="buttons"> Đặt vé</button>
        </div>

        <script>
            const container = document.querySelector('.containered');
            const seats = document.querySelectorAll('.row2 .seat');
            const count = document.getElementById('count');
            const total = document.getElementById('total');
            const movieSelect = document.getElementById('movie');
            const bookButton = document.querySelector('.buttons');

            let ticketPrice = +movieSelect.value;

            function saveSeats() {
                const occupiedSeats = document.querySelectorAll('.row2 .seat.occupied');
                const seatsIndex = [...occupiedSeats].map((seat) => [...seats].indexOf(seat));
                localStorage.setItem('occupiedSeats', JSON.stringify(seatsIndex));
            }

            function loadSeats() {
                const occupiedSeats = JSON.parse(localStorage.getItem('occupiedSeats'));
                if (occupiedSeats !== null && occupiedSeats.length > 0) {
                    seats.forEach((seat, index) => {
                        if (occupiedSeats.indexOf(index) > -1) {
                            seat.classList.add('occupied');
                        }
                    });
                }
            }

            function updateSelectedCount() {
                const selectedSeats = document.querySelectorAll('.row2 .seat.selected');
                const selectedSeatsCount = selectedSeats.length;

                count.innerText = selectedSeatsCount;
                total.innerText = selectedSeatsCount * ticketPrice;
            }

            container.addEventListener('click', (e) => {
                if (e.target.classList.contains('seat') && !e.target.classList.contains('occupied')) {
                    e.target.classList.toggle('selected');
                    updateSelectedCount();
                }
            });

            movieSelect.addEventListener('change', (e) => {
                ticketPrice = +e.target.value;
                updateSelectedCount();
            });

            bookButton.addEventListener('click', () => {
                const selectedSeats = document.querySelectorAll('.row2 .seat.selected');

                if (selectedSeats.length === 0) {
                    alert("Vui lòng chọn ghế trước khi đặt vé!");
                    return;
                }

                selectedSeats.forEach(seat => {
                    seat.classList.remove('selected');
                    seat.classList.add('occupied');
                });

                saveSeats();
                alert("Đặt vé thành công! Ghế đã được đặt.");
                updateSelectedCount();
            });

            loadSeats();
        </script>

    </body>
</html>
