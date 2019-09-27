Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C75C7BFF7F
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 08:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=C9x72+4zRJ6h8Yzgh+YYgIzrMjGAaWr5a968UMlXpfA=; b=uDrej1hBmjasrLktoKeG3mKYYF
	04xhePdF09fpPuv9MAwbHjKQuy5+H+QUlatwRIzYkpIjWFV+dQqqASi9BtrDmgbW00kzd59XN1B58
	qhZkPM7D4zZl05gcWDEhZnIFsFT1AwBUHqNGGI8bnIXRZXbIZbQyd1EsXab3qs+5iRkSlvFK/b4d+
	wA5lW44oyJqqEpwGcp3dNUueAQy8iu2J5apYbxjHFhePUJuOAy8J5dt6wTlG8jxlnsBp2vn6198cJ
	0Urqy/G9opgwzDcaMG08GVvz1zPd0TcPIHs4esYyWGA9pX2PWW99dXChmp7hbbMMIKF1QEhb3DtVx
	Iv0Ggl5g==;
Received: from localhost ([::1]:37364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDkDV-0094hT-RM; Fri, 27 Sep 2019 06:59:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDkDP-0094hM-QC
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 06:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=C9x72+4zRJ6h8Yzgh+YYgIzrMjGAaWr5a968UMlXpfA=; b=LbEY+0W4SAjDVPMxs+QFbJ1UuC
 I7FnVLwC8zAnI/CzPnXwbmMeqhx+PbBzBHGq6KxPM6ciB6lhgz/ZO0VRvZKWTwTXoFWCzozZSnuCF
 LtG88W4aGYAWPVMxo64hQnfDhkfLg1wWsFXVatKmnCk13BChDauCJ5JjE3bpdnsYynnE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDkDO-0000sr-77; Fri, 27 Sep 2019 06:58:55 +0000
Subject: Re: Getting the SID of the user out of the PAC ...
To: Steve French <smfrench@gmail.com>
References: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
 <461a8f64-1f29-5b30-6b2d-4f4f88812323@samba.org>
 <CAH2r5mvC6qMyxmhB_fdXxnXCztefowpWcgqxUgK1m_GSFZOS-g@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <9a5da317-166d-d5a6-6026-88d1cdd92ac2@samba.org>
Date: Fri, 27 Sep 2019 08:58:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH2r5mvC6qMyxmhB_fdXxnXCztefowpWcgqxUgK1m_GSFZOS-g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="r7dKPTXJFn8kbcUNckKWrrKT97veeZAkZ"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--r7dKPTXJFn8kbcUNckKWrrKT97veeZAkZ
Content-Type: multipart/mixed; boundary="kow7aNOOH6xfUSHAWEK62341EwKfsBTfE";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: ronnie sahlberg <ronniesahlberg@gmail.com>,
 Pavel Shilovsky <piastryyy@gmail.com>, =?UTF-8?Q?Aur=c3=a9lien_Aptel?=
 <aaptel@suse.com>, samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <9a5da317-166d-d5a6-6026-88d1cdd92ac2@samba.org>
Subject: Re: Getting the SID of the user out of the PAC ...
References: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
 <461a8f64-1f29-5b30-6b2d-4f4f88812323@samba.org>
 <CAH2r5mvC6qMyxmhB_fdXxnXCztefowpWcgqxUgK1m_GSFZOS-g@mail.gmail.com>
In-Reply-To: <CAH2r5mvC6qMyxmhB_fdXxnXCztefowpWcgqxUgK1m_GSFZOS-g@mail.gmail.com>

--kow7aNOOH6xfUSHAWEK62341EwKfsBTfE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 27.09.19 um 08:50 schrieb Steve French:
> On Fri, Sep 27, 2019 at 1:44 AM Stefan Metzmacher <metze@samba.org> wro=
te:
>>
>> Am 27.09.19 um 08:39 schrieb Steve French via samba-technical:
>>> Is there a way to get the SID of the user out of the MS-PAC through
>>> Samba utils (or winbind)?
>>>
>>> This would help cifs if when we upcall as we do today to get the
>>> kerberos ticket, we were also given the user's SID not just the ticke=
t
>>> to use to send to the server during session setup.
>>
>> Only if you get a service ticket for the joined client machine.
>>
>> But I don't understand what a possible use case would be.
>=20
> When not mounting with "idsfromsid" this would allow us to use the
> correct owner SID when creating ACLs (to include the owner and mode)
> on mkdir and filecreate (the acl can be sent in the sd_context during
> create)

Maybe CREATOR_GROUP and CREATOR_OWNER are of some use for that...

metze



--kow7aNOOH6xfUSHAWEK62341EwKfsBTfE--

--r7dKPTXJFn8kbcUNckKWrrKT97veeZAkZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2NsyMACgkQDbX1YShp
vVa0XQ//Z+Yt+W9q2DKAWY7FOdwoEEC+lnbM7OLNbpA9QEN2wzwLEcWTf0FzpTUf
fA4jLmOl0C4r5p9wqj7I2gml0IDEs2pRRbT1xLmMKrqNYYxgUejvk8z6/2/x1oLF
uGVeeE/b5gYbMpK6IRjAFJpVG25ExAa443LdEhkmuX2FMTSIOl0gCFtFXDfPJDJF
+5sKfx1MCpQeFlqklJLnc5JfcZv7EDeccN7mI3+8t316JPHNvSn5I20V1Wf2aUHo
aiZNAfBI6oMCCdMAqTVptW+Bhb2NCC9Ma+m6kBzjTjWtunGphMHTDp8PDDw9sY5d
ZSgDU8mkaPlWwgiSd7oxzffF6ujCybJrTi5tRJ3qB3x0j/hcHtxwY1enPAdo3pot
wHhqiZeMh/waUpLdtjaEYYu/t0W00YWATYrf5GzTsoHX5oiYV3rWTNIVzQ2U145C
/ofXwTMPKZKcRGOw1A0YtzZGi9MlRTuutnxGoOoX7BZOK6XHhDQXLZWIyzQGaNfy
+EdgnGQS5C3lTKwORsgx2lbRRzmzxrwpOfS66Pb4jnC4J2/AECQ/Q4/H0orNHCls
nRJoH/Zk5WyM2GwzslAbzlzYbAzGr9FD5fHMPzr1wnhCduVBocWyain3lhDGGuPB
6vTzVSOCwHbIBjKWZbTyXLvwwFR6UqS4KCBL4gC9hQq47AUkIPA=
=W6F7
-----END PGP SIGNATURE-----

--r7dKPTXJFn8kbcUNckKWrrKT97veeZAkZ--

