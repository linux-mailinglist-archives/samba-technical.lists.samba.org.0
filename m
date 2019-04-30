Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F6F57A
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 13:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vqZQXkxO8m7DiSptMQUB98Ug4q+mXqcVjRrZAew55cY=; b=Ai57x8nUzxlqzBJVXbIOOhGugM
	ElUNz5tBv9uFL+/CVn6GCCbZm9W6GdT2wHUX3v+mOcLd2ZvlcsLL194xJ2tQIj4hdIhmeZOH1mAul
	IRYk+jlWA889CNOgPwOZPkSmd+WES5RZejF9X/9orkEerOftwxFI3p1I0hSHamPSEXsaw9jvbMDwt
	z5xu6f6gnx6a2GgnPGVJVmfvYbbxZBP2zc9E79wqlzC+Ba1SZEms1+2K4ZYblBOfIGn0s3CCDi2R/
	y/b5JAT2smlVAlagOBYSUk2FVrGcz30zGfuk1cSHKu0HKzb1VzyIg2toaqNcerDGtXDrf/zggJbUo
	fE5P45ag==;
Received: from localhost ([::1]:39046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLQtM-003pcm-SF; Tue, 30 Apr 2019 11:25:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:41658) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLQtH-003pcf-2T
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 11:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=vqZQXkxO8m7DiSptMQUB98Ug4q+mXqcVjRrZAew55cY=; b=euJrAxWs80BHcC4va5fDNprtLU
 hEcJUTjGMCQ51MReHfO4SKf93Bgt25taMRMedmDvpURvyqpsFTNItUw9d1TsBjWFm7ykh4U7FZk3O
 wcKZ2CZo5uOyQeUxSD5zwluaMpbM1bm20wHp1CFUomTl1fafmpeuTHpMalz1nQZjJ04o=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLQtG-0001oM-Kl
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 11:25:38 +0000
To: Samba Technical <samba-technical@lists.samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: smbd: implement SMB_FILE_NORMALIZED_NAME_INFORMATION handling
Message-ID: <c1c3c497-fe35-000a-00eb-0cd653e25716@samba.org>
Date: Tue, 30 Apr 2019 13:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="iBAdIelsxtdNsrph99J1YjYf9dpitYhdm"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iBAdIelsxtdNsrph99J1YjYf9dpitYhdm
Content-Type: multipart/mixed; boundary="1oZQMd3YHWGn0E0z1hJptxfv39Oo7ObLl";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <c1c3c497-fe35-000a-00eb-0cd653e25716@samba.org>
Subject: smbd: implement SMB_FILE_NORMALIZED_NAME_INFORMATION handling

--1oZQMd3YHWGn0E0z1hJptxfv39Oo7ObLl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I just created https://gitlab.com/samba-team/samba/merge_requests/400
with the patches to implement SMB_FILE_NORMALIZED_NAME_INFORMATION.

Windows 10 (1803 and higher) support and use
SMB_FILE_NORMALIZED_NAME_INFORMATION
calls over the network. As a fallback (in case the server don't support
it) the client traverses all path components, which is very expensive.

Implementing SMB_FILE_NORMALIZED_NAME_INFORMATION is very cheap for us
as the open already went through unix_convert() and we have the
information the client is asking for.

See also https://bugzilla.samba.org/show_bug.cgi?id=3D13919

Please review and push:-)

Thanks!
metze


--1oZQMd3YHWGn0E0z1hJptxfv39Oo7ObLl--

--iBAdIelsxtdNsrph99J1YjYf9dpitYhdm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlzIMK4ACgkQDbX1YShp
vVaVkQ/+MdBsPzZimH2r/+vmSMKSvZqDtokMc0EjvI+5gTYmq6mRqzf6EVhTFhTL
qLge/ye4gJNdUUm/0v7yyv9lQhYKrQo7PQF3gKd2d3/Lspk18t5YMz0NF7WGdFCL
dfDg3egfVFkRjdD2Ym+VXDg+eLQ884sxR+kqRyKadtFv0a/dbh9rCSsrUAgd/AlT
EYbEARzeCwcA9nYUj67ZFZSlC+/tWXGTLvH5ROe01SygRJh/44ZhYpWOVwqmlTnK
DsMdexrL4eADzeUXELsRcpX70rR17onMK4A/AqUC0JW9uxuaNKXqDoVfwc4N5n7r
vZGAyxYTfnWpA/Qu+x+F1fqNoEJZfHh7dN0YWmUwx+jNUix/Y6YM0sd8GBw5wind
05fAyK+lZaJIFZ2lfi9uqvLLxHr8iFgGmOPjbg7r0B6v1GNV+Y1zR+OIA/nVWaM4
zyas0MtW/ImfXIbGznOEzXUp9/fO2xsCYZZe3z+6S5yGglwKK9hCVsgh70VTjh+A
9nwGJ4DbzkuIgWS8YPdClxoLmG5YOsv9DQTt4tZ85MxSBoVKZqcE0xSWoZJlUP39
n6+A4Iek6vjwXTBajZC+OqKJKwPL0mQfAp1bpSNnKZS0iENTBmm/ScblaXOuBeRQ
iQIBdyCRr3rEWUSR6DXmNCe+jAu1gNkapGjWfmpLL244fSegXM4=
=54Xb
-----END PGP SIGNATURE-----

--iBAdIelsxtdNsrph99J1YjYf9dpitYhdm--

