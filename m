Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D55A01C5288
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 12:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dfUbdqqhzlcM/VVL45Pd8EyiuS54NTKHjbnETG9X0do=; b=Dg75G1bb0U5JhlZTQo4QE4Jf2S
	0/U5XB10hU0Hi9DixbwvxfX57cPY9aAqG/wOnuFZjBxY1VSFlkAmmsAWKbfgMVKlSz71ZIVXrnyit
	Lmgs8gecq9G11yrV4ls7/6z26z9IO2lhoCNi5qXkZMna27z4sYPkCXrv3Bi+PxBZsNl4SgegYbjec
	vhyhFdC3iFEZ/BAjMn8x+xnyM5nGa27RAk6032yC6yqjehnLN9ShuebWHQqJe064xHwFAyHzBR6JG
	ODdSy4qhkhMSaxxxaSVaHSQgIE70J2eUi2Vdv+q3jLlBMldcLmVpdgkA3eVGhMw6X/eCyj8K3gFo9
	XUqfzHIg==;
Received: from localhost ([::1]:62152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVuRU-002lTr-EV; Tue, 05 May 2020 10:04:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25906) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVuRI-002lTk-0W
 for samba-technical@lists.samba.org; Tue, 05 May 2020 10:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:Cc;
 bh=dfUbdqqhzlcM/VVL45Pd8EyiuS54NTKHjbnETG9X0do=; b=CS67Znx3PQFwtefNEuXm7hcFLi
 uHgBLVoHyrWcM/yQFoVfPYWMJrlR7Mhn3pp6vIARVsSaoGtlr5HVAYyxxv+gWnSzssOUQlDNkfaw7
 46/CFznhMMke5P+qFksFAdPU8tnoBWWS/pbYNSQ2nhsKF/TMBZr3Xy2i9wA6qQiGexk+CXxQgg2mq
 OX2mr3vniWWU0Zco0ZjnIJF8GU8n6gB1ei8JmxXGAacyVrQfwER3/7/nOLICX5w1vJYIVhfWcQuLd
 zxD9oyGarkc71BdBQ5sXheGyBcd6BmPq/qVKZptZtCdk4j0tZu7Ly1Iodwpb6XkjQXPiJJ1E23e3w
 k8IFwFdrDcJY33V7EXjPR316wcchKUXc1r8KiS/3J+M1FhsWmkJEihZBcZowVfpiFbbTA0IANOtER
 aLijXZ26JqPEkdcaBEPH5EgoftkugsWxqN9kSll07GxVeWzrG7J7l0sZGFtamNd5R9U8qSgu6cds3
 /+s/g4PkxbpXKngXRYw/4w1A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVuR9-0001DB-Vb; Tue, 05 May 2020 10:04:28 +0000
To: Jens Axboe <axboe@kernel.dk>
Subject: Data Corruption bug with Samba's vfs_iouring and Linux 5.6.7/5.7rc3
Message-ID: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
Date: Tue, 5 May 2020 12:04:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Ty3UoGRVjGw5IvNwsD6B59ASbWNlynGiA"
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ty3UoGRVjGw5IvNwsD6B59ASbWNlynGiA
Content-Type: multipart/mixed; boundary="lKQocSdgc2brxlPB8w429H0AMLGw8cKQq";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring <io-uring@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Message-ID: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
Subject: Data Corruption bug with Samba's vfs_iouring and Linux 5.6.7/5.7rc3

--lKQocSdgc2brxlPB8w429H0AMLGw8cKQq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Jens,

we currently have a bug report [1][2] regarding a data corruption with
Samba's vfs_io_uring.c [3].

Is there're a know problem in newer kernels? It seems the 5.3 Kernel
doesn't have the problem (at least Jeremy wasn't able to reproduce it
on the Ubuntu 5.3 kernel).

Do you have any hints how to track that down?

Thanks!
metze

[1] https://bugzilla.samba.org/show_bug.cgi?id=3D14361
[2]
https://lists.samba.org/archive/samba/2020-April/thread.html#229372[3]
https://git.samba.org/?p=3Dsamba.git;a=3Dblob;f=3Dsource3/modules/vfs_io_=
uring.c;hb=3Drefs/heads/master


--lKQocSdgc2brxlPB8w429H0AMLGw8cKQq--

--Ty3UoGRVjGw5IvNwsD6B59ASbWNlynGiA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6xOicACgkQDbX1YShp
vVa/Tw//SgEXw9rpVJpPZtTt6aayAKzfcVmx5OmKkh2527+m2doWheeBRNsZxZP9
edQDxVYtptxOETTXnaDaVdxl+mJkhNXfxvMSJteMdBXRa7SMT8YkqGK+MAWlqYkX
DrbB136zFu+Pmg0BFcrRwdkTAjWbECJvXIdUoJIxz0MgrPX0SN4/XmRNlkIkMMtA
uP7umfYjiKTQCFmlclvqA1uW2jUC8g6O/ajNkBFX3SoyUE5MGJm0frVAI+G7r25/
0Rvmd0M7HXgtT4uYJWkQS0EZA71O1FZ+1YHbkv3S2yR1bFyVV8id8a05lKFmpT+m
0kq3ORu3mCzXwPCK01utMXHRklJ38HSICgytvk1wQead3z6DNNv/Mk45PgVtbdPz
sJ5hc6vqSpou4qnKniekP9+svfJ+DSbL9yvtpqWPa8aTt98NMOYRbu+9c9smzB6k
wEufAAKuscUmRo/aBK/A9zPCQra2DYGl3JnOo6gqu2Xx7I9BKl722HzI8cvWe4km
10iwLLA8hjEnS0SCdz1UKmJnEoQooOdQT6uvB+NTXgiPS0C0cTDFjswvOnef9AIU
qxGSGvMH7obEJNWnQun8b2zdCFumBt+U9lAYcN/F7zpscERuURbkq01EF1udXm4t
RamrRqkbQH7OIXsrH7GHybjWUUPPa67MhaNWWbQJW0HRiMzpDpI=
=q1fL
-----END PGP SIGNATURE-----

--Ty3UoGRVjGw5IvNwsD6B59ASbWNlynGiA--

