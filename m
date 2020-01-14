Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5A13B09F
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 18:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FfSZMvBewTQZzXle1TjKlOL7uXBqHxWKWOameW3MQfE=; b=WgKEY71dtUCAH1bV68aRfYy6N/
	NMEb4JAjfUXhlOdi7p2DtrZmMifvN/G0TP45jkEOxSS/dq9J8ENx8sitfB/WRZwhfRp5BVO4EnS9u
	l1h8wLmwoT3lis31dm411hRr715ncN5sCUDPNmIVDZjm2b6cLJ3I+FjAX8lWnDc8hT/uyllExxZYL
	P5ilPHr1jFF5bFZZIRIYeAkr4dnYAIADc5Kw/JkqDyOPWhNSBtZBtjFx5n+Tk8ElgXkbgbfj0mufH
	yVyIKanHTCyvjTwUEr3gjzzYSnuYQ6+HFMD34myu8Fxyu+puKCtiEhhMZaytUWPi8hy4pRnbChg0S
	kRZUVqgw==;
Received: from localhost ([::1]:49240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irPjX-003PEw-KB; Tue, 14 Jan 2020 17:12:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27690) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irPjQ-003PEp-Vy
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 17:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=FfSZMvBewTQZzXle1TjKlOL7uXBqHxWKWOameW3MQfE=; b=Ov0/ItDGevNGDBc38Gz/fm6UdC
 PzdD7wMkXMmCldiESTyvJjyipekKKgZeFkAAtjISc4W96Ci08mgJRHCoPGJs0pUQrK2e1i7AjsmP/
 W666GuWVEjSPnYxCelOMbnIzM3tIC00ie2iw5hnNNGfVuEvXtHm6dtE5I116+Ek8xWGhjbW90IalD
 kYVKz1r0DzigpUt45DHQjzUQKCvOdt0vE2CnMS5NOgcLK1Qc37gOKNkO51TEz8emywDTIlPZh8F+7
 NWb8hHWXVq0xjO145HDyO3/LfdwscCTbvTc4gOG/bUraE/16efIIijC4Pa64sd7CA+/yam/+/Uppi
 pIHdPid0SLG1iHDDzxWXmv54MUP33JnMU0cMiMo31W23MLrd6mVbMjbHKwSv111R312cNQrGzQqDa
 loOWZvlMTj+kJLHx0ifWrL/4uUoxhnnPu57hsmW1s7cOQq3DUyVw3foUXE9S0cYkdZ8yRky09US9D
 VIqb7BFurxd0ZIpxGNWoClVz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irPjP-00040O-Lh; Tue, 14 Jan 2020 17:11:55 +0000
To: David Mulder <dmulder@suse.com>, Jeremy Allison <jra@samba.org>
References: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
 <20200114000836.GA157517@jra4>
 <b9d6fbba-dea4-e88f-3d80-c784e073e844@suse.com>
Subject: Re: SMB2 Write truncate
Message-ID: <400304d3-3294-a7cb-3414-303da382bf2e@samba.org>
Date: Tue, 14 Jan 2020 18:11:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b9d6fbba-dea4-e88f-3d80-c784e073e844@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="b7FwfV059znHcgLTQxy1kKeyB2cXiWCTm"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b7FwfV059znHcgLTQxy1kKeyB2cXiWCTm
Content-Type: multipart/mixed; boundary="O94asYUI94AfFKlGEU3ZU017qDH1jfaqf";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: David Mulder <dmulder@suse.com>, Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <400304d3-3294-a7cb-3414-303da382bf2e@samba.org>
Subject: Re: SMB2 Write truncate
References: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
 <20200114000836.GA157517@jra4>
 <b9d6fbba-dea4-e88f-3d80-c784e073e844@suse.com>
In-Reply-To: <b9d6fbba-dea4-e88f-3d80-c784e073e844@suse.com>

--O94asYUI94AfFKlGEU3ZU017qDH1jfaqf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi David,

it's good that you work on the smb2 tests, thanks!

But watch out for source4/torture/basic/delaywrite.c, the write time
update handling is one of the most complex topic.
Windows behaves differently depending on the OS version and
protocol and also the cross protocol behavior brings a lot of strange
things.

See https://bugzilla.samba.org/show_bug.cgi?id=3D13541 and
https://bugzilla.samba.org/show_bug.cgi?id=3D13594 for a lot of work
in progress patches and open questions.

Maybe you want to skip source4/torture/basic/delaywrite.c for now
and do the easy stuff first...

metze

Am 14.01.20 um 16:09 schrieb David Mulder via samba-technical:
> To truncate in SMB2 you can call setinfo on a handle
> with SMB_FILE_END_OF_FILE_INFORMATION.
>=20
> Ah, I missed that SET_INFO call. Thanks Jeremy and Ronnie.
>=20
> --
>=20
> David Mulder
> Labs Software Engineer, Samba
> SUSE
> 1800 Novell Place
> Provo, UT 84606
> (P)+1 801.861.6571
> dmulder@suse.com<mailto:dmulder@suse.com>
> [https://www.suse.com/email/img/2016/email_signature_suse.png]<http://w=
ww.suse.com/>
>=20



--O94asYUI94AfFKlGEU3ZU017qDH1jfaqf--

--b7FwfV059znHcgLTQxy1kKeyB2cXiWCTm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl4d9lUACgkQDbX1YShp
vVYBkg//QMnUfVZsdYhUxd/E4FxU8Ap0ey7V1iTTfiGIDKQm98u8e4S77KVwUTtw
OvuT+9Uqzql8Eo7lyrYrdR5cadU7qha8iUj3KoQFSUR4oundtX/zVAgyTJozBpsZ
vOdZjyaVgQZcPZCSrd2pCMNnOZOKj/GfuZ5Pq1wUzayd9LKZTqprBPGdbibfUeBz
2m/yPtz6+ydzEsAQbEdEXsh1yEX1VpXWaK8t2YWmrymLXMeFlv6yJWuSFkPh2t4x
0lPWDP+GVqlk8YCSaM3w9l8+DoUdtFisGUfJgg3f/FRtEHUVEkdwcJNeysmbDnAJ
o8t9RKo2EeQQuW/9QC3XLdKDcR8s0xe1GXNoKlBrfpnJ8Nrm4c7BFR4ImapNaLm2
5uv0506hB032+XvjMovhhv6kqI0O22hVCTWVfXE5hLQGXCfggGIAJR+eOzM81H1Q
SKTqqXc9SZu4OeQzGtYHVNi2tM55RY4a5+jSmXcI22cd6H3gqGjGualwzVcOPkN6
qiZZaElo1ygb30swVioxIJ9VvwB+HGKhmwuv+1ks+CHWjAZH0lqEYfT1XZa1GD1f
tAZv24+UvwLCJEnMqRdFsrIMAYlcZZ7fFxgrThm4wPmBHEU8e6tZOihqTv0N4jzd
jTSJJ6V9j/ZB3C4zezAkI0LHhrj8xcxk2ikoiw2x0Fm2qSQcSCA=
=AywC
-----END PGP SIGNATURE-----

--b7FwfV059znHcgLTQxy1kKeyB2cXiWCTm--

