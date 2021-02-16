Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F3831D219
	for <lists+samba-technical@lfdr.de>; Tue, 16 Feb 2021 22:31:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Zs/Tb1KgxUEEmzfgqUiwUUIasJ32vHZnVBa/GSQw5ho=; b=bEQt3BMP1s3TB6p7kYHShw5oP0
	2XaTyVreB8fpAJ/kq9Py2fa46QTJAdurjkLuKOzfV8+HE7+7IuQUNF5yY/VzJl2dozSvKeZjX4R9v
	QcTtIhajtynl8RBeRBzSmLQqB3rt2fBeSo7+SNpxrjGi5cxsVNhz5x3D1BJ3bhelK1vju3zYLrsn5
	XRwg8iQN4KJNKOGvZnwpko33gm0oijJl4imc5FI8ANZRc2MlwW4gjMM6w7LxMqpL0169CiBlJDvb1
	JGTJiKr6dDoty8QePKIJ/NgtzIVSMW3x324Z0l3MmassIqUvctEy7EGxjB/R1CLETMxN9P0q0Tjbb
	rdVS9N5A==;
Received: from ip6-localhost ([::1]:24676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lC7vS-000Foq-00; Tue, 16 Feb 2021 21:30:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53472) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lC7vN-000Foj-9o
 for samba-technical@lists.samba.org; Tue, 16 Feb 2021 21:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=Zs/Tb1KgxUEEmzfgqUiwUUIasJ32vHZnVBa/GSQw5ho=; b=U2f6lRW+c47IUegXQFKgk7bKqV
 0c24/IinsozA8BDmUnkdGECb/wWJTlIG6VAgQt7PL4p2+Ezp7xBOr7FMLJ7eY+uFx8xMSQOEPf/fH
 oEBmLwbOrhbmgRaFiVmon2JR0iTvkgt2pbLOUOxBn+r7ibgBaTyKt+I3KYKdO/pupEgRPTNb6Ndhj
 1wS7o8oxEAc73ZrAKmbUq0x4Qo/33eG+z8Hgr7Ho7IAAmQFO7Q+TWKauXsT9acH1k+DFt9/sPAPw3
 28SPPWf5HI6Rj091v+0hDpiY9guOI0EO03PS83nQjkeh+FEkzehbKKo8jDzEaO16SRj4RPTQ/9lJE
 25X36HIqNGgtvgNMQQIIW4JP7HW6d9h/JfgyKu8vprJr97l609qPfDpIyB1/9GvkDVp+HA3v0Vi2X
 HG3stywh3baSBwwIZIm8zzPuKDCl2afM0Q2SIkXp+M53XbbbXwsXcTit/DWax8a70jepQMhpzHS8C
 LOSXz3bdIThk98XK44zmVujZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lC7vL-0003UL-H7; Tue, 16 Feb 2021 21:30:23 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
References: <CGME20210216014213epcas1p3017ca771037e3f5d12fe634d514f8d3b@epcas1p3.samsung.com>
 <20210216013257.18621-1-namjae.jeon@samsung.com>
 <0a3ddf81-371f-228d-8a4c-37e6baa03e3c@samba.org>
 <CAKYAXd__m7A8PS7iLvDezpsxtUQPs4vjPborO1e0qgkzcqMYWQ@mail.gmail.com>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: add v4 dos attribute structure
Message-ID: <abf64473-1fc5-c1af-fe68-57081b4ba0c9@samba.org>
Date: Tue, 16 Feb 2021 22:30:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKYAXd__m7A8PS7iLvDezpsxtUQPs4vjPborO1e0qgkzcqMYWQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="fCMwbzsrnUNJiTHyjrLB8fKp5FmLiFfZu"
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
Cc: Namjae Jeon <namjae.jeon@samsung.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>, linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fCMwbzsrnUNJiTHyjrLB8fKp5FmLiFfZu
Content-Type: multipart/mixed; boundary="Vkt8oojp1toZ1NsacuZ9cdH4zwR250pF1";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Namjae Jeon <namjae.jeon@samsung.com>,
 linux-cifsd-devel@lists.sourceforge.net, =?UTF-8?Q?Ralph_B=c3=b6hme?=
 <slow@samba.org>, Samba Technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Message-ID: <abf64473-1fc5-c1af-fe68-57081b4ba0c9@samba.org>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: add v4 dos attribute structure
References: <CGME20210216014213epcas1p3017ca771037e3f5d12fe634d514f8d3b@epcas1p3.samsung.com>
 <20210216013257.18621-1-namjae.jeon@samsung.com>
 <0a3ddf81-371f-228d-8a4c-37e6baa03e3c@samba.org>
 <CAKYAXd__m7A8PS7iLvDezpsxtUQPs4vjPborO1e0qgkzcqMYWQ@mail.gmail.com>
In-Reply-To: <CAKYAXd__m7A8PS7iLvDezpsxtUQPs4vjPborO1e0qgkzcqMYWQ@mail.gmail.com>

--Vkt8oojp1toZ1NsacuZ9cdH4zwR250pF1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Namjae,

