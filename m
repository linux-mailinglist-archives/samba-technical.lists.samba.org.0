Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2679319A35
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 08:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=PXIXm+3KXKTv0RWedknjapsFyqbZbMP+ZNMRg5V4eEw=; b=ZIQNdyEWH0XKd+75nryGtnaB/P
	lJhNO7y+PFrWAlnZnTgAj0J1f3zupAFPguUc/QiiMrhVyxCOVrHdVb0zDWNr/9kPilO20TUYK4IAD
	oei6rxOtgfAYFrN803iocebaHk0sd0qcJmBxtYFjyfKHesEYfZFidZKqu/Z8BPzEUqPEZV0+ItFoH
	tgz6D6o7jBeVQthMn4cFYYhWAzo4hTltceM159Wo7aawodMEKIsDb3HyZHldSTWacR9mZlI2A61Ls
	JBM45H3VIVIOGPfjvI/lZ1bFPApKybNOV9avXYnSpSS/BiSA+s2juIQsjypF2i3peswNQRNIwEvx6
	OCXRecMw==;
Received: from ip6-localhost ([::1]:19870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lASps-00CMHi-HN; Fri, 12 Feb 2021 07:25:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41212) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lASpi-00CMHZ-6F
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 07:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=PXIXm+3KXKTv0RWedknjapsFyqbZbMP+ZNMRg5V4eEw=; b=BMLV7r8UogGp91Aj+0hxiCTVMF
 e9SFedGKnYLMpZY6+EDOido9lEh8FW9IvrmxfoILv52979+P7EmmWXBvIhi280LZvnLS4CEnt6H2v
 Ncnde5PIUol33H/A5Mu2Z6XYCPSeMb8L1vvj1Py5wNcGUir5i4du8PCQpfCfJwdMpwgP+NVoldYUA
 n411z8wSvqT5P4uGauo7OsNa4pdO/ZJTPzPjrmaoZYP2oeu3aqA18ugSf+H1dGEDhqVpRykOgNqBO
 uJUsgBVmj0dIRBwR+oN3iX+VTH1FMiJlUai0z+10JPDFRNfIrc7hiJKbqO3njUs8hdh1zDXZ0p/XA
 8YN6W2wI4qYzDQ2B8BDnhu31P0ryhLEb3p8iCWVScL7mofbb609K/mZKKAza0RoK3TxfXiJ+1tC37
 I2KsTZ7ydFIP0yAsDVbJr9VzdEIjR4ebsIkTVyVY+R5YRBBlMhLwfksJ0CcnUylJdRJt0xj5c+vP6
 BU2sNBe/23tfE9ROJJOth6WB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lASpe-0007M9-08; Fri, 12 Feb 2021 07:25:38 +0000
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <c208bc6e-d57f-6ca1-315f-662e7a68f580@catalyst.net.nz>
Subject: Re: truncated gitlab samba-ad-dc-5 pipeline logs
Message-ID: <ae78d3f0-9cf6-691f-c755-6db4781ca91e@samba.org>
Date: Fri, 12 Feb 2021 08:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c208bc6e-d57f-6ca1-315f-662e7a68f580@catalyst.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="jrRvp35JRvRp6C793K0fqnh5wxd0KzzDH"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jrRvp35JRvRp6C793K0fqnh5wxd0KzzDH
Content-Type: multipart/mixed; boundary="6WvdwWn6m7rbs2KW1vNUX9cQWFU3jG96Z";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <ae78d3f0-9cf6-691f-c755-6db4781ca91e@samba.org>
Subject: Re: truncated gitlab samba-ad-dc-5 pipeline logs
References: <c208bc6e-d57f-6ca1-315f-662e7a68f580@catalyst.net.nz>
In-Reply-To: <c208bc6e-d57f-6ca1-315f-662e7a68f580@catalyst.net.nz>

--6WvdwWn6m7rbs2KW1vNUX9cQWFU3jG96Z
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 12.02.21 um 04:42 schrieb Douglas Bagnall via samba-technical:
> Since around 18 September last year, the log for a successful
> samba-ad-dc-5 job has ended like this:
>=20
>   Job's log exceeded limit of 4194304 bytes.
>=20
> e.g. https://gitlab.com/samba-team/devel/samba/-/jobs/744619956
>=20
> Nobody cares about that, but now I have an *unsuccessful* samba-ad-dc-5=

