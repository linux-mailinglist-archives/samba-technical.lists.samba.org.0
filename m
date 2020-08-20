Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BC824AF73
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 08:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=C+qUd1WZrpkkvGVNm3rkUGL/q8HxAJyGgE4EgjmLAhU=; b=uG+pFuJiuKspawLBmuo/5WdjXB
	VDJZY4+ANJtm/MDZwH5RtmdnUkOv6djPT5LhRIW9FnAPHjoVSxH3N5k+hYF5rZLfTvPTZtHeZxte3
	qWU9Rid0zFxJH0dK5+RWl2XiKDEmyBY67czg5FqH5VF3AvhclCsft4KNemhM+tRmWGp4a82amxslS
	u7Hp4mjcKlW5lQwDMRqwURbJhgJFNHuuzIC0QOF8lB7C+oNMVe+tsnIngNjQBR9+F9ReiMbK3Nh3O
	P7WGfBC0zPlGJqYdri7BOobLtPK66cTC+H7PM1RRNq4j6DGfjtf88J82Ktyw4POn6IKuZTH8uXzX5
	S6P6EZyQ==;
Received: from localhost ([::1]:60414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8eSw-00ENbX-Vd; Thu, 20 Aug 2020 06:54:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8eSa-00ENbQ-6l
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 06:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=C+qUd1WZrpkkvGVNm3rkUGL/q8HxAJyGgE4EgjmLAhU=; b=niUrjlYH0TF1BXGx4bzmnjUyPm
 syX1LDee++VF61uxU+7idAZV0rIvmA1aNF6oFsYAe5FpFtUEnQLYL0ziYitiyhhVZbz+SfSIgC4VM
 RuBFgNtFrAaJaC3wLtt79t1zm7+rGfMHvx7OqhADcPgiDof9JZUsvbMOrEpmDRg3V1zEXJzTZs+/B
 tDvdAklkHmB67ebwBZAkAvYS+q+IGeo3fZgd7OUV5GdGkSmPxfrOneHYKwiqs9vqll3EF7FCNxn7U
 Kwa500T4Ys3gK8ER9gFpUA1b0jpU+ljYFM2al+otBChniseYHeaeygw+Ey2dLtMsLXKPcYaiKDHyL
 tSR7Q3YDy6QVjazQLinGnE81+LLkPcYnF+5G2uXKSA7Nmoey+EAjFARBEauT//1YpIHOV7lP5ps/y
 DWvBZSxHwV2fNOuy4T9rID/F6IgGYmDyk3vlIu3ROVOZe2JtsaKH5n+BhSrIwlT2x32NOia8Re9kr
 eiH9hSKrY550q5PK/Cfh/sA7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8eSV-0001fg-Tn; Thu, 20 Aug 2020 06:54:00 +0000
To: Rowland penny <rpenny@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
 <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
Subject: Re: "auto" for Kerberos, a history
Message-ID: <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
Date: Thu, 20 Aug 2020 08:53:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="HrYGuA5PPifM8DGZtIKCcbGixW4bJIJjY"
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
--HrYGuA5PPifM8DGZtIKCcbGixW4bJIJjY
Content-Type: multipart/mixed; boundary="51cKprh0fVQQptO7txK3fyXMjQty2Pgwx";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Rowland penny <rpenny@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
Message-ID: <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
Subject: Re: "auto" for Kerberos, a history
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
 <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
In-Reply-To: <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>

--51cKprh0fVQQptO7txK3fyXMjQty2Pgwx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 20.08.20 um 08:30 schrieb Rowland penny via samba-technical:
> On 19/08/2020 23:10, Andrew Bartlett wrote:
>> On Wed, 2020-08-19 at 22:13 +0100, Rowland penny via samba-technical
>> wrote:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -k KERBEROS, --kerberos=3DKERBEROS
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Use Kerberos
>>>
>>> If you check the code, 'KERBEROS' is actually 'yes', 'auto' or 'no'
>>>
>>> What is 'auto' in this context ? surely using kerberos is binary,
>>> you
>>> either want to use it, or you don't, 'yes' or 'no', so what does
>>> 'auto'
>>> actually mean and do ?
>>>
>>> Do we really need 'auto', can we not decide what the parameter
>>> defaults
>>> (for instance) should be and remove 'auto' ?
>> In this context, the current code behaviour is to try and obtain a
>> kerberos ticket, but to fall back to NTLM as 'good enough protection'
>> if this fails, for example if no KDC can be reached, or this is an IP
>> address, or if the server does not offer Kerberos as an authentication=

>> type.
>>
>> The idea (when this was written) was to at least try Kerberos, rather
>> than continuing to default to NTLM only.=C2=A0 (And on the flip side, =
to
>> continue to work in the many - at the time - networks where AD was
>> functioning only with NTLM).
>>
>> Andrew Bartlett
>>
> Why not just set the default to 'yes' and if this fails, fall back to N=
TLM, this is what 'auto' seems to mean. To me, 'auto' is confusing and to=
 top it off, it doesn't seem
> to be documented anywhere.

yes means no fallback to NTLM,

Should we use "disabled", "if_available", "required"
instead of "no", "auto", "yes"?

metze



--51cKprh0fVQQptO7txK3fyXMjQty2Pgwx--

--HrYGuA5PPifM8DGZtIKCcbGixW4bJIJjY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl8+HgMACgkQDbX1YShp
vVZtcg//YrUI7kAKjtHHD9bCeP36kzc4Ge+PZ87anuYmJGi8/9Ac6VD5C48pOU8A
9eKmeMfoczJuDyEAqw5LXzasX96rq3JnyF4BiN1DVE80py6YcIFO3auUg1WZeE7A
DNSXnyOixMjKomiuzWb65i7t1qfzJ63BnV7Fnh++0x8ZHkbhTqihCRp8dFEzMDzv
hpauPI+VLJ1x3w12kIDKq0F6YJKbc7iQP1c8ASRQaloGdE7ZEEa/MuRLcXYZQmFQ
/IRmPmQLAuxAc7zFLfrdHGRia7VOLzs5h6KjnzLXHnd4e9Tdf2c8794Kb/SsmQnL
yDtdfKXLFmtGl8l7akOv6HmqlXNvXoIE4gz1p6FaOXvj/AlIDKKthVW89bPuSct3
OpxX1LkJtF5cbAg5BM9n5aYBYmuhdogY7tODXlwh2VqvzTvxyViU4r9XtXHFkE7G
Q5EBiw1WhqXZ7BIArBfGS5TToCJuq51yjouUJ4Z5NOW+ZnSvEsy2XRpI4YtKKUvG
MXwGhpPetzPKhXHZbTz9rg1OmVOVInVpWQlGNX3WgOGNFkxbtl45aMW5gppeVWrt
rF5g9wxPuqy1dXR+HdbRSZDCavTOsiqPdyybVgvBZMZTG5YuANi/uKNrPuslkpMU
Bsk7LnYU68S+kPS4OOctPNF8kBKx1L+Q5oUTpd5AvQmx+cnKf9o=
=T3Vy
-----END PGP SIGNATURE-----

--HrYGuA5PPifM8DGZtIKCcbGixW4bJIJjY--

