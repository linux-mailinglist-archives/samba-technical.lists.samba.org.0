Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F30D16ADEF
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 18:45:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=IUedEHp2SaV+w39Qe2HUQ6MDxXQ2PYdtl26JUGkNNNM=; b=N7WPFMegYwuEv3mhpe5U/dOQzF
	TOu5BGOAZG9ehy72Uvvcl0lFZZuoNjeHAtMx7gtFBYrriC+Px0LErhtRljz0J7LAr4qL7x7NoTVcz
	dWHjR4ExBp3MV8tYRN0pLQsy+asmrQgYKoK+3v6t0/h6BsELy2JApiEcKtxAiHAymmPMb2yhQykAd
	aXnvCTGgdigfP3g4tRSrC7au/fNc07SaZFy7FW5q7WaXAfll8X0tLRP1OSnWuCsy5g11Y11R1qc8s
	3XX/CzZ8OF78nFR6YS6+0/tRGNnsLnZSXVL3hQkkXlL271FpyVuVHrbJgTncCYLqVQfmLPe4yBNaL
	7SRfP6Dg==;
Received: from localhost ([::1]:57072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6HmB-00BRv1-6X; Mon, 24 Feb 2020 17:44:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22076) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6Hm6-00BRuu-6S
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 17:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=IUedEHp2SaV+w39Qe2HUQ6MDxXQ2PYdtl26JUGkNNNM=; b=zxRjn6fmDiCwUxNLOTgTfQ1IGM
 2w4Iwh7RhYBAx5ChdVrw23JcvJDmnUGSSVFQZMIKZhjWRuA1EHt2GhAX5puR4qJNm9fSG2MfFel42
 ft2FAPhN18BmQVG9E6tZrV3IFR0b6rQEnTkSJ0UWRzHVNvxW3gDeh8pQYRRLRs35MaNBDRgy/r2QU
 o6WwH3CwxVqF3bPjPnakMrey0CQHEdkHBXoD2S2k6NH8LoI7YwU5nRbkeViYtW28itmyA7NCefDeO
 orTBYWE+xEAp0EHY37qKbvQbMppRMCaqosTGls+7OZNtA/5kGOn/VfciDyiO+Rh7NTriTLF2YTiAO
 Y6FcyMqYiebpeqIxFxjJJehEhmXSrRctnX/SfPHcr/TRMMMKTIUE3PA1sJwc3t9l1COX3faNQSMWP
 LozfKJfhpTnNG0iFPP+LHlV0BbkwUQPzL8Jqy06X8cYWMW2V47Q68svJCkuiwFfJJXPyopPnvz+eE
 liI0nT0CcidfLCa9UeDC6Tx2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6Hm5-0000GZ-Bi; Mon, 24 Feb 2020 17:44:09 +0000
To: ronnie sahlberg <ronniesahlberg@gmail.com>, Jeremy Allison <jra@samba.org>
References: <CAN05THSsnmesxc0UH17OK95KXAY5NCYisNc6pNyGDykYd=R1ig@mail.gmail.com>
 <20200223060804.GA32193@jeremy-acer>
 <CAN05THSbbYa_5gNa=2gexPo709MOSKcDjzX_+raOX9Pmn1+yxw@mail.gmail.com>
Subject: Re: ndr64 support
Message-ID: <f465d7b1-c587-1eae-dc74-cb420fc18884@samba.org>
Date: Mon, 24 Feb 2020 18:44:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAN05THSbbYa_5gNa=2gexPo709MOSKcDjzX_+raOX9Pmn1+yxw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="X3bBCasikKAOusz6CmzhraUJTlNzhxeWU"
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X3bBCasikKAOusz6CmzhraUJTlNzhxeWU
Content-Type: multipart/mixed; boundary="YqDkqDkVdn71zSuSQEOfdqk9RSVGpmQAR";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: ronnie sahlberg <ronniesahlberg@gmail.com>, Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <f465d7b1-c587-1eae-dc74-cb420fc18884@samba.org>
Subject: Re: ndr64 support
References: <CAN05THSsnmesxc0UH17OK95KXAY5NCYisNc6pNyGDykYd=R1ig@mail.gmail.com>
 <20200223060804.GA32193@jeremy-acer>
 <CAN05THSbbYa_5gNa=2gexPo709MOSKcDjzX_+raOX9Pmn1+yxw@mail.gmail.com>
