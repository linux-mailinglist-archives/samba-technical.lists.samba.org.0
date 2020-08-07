Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A44BC23F132
	for <lists+samba-technical@lfdr.de>; Fri,  7 Aug 2020 18:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Z4WYs/eZ3eyh76iFdkSv0XCTQkUCM06g7VnI6ST+R80=; b=RrJBbn1/PvrMTEUAKWdl3kaNUw
	8l8nE7MDssvKKVsqlmRYLyBVdKG2i/yGaAuGLMQFO8rFQFMnn5j4awd28lnjCAKCONk1c2p8Pjbrp
	8U8x3nqLLG1K9C9nknnAlp2YPfPcSUV9KWONgFTmO0fItCiqNajba87v9UtJFv61yWC7sypEvnwUH
	1C4xstH0ZrLqav8v7RvCwFiY6/a3uBcNPcBv4WUAoI4+RVWDRiU+xx+IXc+Gx4ObkzqomEf4KBOIB
	cjk8QGIeJePgrDhiiO+n/QJWYR37ER1hNdm/mb39ZEzNtHRstx0w/Zgl0/m7XhU/024eEc8np8A4T
	S3dJ/z5g==;
Received: from localhost ([::1]:62114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k45Bg-00CnPu-42; Fri, 07 Aug 2020 16:25:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31082) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k45BX-00CnPn-G6
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 16:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=Z4WYs/eZ3eyh76iFdkSv0XCTQkUCM06g7VnI6ST+R80=; b=hvKBygBbCgz0f6ODhn5Zl45/9U
 DMd3SblCfC8lw41aJTEK41GqHcACeX8QIkIvE6AVS3bOPpjhQCim2g2+MMaNxLW0bpQYmub08vchX
 lbtB77pH7UyCP8aVdZ6Rx9OK6/mZqpRjwDIud8anYG0J+lAAr1pPyi69zUsH1lNOH3csshqNzmyxA
 oJIauBn1i7BYkUopn7aSLPB+DCNXMqjfjepRQB2m9rREawQ4qcVDfz+lk1YdHIcRKLAjVKkGMTAzX
 AZsLWkhbXHJdNASHalGDimd6GBiNnHK1/uORc4CC6f6hBRgD8ME37SuDim0Q91O5JsY12VHuDNyzW
 OcKNDYDqulvYASPaJv4s2w1uC58uclnDWBAxIXLBNtpkeMaWMNvps2SC+NimuN6IK9x0qFIscXBaW
 s0EwikU1KMXiN0FaTZjmPaVpPUN+hJYFMzvwV7q3TQDyoWk15qU9F85o+m5PBDT/r7ZCvb2XbccNZ
 LdIWhMM5HYA2MlzLKrjOATA8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k45BW-0006RY-8O; Fri, 07 Aug 2020 16:25:34 +0000
To: Jeremy Allison <jra@samba.org>, Stefan Metzmacher <metze@samba.org>
Subject: S-1-5-21-Local-SAM-SID-513 -> LOCAL-SAM-NAME\None
Message-ID: <83e89636-75d4-547e-c93f-4184da64255b@samba.org>
Date: Fri, 7 Aug 2020 18:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="i9ro15eQxGrTL5SiDNx6MfWplYcUsc84k"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--i9ro15eQxGrTL5SiDNx6MfWplYcUsc84k
Content-Type: multipart/mixed; boundary="pzONLx7iPCy7momf5guDnsab0HrqYISJf"

--pzONLx7iPCy7momf5guDnsab0HrqYISJf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Howdy!

Can anyone explain this little peace of insanity?

<https://git.samba.org/samba.git/?p=3Dsamba.git;a=3Dblob;f=3Dsource3/pass=
db/pdb_interface.c;h=3D03aa4ff8472198a4600797073cbcc97b5ac93467;hb=3DHEAD=
#l1840>

Cheers!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--pzONLx7iPCy7momf5guDnsab0HrqYISJf--

--i9ro15eQxGrTL5SiDNx6MfWplYcUsc84k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl8tgHwACgkQqh6bcSY5
nkZtoRAAtMTYZFElfAJVl+DSiBP98GCFBRZsNwMW/cBWB/rgVggEXnUerj/ISvLY
jAosis2rYfvl4llRbc7GxYgO3Ps6fHPiu9qr4ABWBG4lsa5Vq2JoQxX8mMTLTLAD
CYYD2lS5D8A6ENqlM+9qD0wuLy2wOcPxbbEtndmWH2ioISER2Ra7F8XFTn566y8w
7LhUSlr9bRx2Re8n7uz+6rUtCrUhw8cwo7JXCDachWqg8wqFeO3V2Br/+BXXiKV4
FfB33Ul1Ui24musdZFEpxEU/7IndxpAZ+BH2sKphRdVZ/YqYQEPHO3Au9TOEZW4Y
83aScJqLThLnvVW5lvymaXGWHaXihDPgMbS7Sj1kHMTd6ug7xDxtlMU0r20WRfOK
UhbIhdXN9PkTBHIZV5YlVWJewUfZGq+Fps+8fSEJp2wmW6uwsQGbDrPbJXDwX2T4
VyK0vK2gIVgWz7MpqRzQJeGCXln9y1j5H8HlvXyrd3JjJ6mIuOk407EbHwkwf9tX
jfHbAWVsmiR/ej8kzLhc2pfuplHB8TFgnFNFsALUBYIGdaHuPQmzfLxDqkpjZRem
sc4aUbhzIzQce0V6JxkRe8Vl1emh5eQV64KtHI1fUl0BWP+KXnlICxFOsSqcDYnE
ycWl98J79JSYfEEPnh1piEjRACdyC0+h7xLLhoQTMtdgYor9hsA=
=xqkQ
-----END PGP SIGNATURE-----

--i9ro15eQxGrTL5SiDNx6MfWplYcUsc84k--

