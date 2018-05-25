<%-- 
    Document   : index
    Created on : 05-07-2018, 04:10:02 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <title>CRA | Inicio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/app.css">
    <script defer src="js/fontawesome-all.js"></script>
</head>

<body class="position-relative" data-spy="scroll" data-target="#navegacion" data-offset="55">
    <header class="container-fluid">
        <!--Barra de redes sociales-->
        <ul class="nav justify-content-end bg-light row">
            <li class="nav-item">
                <a class="nav-link text-secondary" href="#"><span class="fab fa-facebook-square"></span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link text-secondary" href="#"><span class="fab fa-twitter-square"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-secondary" href="#"><span class="fab fa-twitch"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-secondary" href="#"><span class="fab fa-google-plus-square"></span></a>
            </li>
        </ul>

        <!--Slider-->
        <div class="row justify-content-center">
            <div id="Slider" class="carousel slide col px-0" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#Slider" data-slide-to="0" class="active"></li>
                    <li data-target="#Slider" data-slide-to="1"></li>
                    <li data-target="#Slider" data-slide-to="2"></li>
                    <li data-target="#Slider" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="http://lorempicsum.com/futurama/800/400/2" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="http://lorempicsum.com/futurama/800/400/1" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="http://lorempicsum.com/futurama/800/400/3" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="http://lorempicsum.com/futurama/800/400/4" alt="First slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#Slider" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#Slider" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </header>
    <!-- Barra de Navegación-->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top" id="navegacion">
        <a class="navbar-brand row m-0 p-0" href="index.html">
            <img src="img/CRAlogo.png" class="d-none d-md-inline col-md-2 col-lg-1">
            Colegio Rosa Agazzi
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#NavbarContent" aria-controls="NavbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="NavbarContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item ml-3">
                    <a class="nav-link" href="#inicio">Inicio<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item ml-3">
                    <a class="nav-link" href="#nosotros">Nosotros</a>
                </li>
                <li class="nav-item ml-3">
                    <a class="nav-link" href="#informacion">Información</a>
                </li>
                <li class="nav-item ml-3">
                    <a class="nav-link" href="#alumnos">LogIn</a>
                </li>
            </ul>
        </div>
    </nav>

    <section id="inicio" class="bg-success container-fluid pt-6" style="height: 500px"></section>

    <!--Sección Nosotros-->
    <section id="nosotros" class="container-fluid px-0 pt-6">
        <h1 class="text-center">Nosotros<span></span></h1>

        <!--Misión y Visión-->
        <article id="mision-vision" class="carousel slide" data-ride="carousel" style="background-image: url(img/Backgrounds//background3.jpg); background-size:cover">
            <ol class="carousel-indicators">
                <li data-target="#mision-vision" data-slide-to="0" class="active"></li>
                <li data-target="#mision-vision" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="p-2" style="background-color:#FFFAB6; opacity: 0.8">
                        <div class="container">
                            <h2>Misión <span class="fas fa-bullseye"></span></h2>
                            <p class="text-justify pb-2">
                                Ser una intitución educativa cristiana de primer nivel, que fomente el evangelio de nuestro Señor Jesucristo y el conocimiento de las sagradas escrituras, con el propósito de acentar las bases para el desarrollo de seres humanos enteramente preparados para toda buena obra dentro de nuestra sociedad.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="p-2" style="color: #ffffff; opacity: 0.8; background-color:dodgerblue">
                        <div class="container">
                            <h2>Visión <span class="fas fa-eye"></span></h2>
                            <p class="text-justify pb-2">
                                Brindar una eduación integral de calidad, con la finalidad de asegurar el desarrollo de habilidades, destrezas y aptitudes con el fundamento cristiano, de hombres y mujeres con liderazgo, excelencia académica y principios espirituales.

                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </article>

        <article class="container" id="nuestra-historia">
            <h2>Nuestra historia</h2>
            <p class="text-justify">
                <img src="http://lorempicsum.com/futurama/400/200/2" class="col-sm-7 pl-0 float-left col-lg-4"> Why yes, yes of course! Because this hoverboard incident has now occurred, Griff goes to jail. Therefore your son won't go with him tonight and that robbery will never take place. Thus history, future history, has now been altered and this is the proof! Marty, we've succeeded, not exactly as I'd planned but no matter. Let's go get Jennifer and go home! (Marty puts the hoverboard in the DeLorean and says hi to Einstein again.) Hi Einie, hi buddy! (He picks up the almanac in its bag, but the book falls out and lands at Doc's feet.) What's this? Uh, it's a souvenir...
            </p>
            <p class="text-justify">
                Why yes, yes of course! Because this hoverboard incident has now occurred, Griff goes to jail. Therefore your son won't go with him tonight and that robbery will never take place. Thus history, future history, has now been altered and this is the proof! Marty, we've succeeded, not exactly as I'd planned but no matter. Let's go get Jennifer and go home! (Marty puts the hoverboard in the DeLorean and says hi to Einstein again.) Hi Einie, hi buddy! (He picks up the almanac in its bag, but the book falls out and lands at Doc's feet.) What's this? Uh, it's a souvenir... Oh-ho. Clara was one in a million. One in a billion. One in a googolplex. The woman of my dreams and I lost her for all time. I can assure you, sir, there are other women. I have peddled this barbed wire all across the country, and it has taught me one thing for certain. It's that you never know what the future might bring. Oh-ho...the future, I can tell you about the future. (Railroad Tracks - Morning) (Marty is just waking up, lifting his head from the barrel of his gun which he slept on top of the entire night.)
                <!--<img src="http://lorempicsum.com/rio/400/200/1" class="float-right pr-0 col-sm-7 col-lg-4"> -->(surprised) You've read Jules Verne? I adore Jules Verne. So do I. 20,000 Leagues Under The Sea, my absolute favorite. The first time I read that when I was a little boy I wanted to meet Captain Nemo and... (laughing) Please, Emmett...you couldn't have read that when you were a little boy, it was only first published ten years ago. (quickly covering up his mistake) Oh, yes, well...I meant it made me feel like a boy. I never met a woman who liked Jules Verne before.
            </p>
        </article>
    </section>

    <!--Información-->
    <section id="informacion" class="container-fluid pt-6 pb-3 bg-light">
        <h1 class="text-center">Información<span></span></h1>

        <article class="container">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    Oh, it gets worse! Next week your daughter attempts to break him out of jail and she gets set up for 20 years! My daughter? Wait a minute, I have a daughter? You see, this one event starts a chain reaction which completely destroys your entire family. (Marty looks at the paper again.) Hey Doc, this date...wait, this is tomorrow's newspaper!Hey, what're ya doing? And don't tell anyone about it either. Oh, and there's one more thing. (During the following 1955 Biff closes the garage door, and the Biffs leave the garage.) One day, a kid, or a crazy wild-eyed scientist who claims to be a scientist is gonna come around asking about that book... (They walk off, continuing their conversation. Marty tries to open the door - but it's locked! And we see the outside padlock to prove it. Marty looks up at the windows, but they're far too small for him to climb out of.) I'm trapped! (He gets his walkie-talkie out.) Doc, come in Doc! (Lyon Estates) Right here, Tannen! (Tannen turns and spots Marty. They assume positions seen in normal shooting scenes in Westerns. Everyone who was in the saloon comes out and so do all the townspeople near by.) Draw! No! (Tannen stares at him. He throws his gun and belt down, and gulps.) I thought we could settle this like men. (pause) You thought wrong, dude. (He shoots and Marty falls to the ground.)I'm, I'm sorry, Mr. McFly, I mean, I was just starting on the second coat. That Biff, what a character. (goes back inside) Always trying to get away with something. Been on top of Biff ever since high school. Although, if it wasn't for him… We never would have fallen in love. That's right. (Suddenly Biff runs in carrying a box.)
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    (to Clara) You're doing fine! Nice and steady! Come on! Just a little further! (All the while Clara is moving closer to him, climbing on the edge of the train.) I can't Emmett, I'm scared! (into walkie-talkie) SEVENTY! Come on...you're doing fine...nice and easy...that's it...don't look down... (into walkie-talkie) DOC! THE RED LOG'S ABOUT TO BLOW!!!Why, hello. This is quite a surprise. Well, I hope I'm not disturbing anything. Oh no, we were just doing a little model railroad. Emmett, when my bags were thrown from the wagon, my telescope was damaged. And since you expressed an interest...in science, I thought you might be able to repair it for me. (pause) I would pay you, of course. Oh, no, no, no, I wouldn't think of charging you for this. (Marty sighs and runs his hand through his hair.) Well, let's have a look at it. (he pulls out the telescope and looks through it.) Are you two related? Hello, hello, anybody home? (Marty tries to avoid Biff's cane.) What'd you think, Griff just calls me grandpa for his health? (worried) He's Griff? Gramps, what the hell am I paying you for? Hey kid, say hello to your grandma for me.Grab a hold of something. (Needles and his gang laugh hysterically. At regular intervals they rev up the engine. Marty just looks at them. The light turns green, and all we see are tires rolling and screeching. Needles speeds on ahead, while Marty spins around and his truck goes in reverse. He and Jennifer stare out the back window at Needles who continues on without stopping.) Did you do that on purpose? Yeah. You think I was stupid enough to race that asshole? (Just then, a Rolls Royce appears, exiting a private street. Needles' truck almost hits it, and he spins around the vehicle just in time.)
                </div>
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                    I know, you did send me back to the future, but I'm back, I'm back from the future! Great Scott! (He faints, and Marty bends down to tend to him.) Doc. C'mon Doc, wake up... (We zoom out from Marty and Doc.)(Marty spots a sign for the neighborhood that he lives in. It's just about to be built.) Alright, alright, okay McFly, get a grip on yourself. It's all a dream. Just a very intense dream. (stops a car that's driving by) Woah, hey, listen, you gotta help me. Don't stop, Wilbert, drive. (They quickly drive off.) Can't be. This is nuts. Aw, c'mon.Yeah, it's in the back. (goes and looks through the white pages in the phone book) Brown, Brown, Brown, Brown, Brown, great, you're alive. (He tries calling but there's no answer. So he goes over to the bar.) Do you know where 1640 Riverside… Are you gonna order something, kid? Yeah, gimme a Tab. Tab? I can't give you a tab unless you order something. Standing up and going over to Doc. I know, I know Doc, it's beautiful. (Copernicus whines.) Oh, it's all right, Copernicus! Everything's going to be fine. I'm sorry, Doc, it's all my fault you're stuck back there. I never should've let Biff get to me. There are plenty worse places to be than the Old West. I could've ended up in the Dark Ages. They probably would've burned me at the stake as a heretic or something. Let's look at the map. It says here the time vehicle is buried here in a side tunnel. We may have to blast.(Blacksmith Shop) (Marty arrives in town. He jumps off his horse and runs into Doc's shop.) Doc! Doc! (Realizing that Doc isn't there he runs back outside. He looks around and spots the Saloon.) (Saloon)
                </div>
            </div>
        </article>
    </section>

    <!--Alumnos-->
    <section id="alumnos" class="container-fluid pt-6 pb-3" style="background: url(img/Backgrounds/background1.png); background-repeat: no-repeat; background-size: cover">
        <h1 class="text-center">LogIn<span></span></h1>

        <div class="card container px-0">
            <div class="card-header text-center">
                Inicio de Sesión
            </div>
            <div class="card-body">
                <form action="administration\index.jsp">
                    <div class="form-group">
                        <label for="UserInput">Usuario</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                            <input type="text" class="form-control" id="UserInput" placeholder="Carnet institucional">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="InputPass">Contraseña</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <span class="fas fa-key"></span>
                                </div>
                            </div>
                            <input type="password" class="form-control" id="InputPass" placeholder="Contraseña">
                        </div>
                    </div>
                    <div class="form-group form-check text-center">
                        <input type="checkbox" class="form-check-input" id="CheckRecordar">
                        <label class="form-check-labe" for="CheckRecordar">Recordarme</label>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Ingresar</button>
                </form>
            </div>
        </div>
    </section>

    <!--Footer-->
    <section id="footer" class="container-fluid bg-dark pt-3 pb-3 text-light">
        <article class="row">
            <div class="col-12 col-md">
                <ul class="nav flex-column border-right">
                    <li class="nav-item active">
                        <a class="nav-link text-light" href="#">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Misión y Visión</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Nuestra Historia</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Valores</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md">
                <ul class="nav flex-column border-right">
                    <li class="nav-item active">
                        <a class="nav-link text-light" href="#nosotros">Nosotros</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#mision-vision">Misión y Visión</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#nuestra-historia">Nuestra Historia</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Valores</a>
                    </li>
                </ul>
            </div>
            <div class="col-12 col-md">
                <ul class="nav flex-column border-right">
                    <li class="nav-item active">
                        <a class="nav-link text-light" href="#">Información</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Misión y Visión</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Nuestra Historia</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Valores</a>
                    </li>
                </ul>
            </div>
            <div class="nav felx-column col-12 col-lg">
                <div class="row pl-3">
                    <div class="nav-item col order-2 order-lg-1">
                        <strong>Contáctanos:</strong><br>
                        <small><i class="fas fa-phone"></i> +(503)2504-9671</small><br>
                        <small><i class="fas fa-map-marker-alt"></i> Residencial La Santísima Trinidad, Pje. 13, Pol. 14, #12, Block "E", Ayutuxtepeque, San Salvador, El Salvador</small><br>
                        <small><i class="fas fa-envelope"></i> mail.cra@cra.edu.sv</small>
                    </div>
                    <div class="col-12 col-sm-3 col-lg-4 order-1">
                        <img src="img/CRAlogo.png" class="img-fluid">
                    </div>
                </div>
            </div>
        </article>
    </section>
    <!--Copyright-->
    <section class="bg-secondary container-fluid text-white">
        <p class="mb-0 text-center">
            <small>Copyright <i class="far fa-copyright"></i> 2018. Todos los derechos reservados</small>
        </p>
        <p class="mb-0 text-center">
            Colegio Rosa Agazzi 2018
        </p>
    </section>
    
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.js"></script>
</body>

</html>

