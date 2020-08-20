Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D571F24B20E
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 11:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=xi1dTcVU4OZvPGsSrgyXHcL3ymDXWI8nIVYUyFFTwVA=; b=ToHYRhKJJlvEJdpxGiKDzh5yrA
	e498mT57Z09W16PZlQCfNm+e4x1TOz44nWPpTS6kC2NWlFDyPYx8D3JVbYyUXfCk+VrmZvtK0JV0X
	PhXUxvd7JS9fTFjfV9s4jqKmjO4DfXrwvMf4/f0jmW8Y7AFgZjBbAl5fjuUDX3k0ktU5XudEyNvPJ
	AulTeLUSOt6rtxMYLig389cwAAt00H/X0WCst9ioWjgQUrSepJXKGOTDDnj4xA3ca1+wqNuw0Ofpd
	I4a0PGwIx8Tq1P+o+FqY20t3UDmwgE/vKRqMd+RQyKkOclxPDvRg269T5Ny9uxotOvvQgy4H0jeTC
	DJhRHIdw==;
Received: from localhost ([::1]:20652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8gje-00EOnW-0r; Thu, 20 Aug 2020 09:19:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8gjZ-00EOnP-2Q
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 09:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=xi1dTcVU4OZvPGsSrgyXHcL3ymDXWI8nIVYUyFFTwVA=; b=VIGCfSofOKPPNRz+deczywi6CP
 +8OewnvJP2uClu3IYZR2cyiuoXGXCj2EroixPuRGQJxfFl/va6inH5KdMpc+4xSt36VYK2lwxS4wi
 l+GsIpEsG0mHjeHSLaBT4EW+ZShp6WG44WznOKlebKhMvg3rn44Aw09DB5yx98BiFjVRwPipQSKhJ
 wV/7NUTT3/H1iWZ0ODCo5auXvSex+0YqG2BT9fNA+73bcmF7jSv8IWx8TwJVT4edplHzHf7N6ejkB
 PLssypJslT79vlJaQIHoaSvpE3I7K8Seon0XjNySbabJ/Rdg84VBGQTZJCfi4H8ELqV1vm+nbct7v
 IDKnXRX0AQKyiNaLDnLsn6VTt8q9S/mc6Dt9njaXG1wgGmFqurPGvepRrSOJtO4j4fjzsFgHQuDLU
 o8bSUUMUCpANPNG4qMpszk9CStzWGhb5jct/KQrWV5bbvtRlWq2ghAq5Wxz0tzUr1UBqY+XACMU7K
 qcqfdczHnswfRCgJEJTsDSui;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8gjX-0002t2-50; Thu, 20 Aug 2020 09:19:43 +0000
To: Andrew Bartlett <abartlet@samba.org>, Rowland penny <rpenny@samba.org>,
 samba-technical@lists.samba.org
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
 <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
 <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
 <e64290ecfa717e4c66b9b41e7bdb64d70d8cfeaa.camel@samba.org>
 <4c9267080ddc3cc0ab3a20472db4c28135356a74.camel@samba.org>
Subject: Re: "auto" for Kerberos, a history
Message-ID: <77d759fc-c299-21d6-fe5f-3a673dd4f834@samba.org>
Date: Thu, 20 Aug 2020 11:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4c9267080ddc3cc0ab3a20472db4c28135356a74.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="JFiU4CSV8E80xRAEbJqDVWoNuSl1dBdoh"
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
--JFiU4CSV8E80xRAEbJqDVWoNuSl1dBdoh
Content-Type: multipart/mixed; boundary="BvRtV8wBIIxGYbiwJPShEVfDprYVQW7T8";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Rowland penny <rpenny@samba.org>,
 samba-technical@lists.samba.org
Message-ID: <77d759fc-c299-21d6-fe5f-3a673dd4f834@samba.org>
Subject: Re: "auto" for Kerberos, a history
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
 <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
 <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
 <e64290ecfa717e4c66b9b41e7bdb64d70d8cfeaa.camel@samba.org>
 <4c9267080ddc3cc0ab3a20472db4c28135356a74.camel@samba.org>
In-Reply-To: <4c9267080ddc3cc0ab3a20472db4c28135356a74.camel@samba.org>

--BvRtV8wBIIxGYbiwJPShEVfDprYVQW7T8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 20.08.20 um 10:31 schrieb Andrew Bartlett via samba-technical:
> On Thu, 2020-08-20 at 20:19 +1200, Andrew Bartlett via samba-technical
> wrote:
>> On Thu, 2020-08-20 at 08:53 +0200, Stefan Metzmacher wrote:
>>>
>>> yes means no fallback to NTLM,
>>>
>>> Should we use "disabled", "if_available", "required"
>>> instead of "no", "auto", "yes"?
>>
>> I think this is a good idea, and consistent (shock!) with the
>> smb.conf
>> options.  As you know we already have the following synonum table,
>> which covers the required backwards compatibility:
>>
>> /* SMB signing types. */
>> static const struct enum_list enum_smb_signing_vals[] =3D {
>>         {SMB_SIGNING_DEFAULT, "default"},
>>         {SMB_SIGNING_OFF, "No"},
>>         {SMB_SIGNING_OFF, "False"},
>>         {SMB_SIGNING_OFF, "0"},
>>         {SMB_SIGNING_OFF, "Off"},
>>         {SMB_SIGNING_OFF, "disabled"},
>>         {SMB_SIGNING_IF_REQUIRED, "if_required"},
>>         {SMB_SIGNING_IF_REQUIRED, "Yes"},
>>         {SMB_SIGNING_IF_REQUIRED, "True"},
>>         {SMB_SIGNING_IF_REQUIRED, "1"},
>>         {SMB_SIGNING_IF_REQUIRED, "On"},
>>         {SMB_SIGNING_IF_REQUIRED, "enabled"},
>>         {SMB_SIGNING_IF_REQUIRED, "auto"},
>>         {SMB_SIGNING_DESIRED, "desired"},
>>         {SMB_SIGNING_REQUIRED, "required"},
>>         {SMB_SIGNING_REQUIRED, "mandatory"},
>>         {SMB_SIGNING_REQUIRED, "force"},
>>         {SMB_SIGNING_REQUIRED, "forced"},
>>         {SMB_SIGNING_REQUIRED, "enforced"},
>>         {-1, NULL}
>> };
>=20
> Drat.  Yes means different things between this table and what we have
> meant for Kerberos. :-(

We have a similar table for encryption now and some of the mappings
are really strange and only justified as most people want performance
instead of protection.

I don't think we need 100% compat here.

But we could use "disabled", "desired", "required" for kerberos
as the main values.

metze




--BvRtV8wBIIxGYbiwJPShEVfDprYVQW7T8--

--JFiU4CSV8E80xRAEbJqDVWoNuSl1dBdoh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl8+QCQACgkQDbX1YShp
vVYMtA/+OvepeXqmHmXzBf/Yegz4rLoJEGA2XUNHJVxDQq53NsD6PR+UTyR1d7oQ
9V2PfYEVi1vDa/+1T3M6JbovQ2X2EmfhqEEa9U+XI4K9D/QFSd2+v6QWjZ1K1/XD
VyT75KX/oZk2SAEoYfEFGwIvJW5mW/v6X5WRrE22EQ0dIy3dKqL6K87Y7LIzjid3
AhWEihdI3lW1gUAYHl0lyyE72N5xnmyn67kwpfRa7/kh14/N+/R3vVWlVfLC62NN
x8lQHYBLXy6K4fdupAZL3D+CKLiX4orQzc8lyt0GIWo8ITLgVFr3ZToJJRIwAjL4
Sb1msf9XkSAlrdfdNc1wky1/9iIhwS0q/EsTCVb2g3NghMP1xh7E/Skf3bYFlUm2
HHKmco00Q1tzH2SYEuCFQ/JDuREIFd340RwH+X1RXwGoFlZWBba9uXzsOpUXp9kO
gnSPoYx19K7r9XsPOrzjTISrC4Vd8HFYk23FQXnAYslQpZwfT5lkgvgsej1h7434
K0JhxgQKWvJSsqLEMwYQtmnNI5lspvLfAoWAQ4bQOqo5Kx20NZStTmS2JVlMP0ab
LIBvDWne+AIpRi/49u50J2W2aAA7bOY8l2HNDyDbgabX4qODDWtCgN3eIdUge5VO
2NxUlh5YYDxc7CufD0VvNnXcrBPT1zEllwMondONipKnLf79HbE=
=JIiW
-----END PGP SIGNATURE-----

--JFiU4CSV8E80xRAEbJqDVWoNuSl1dBdoh--