> job that ends the same way, which is to say it fails too late to leave
> any trace. Of course there couldn't possibly be a problem with my code;=

> I just want to know the logs agree.
>=20
> Things I have noticed:
>=20
> 1. Some older samba-ad-dc-5 logs were bigger, and Gitlab allowed that.
> They seem to have shrunken the limit.
>=20
> 2. this happened around the time of ZeroLogon, which increased the
> verbosity with ~1M of this kind of thing:
>=20
> client_account[schannel1$] client_computer_name[schannel1]
> dcesrv_netr_creds_server_step_check: CVE-2020-1472(ZeroLogon): Check if=

> option 'server require schannel:schannel1$ =3D no' might be needed!
> dcesrv_netr_creds_server_step_check: CVE-2020-1472(ZeroLogon):
> netr_LogonSamLogon request (opnum[2]) without schannel from
>=20
> which maybe pushed it over the edge.

Maybe we can drop these messages similar to SAMBA_DEPRECATED_SUPPRESS,
that some maybe set globally in selftest.pl.

> 3. The bulk of the log follows this pattern:
>=20
> Failed to connect host 10.53.57.14 on port 135 -
> NT_STATUS_OBJECT_NAME_NOT_FOUND
> Failed to connect host 10.53.57.14
> (1cae2ae0-54bf-4728-bf9d-7cc40958d0c6._msdcs.addom.samba.example.com) o=
n
> port 135 - NT_STATUS_OBJECT_NAME_NOT_FOUND.
>=20
> The internet says we can't configure this limit (I checked the admin
> screen anyway).
>=20
> For now I have added a patch to shut up the NOT_FOUNDs; once my origina=
l
> patches are vindicated, I will look into a proper solution. Does anyone=

> have any ideas? Do both those connection failure messages need to be
> DEBUG(0,())?

Maybe not, but I think a fix would more that we remember the failure in
repsFrom/repsTo and also throttle the retries.

The same also happens in real world installations, when a dc is not avail=
able.

metze



--6WvdwWn6m7rbs2KW1vNUX9cQWFU3jG96Z--

--jrRvp35JRvRp6C793K0fqnh5wxd0KzzDH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmAmLWgACgkQDbX1YShp
vVY+VxAAsI4BRWxQLrXCUP9a+c9IYX5HL9HSVDcOeFYyICoRq9DJzVTtkxtSSk+T
3P0g0P9bcuJ0rbAzVkjAaFBjTa2ZYf5vGci2WfAbn0zIsxEcdsg+FCZK0ecCLXiK
8n3BmPLf3ZKwnFFEFg3/VYc65r1tK7xNmPYhIRBKp46GXH9ZpXRDW5NbePSWzlYP
LphK1fzbKQLy0JZQFYlelONXnRpIm181KiLHa3/4wgt+TGKe24tALSdOxfHcQSHB
9YUsKipgnko8tj2i210YDJZfYWML4SR9zkQeMbXqBgBpWa1B+N7MMZNdmC1EFmCo
/NMRt3FEQeBCzRrkiEuTZ9vHn3UDmBuV/E0cQGyvc/PBgMBF1g3gdTT+y3yUAdd5
UfJlMu8UYmEKDthdPvkH1HXNWDQsjuQjqk+dtCZTm1iUmHYB2MVJlVwXufIFIf73
/WSJ1HfjloLnQrQPpWVdKxSmkD6w31CVKMq+OdoxlbW+RSDTd8dsSbFAga9TRDAu
TiDni8PsvgeowBf8thwo1lPmfBWzYKJRWSVIODsrJDx6FcJFW+BsyfGghm8OxKKv
misaFXi0t6bokZRFqDJrjr1HrlGOnN1PzRzeNZpA42NU+xTgdVpPkZgxBquXzxFP
0D/+u6MGG7xqo5Deuqby6+wTFzvxLzNGexpbnDWLvYGI+zyntS8=
=ovsY
-----END PGP SIGNATURE-----

--jrRvp35JRvRp6C793K0fqnh5wxd0KzzDH--