In-Reply-To: <CAN05THSbbYa_5gNa=2gexPo709MOSKcDjzX_+raOX9Pmn1+yxw@mail.gmail.com>

--YqDkqDkVdn71zSuSQEOfdqk9RSVGpmQAR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 23.02.20 um 07:43 schrieb ronnie sahlberg via samba-technical:
> On Sun, Feb 23, 2020 at 4:08 PM Jeremy Allison <jra@samba.org> wrote:
>>
>> On Sat, Feb 22, 2020 at 06:03:13PM +1000, ronnie sahlberg via samba-te=
chnical wrote:
>>> List
>>>
>>> Does samba support the NDR64 transfer syntax?
>>> This was introduced in 2008 and makes alignment better for various
>>> fields.
>>>
>>> I just noticed that when I use libsmb2 against samba 4.10 it always r=
eject
>>> NDR64 as an unsupported transfer syntax and instead always pick NDR32=
=2E
>>> If I disable NDR32 support then the bind will fail completely with no=

>>> suitable transfer syntaxes.
>>>
>>> I am testing against 4.10. Which is reasonable new.
>>
>> I *think* (although I'm sure Metze will be able
>> to give a comprehensive answer) that we support
>> it as a client for testing purposes, but not as
>> a server.

That's correct. It shouldn't be too hard to add support for it,
but it has a might be problematic for us to enable, because in
some parts we may incorrectly implement the IDL vs. application
layer encoding and may not be compatible with clients, e.g. with
spoolss. Maybe we need to make the support ndr interface specific
and whitelist interfaces we have verified to be usable with ndr64.

On the other hand I don't think the ndr32 alignment has any practical
performance impact. There are no performance critical rpc interfaces.

metze


--YqDkqDkVdn71zSuSQEOfdqk9RSVGpmQAR--

--X3bBCasikKAOusz6CmzhraUJTlNzhxeWU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl5UC2UACgkQDbX1YShp
vVYUeBAAvDp3+T9XnGLcRp3rPJExYDDDJdhl6fkPwAYpq72MQLjgeonfgxpDOVYi
Bg1q9vVUJcUSm2KetfgX6R9Uy3vzJGwpHQhUHq0Wrc6oPX4v+g3XhbsXutpwHmnU
CvYiHiRBNSWPXRW2SAx17AmRRHxWjvoredDS9DfeXjczp6z3wGCXoi8ZDe2TwxJw
nY/nMkusGs1KPbn0SKcbs1MC6PrhM7ta8lXcZo/Qhw0J23lpIzXgpcJe/vPBKEwS
+D3QSy4OqbfqkazuR6cSuw00W2375tIA9v1CRdrnbqfXBYHo/KNZqtfvmXqLzQ9a
VGCYn4AanZEw5VysVg9KO6M/a9H/ILsBVlKPE/g1QUe0THRLGVAS7vJPCTpPkQel
J8TUFtZ1nMHQly2r79LYjEc3XnSDlL0myQZtVdQT5UeSOVUQcS9uVb/jiNJ6PDsY
h45ipDxt1l5z8yZ0xeU8AU+W0MRmPDOhKNzRvUCitoj4M1/bnOlK9ZGSXrkMnwl5
zzTeeyn8jphkdC6u6keJy7W3eEs/rrfvWRqqKGWWKQ6UE5Iz1VkE9QxhsE6a7pAi
5jSQNvzK8q6W6hgLe9crCKQ05H6IBSyAoyP13ELCxI1X4XurR8Zb7eZKXG8OkMXs
axf9Qz82HN28j+XW5JiecbawITcTRU2tsjRBEnCCwfTsyL7N13A=
=MERJ
-----END PGP SIGNATURE-----

--X3bBCasikKAOusz6CmzhraUJTlNzhxeWU--

