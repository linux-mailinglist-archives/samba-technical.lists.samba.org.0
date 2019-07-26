Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF874760B3
	for <lists+samba-technical@lfdr.de>; Fri, 26 Jul 2019 10:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=O3M5h33nbpzP3ppM0/qgP5KbQIAiQGUBoO3ERTsK0j4=; b=mjTRBmq1/gCrq3NNO5zrp7VChE
	FI05m9FNXoucn9sLV0O3nSUbPW5LneCTa309xvQZIwv8ty7q52kN+3cCEBadKLh9wvVPjz9pkh75z
	MQuO4kZ5DYrzQrUGgoy0pExvaginLTkRMZ3JpRaz0NO8UfNx7heVWTed86McZMMxKJmfKi0+iFoow
	pfqzElBQtwzqqLm4o/bRMh4nHCvLP6jvghO/7nyCc0PZgWPJ+dSKl73zeUv5hUGQDmWdDVZmRkBNX
	Grc8LyT0PhPj2zmmN53r7rni1St2r+1+hSZ+hcXiPWEmGIj1U0+9idRY7gukWysUf4wvpYyLE0H6w
	22G0pk9g==;
Received: from localhost ([::1]:18302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqvaE-000S81-A9; Fri, 26 Jul 2019 08:28:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqva9-000S7u-5V
 for samba-technical@lists.samba.org; Fri, 26 Jul 2019 08:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=O3M5h33nbpzP3ppM0/qgP5KbQIAiQGUBoO3ERTsK0j4=; b=kuOOs+LBQQN5OStQle4bvVfKjF
 q3+FPkNNcTeAXOvtrD1qGsidJks6Y5U3WdeDDUO22qr4cgEV+2tJFcj9dsL5MBnr4uOyMmcdkgeFv
 M/gaE3RxMK4uGrmfc9NL1fGAXOq7Z2S0TUV2Xv3V1OD+bZfquhmyq345HZLp+NOoW/2E=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqva7-0001FV-Ts; Fri, 26 Jul 2019 08:28:04 +0000
To: Steve French <stfrench@microsoft.com>
References: <e51f32ff-ce54-d015-4ba0-572ec35f3e45@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [MS-SMB2] 2.2.3.1.4 SMB2_NETNAME_NEGOTIATE_CONTEXT_ID
Message-ID: <a8102b82-046b-c62a-29c9-a61ae563bf34@samba.org>
Date: Fri, 26 Jul 2019 10:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e51f32ff-ce54-d015-4ba0-572ec35f3e45@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="zcBAa94398p5g55abZi2YGchSq6cI1N1Y"
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zcBAa94398p5g55abZi2YGchSq6cI1N1Y
Content-Type: multipart/mixed; boundary="W5qqMwdPgJmIqNugGkzkv8ekgzsq95wvZ";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Steve French <stfrench@microsoft.com>
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <a8102b82-046b-c62a-29c9-a61ae563bf34@samba.org>
Subject: Re: [MS-SMB2] 2.2.3.1.4 SMB2_NETNAME_NEGOTIATE_CONTEXT_ID
References: <e51f32ff-ce54-d015-4ba0-572ec35f3e45@samba.org>
In-Reply-To: <e51f32ff-ce54-d015-4ba0-572ec35f3e45@samba.org>

--W5qqMwdPgJmIqNugGkzkv8ekgzsq95wvZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Steve,

I just contacted dochelp for this and noticed (from reading the code)
that the kernel sends null-termination for the
SMB2_NETNAME_NEGOTIATE_CONTEXT_ID value.

I think you should fix that and backport it to stable releases,
it would be good if all clients would implement it like windows.

I implemented it for Samba here:
https://gitlab.com/samba-team/samba/merge_requests/666

metze

Am 26.07.19 um 10:22 schrieb Stefan Metzmacher via cifs-protocol:
> Hi DocHelp,
>=20
> I just noticed a documentation bug in
> [MS-SMB2] 2.2.3.1.4 SMB2_NETNAME_NEGOTIATE_CONTEXT_ID:
>=20
>    NetName (variable): A null-terminated Unicode string containing the
>    server name and specified by the client application.
>=20
> Windows Server 1903 sends the name without null-termination, see the
> attached capture.
>=20
> metze



--W5qqMwdPgJmIqNugGkzkv8ekgzsq95wvZ--

--zcBAa94398p5g55abZi2YGchSq6cI1N1Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl06uYgACgkQDbX1YShp
vVZVKg/+JYbvlCketfInETZuIdIdfI8evCQ0Laa2v3A6JewpWz2VeySQ0lz5x9nI
JlGSYShFE6GN5jQkWlTviT9ZuERCkJPS5wGyl3YFjPXUU7GUPfo6vDPE8ddk0uCp
AAoyeclRiRr1cNPKXAqdrYJLjPi9Ns4OqXRPE17m4PUgNxRaB202YGUp1IK58Bwt
7XMV4ivN5SRCxWMYxZf93NwpRhI0PxBnh0jFerFqInGUhu6UpAmNfTBfEfVkp9fl
/3RXTuB/Ts/JPD99JH2SN7aPjwFPQyfoY/nNG81P5ytwjoH8VNKsa/Lh87p+xJ03
A7eMyk4riSDlfb7QxmXFdiIul5YUs0QwiPbaHiA7xYuI+6EBff3flAC/B4Bw6m2b
zONqoy/9Wx2UQtbtLNT8tyzP31aNcZ2t3eATI1OUzw3iLUBHREIVTGTMXcYY4IFQ
hv+SHGbtmavI5QMwIvsjYug/wCO+TmuonNZWY9Pk0GYMyaxp1n36zwB03DkXCvAn
WauYhdStUwQ/E/0bQJECtoMx9Qufv/hQf2semcx06j5Jbyl0hplb+fiaoRmNxyAn
lpQC+cL674+r81+RnstmpW1eKtOggjhQjkdH2E6W+zYZW9qK9bV4zzLfYVzoQCmH
3+BRta6M6Ns6TYUnNoRXtVnmw69jiQdDGNpCm9X4ACshcQcl0GQ=
=ChaT
-----END PGP SIGNATURE-----

--zcBAa94398p5g55abZi2YGchSq6cI1N1Y--