>>> @@ -153,17 +155,27 @@ int ndr_encode_dos_attr(struct ndr *n, struct
>>> xattr_dos_attrib *da)
>>>  	if (!n->data)
>>>  		return -ENOMEM;
>>>
>>> -	snprintf(hex_attr, 10, "0x%x", da->attr);
>>> -	ndr_write_string(n, hex_attr, strlen(hex_attr));
>>> +	if (da->version =3D=3D 3) {
>>> +		snprintf(hex_attr, 10, "0x%x", da->attr);
>>> +		ndr_write_string(n, hex_attr, strlen(hex_attr));
>>> +	} else {
>>> +		ndr_write_int16(n, 0);
>>> +		flags |=3D XATTR_DOSINFO_ITIME;
>>> +	}
>>
>> This looks wrong, the hex string is present in all versions.
> When I dump xattr DOSATTRIB, null terminator string(zero bytes) seems
> to be stored in there.
> I checked the following function related to hex string in samba code.
> there seems be no switch case for version 4. Am I missing something ?
>=20
> static char *ndr_compat_xattr_attrib_hex(TALLOC_CTX *mem_ctx,
>                                         const struct xattr_DOSATTRIB *r=
)
> {
>         char *attrib_hex =3D NULL;
>=20
>         switch (r->version) {
>         case 0xFFFF:
>                 attrib_hex =3D talloc_asprintf(mem_ctx, "0x%x",
>                                         r->info.compatinfoFFFF.attrib);=

>                 break;
>         case 1:
>                 attrib_hex =3D talloc_asprintf(mem_ctx, "0x%x",
>                                         r->info.info1.attrib);
>                 break;
>         case 2:
>                 attrib_hex =3D talloc_asprintf(mem_ctx, "0x%x",
>                                         r->info.oldinfo2.attrib);
>                 break;
>         case 3:
>                 if (!(r->info.info3.valid_flags & XATTR_DOSINFO_ATTRIB)=
) {
>                         attrib_hex =3D talloc_strdup(mem_ctx, "");
>                         break;
>                 }
>                 attrib_hex =3D talloc_asprintf(mem_ctx, "0x%x",
>                                         r->info.info3.attrib);
>                 break;
>         default:
>                 attrib_hex =3D talloc_strdup(mem_ctx, "");
>                 break;
>         }

Hmm, you're right, but this wasn't really intended :-(

Given that all maintained versions produced version 4 with an empty strin=
g,
we could just leave it that way, it's very unlikely that someone tries to=

downgrade from Samba 4.11 back to 3.4.

Ralph, Jeremy, what do you say?

>> And the create_time should only be updated, when the client provided a=
 valid
>> value.
> Hm.. the meaning "the client provided" is saying
> FILE_BASIC_INFORMATION of smb2 set info ? I am wondering why similar
> two creation time are handled.

See MS-FSA 2.4.7 FileBasicInformation, -1 and -2 are special values,
so far I've only seen -1 in the wild, it means the client can update
only a single timestamp and leaves the others unchanged.

metze


--Vkt8oojp1toZ1NsacuZ9cdH4zwR250pF1--

--fCMwbzsrnUNJiTHyjrLB8fKp5FmLiFfZu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmAsOWIACgkQDbX1YShp
vVbrbQ//YVdGlOTS8BALzLHBrZNUKYHURtuTePiqt76UEXv4Yp8gzFvcIEaUC1hN
5386EXUxSK1xXgkQ6Xl0//oeU0nkTvnNYc2asFPnhIEVE/vJCbjNL8+VbKc5hrVg
24gCOboTvhnZlEcmsyzM48YbxW1zDrq916dgCtuDMoroWAEP34sm817IhNEe7YMY
eJgBPuFs0i+tz9dsjpN8aoIu9+53BkiVNghkYFshCBFpL+URHl3cX9bw+Amr7vaW
gs/5OXdaqS4i80vrAl9b1/Fm2kppA3KtrpEqxggz+WeasilxmMV4y+4p8k+wSY2Y
a15FYA35sTGgJuwHprv5x1V172I5Aom6HlAt0xBVSErJpwg7eUvK0+UMaswuE/Vo
KPzPBokP+YwvYK2osrprjVAc/HdNMKYgc6cg4dsYOx73AY4nuHC5nhgH+/Mm5ksP
+/UYqdg+fm4i3f4B7mqdiUHQ9wVuMaKrOW/neJHgd836ZpijoiejbI6wqtcSSgV/
ArfbSvtT7uKuJrIiB98HH6QuMYfj4Vq9Bp52PiqPXOocBRLcXjeb1l/3yxLOlc38
WPYznXa/mJSrCK0oxuLY+wRsh5EFfILAX3UwxFW766iBMcEsfOyWUPi+tOnPKXB2
DShXEbjDI2U/CpsOOUW+3iZ55KSR+Xp/e+iGDVR6PsZ3pMw0bf0=
=U/Jv
-----END PGP SIGNATURE-----

--fCMwbzsrnUNJiTHyjrLB8fKp5FmLiFfZu--

