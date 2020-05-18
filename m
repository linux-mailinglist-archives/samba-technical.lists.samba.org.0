Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ADC1D758D
	for <lists+samba-technical@lfdr.de>; Mon, 18 May 2020 12:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=DVM5IS5n7RtExhNfNAxPjAX+dSk76cVnw+Le+g/jVPA=; b=Njkb7WiCGZqlEJS30q95MEAX+I
	jPe5k5asuy0DpyTWhREpW4fIsfe6srcB+fbygDIgYPlWfHejO7GOxCWCfBII2lO2fb6hYfZHwnK2l
	+kULVfaiYBPghHAO3pvvxZzA88MpnOgsTISIMYYaGtzhppcc30p2hHgQ59h/1MOZJJb30EjNAxPfi
	he4GGfG+s5u8iyYM6v7g9gbrYmCETgjXyL+yqWUVa+dDAEFc77NO3nMShC2nxX3ri8eW+ih8OntDR
	+p8PK0r5Df8bewDCeKdZwwwxz+JGy1nrfq4HHcQiBnKEqx07ZhIR2JaA4C0E1wRFvv9o8HC2r6X/V
	sLmnA4cw==;
Received: from localhost ([::1]:35816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jadL6-004smx-Nf; Mon, 18 May 2020 10:49:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jadL0-004smq-8X
 for samba-technical@lists.samba.org; Mon, 18 May 2020 10:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=DVM5IS5n7RtExhNfNAxPjAX+dSk76cVnw+Le+g/jVPA=; b=pGi2uJZLVgmX4gj5E1sqNiPqC5
 zv/az7N1Xt6QY8AaU09zFRFpOPZHxa0OUw3lgBa3f9+YQ3VztgiqxBCbZwAtcAimCTt8XjNfzD4Ve
 gHnRWhJ8Rxp9c5OnV/v7/HTrpglxMNAE1m7KyDuorgSboErzsZL5uPfvSyY2XJiObohrDuSnEbyup
 t1Uz5hUxljYLR2AW4qXgLa0Mj+A80SeoiMZsDf4j49kE9daDhC7jAs7n8V/TKbeQjc+aU6XmAxlnI
 rCrKTJG8Z4DcobhV+r+3UAx4+JiaepeCFgaQzSXs32Gt5ciPiNJpg2nKJICo3rE/wyenMqA7fkvrI
 uzAyOHl9dkGt2hymh/ft0UYof59myDnxMsLb/EEeu8Vq0rOj+Ko/81GkB93QYLDWSPtr4InVi6UL3
 KeZjD/+pj++xzaNpYogFeM+W4eLUcgI12DwFoIupTqyqxir+tosSrDb034LyyLcjO5TBn9ern53kV
 ato1rflHRz4hudexoHUeOYNF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jadKy-0000Ki-2n; Mon, 18 May 2020 10:49:36 +0000
Subject: Re: [PATCH] SMB2 Compound related chain handling when generation of
 FileId has failed
To: Anubhav Rakshit <anubhav.rakshit@gmail.com>,
 "samba-technical@lists.samba.org (samba-technical@lists.samba.org)"
 <samba-technical@lists.samba.org>
References: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
Message-ID: <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
Date: Mon, 18 May 2020 12:49:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JBD0RaP1owMlZMgCfyzsdXoSQ3lps9ToX"
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
Cc: hemanth.thummala@nutanix.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JBD0RaP1owMlZMgCfyzsdXoSQ3lps9ToX
Content-Type: multipart/mixed; boundary="6gOeWYzLfQsR4pRf3KTeyaGXS9eF5fl07"

--6gOeWYzLfQsR4pRf3KTeyaGXS9eF5fl07
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 5/15/20 um 11:29 PM schrieb Anubhav Rakshit via samba-technical:
> Please review the following patches.They consist of:
> 1. Smbtorture test case to verify the expected behaviour in case of
> Create failure in a compound related chain.
> 2. Implement the behaviour in Samba Fileserver code.
>=20
> I have attached the patches.
> The changes are also staged in github.
> https://github.com/anubhavrakshit/samba/commit/a0e7d6196b259038342569d3=
71ff67ed30c9b6b8
> https://github.com/anubhavrakshit/samba/commit/4637b6108f188c1a2df7cce9=
4165b621294942a1

https://gitlab.com/samba-team/samba/-/merge_requests/1350

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--6gOeWYzLfQsR4pRf3KTeyaGXS9eF5fl07--

--JBD0RaP1owMlZMgCfyzsdXoSQ3lps9ToX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7CaD8ACgkQqh6bcSY5
nkbE7Q//QYDLo7NyhExIyco4rIcSwj7QjaBKTOXPRynw5CT2IDNa+PlaOMujtIF7
ORwruGd2VJp5tqrWYSobBrDbGO4Y6jIX/DDRtSC6iJOfuKU+AtsSrhKNTWMrZPp0
4j8jNgrCkuXVecwQKt6Pw1KHiQc1W/a2kQmCRgITefxsfV+GL8INO5ifG/O7aAK1
UUxZrPscUyllBKznYtD4dfDyuaq9oLc9aVlJrU2FSYDIzUMDek2jGm/T8Ehqc49K
oy/Us0+9nGIuGdg0usm0WbEiIWP+rW6LzhhwAuMOQU7ikdonrdvEwSPZlxWoWcXl
AqL6bL1hFejON2erGH5psuync4ZL+I7nBZqfe4XrO1lu92tKjCrpUehy7mr1GwPN
0+5tj/02b3SnQ4ij37HZA03Y5jaE6NQKzm9VqRSIl3tBsyDORiezgckh1AmonFtF
ljI4yKEquvxA5YXw+mmCX78Wjf2l4NOMCrR6+5QEqyD69dduQlv+XbhP6uzVezGD
5ltXHNvsC5jXf4xz/qV0xc5BQatfGV+0M2g2QoZjF8DE2qWW+BFXBWXjiyzN1Js3
p7HHaISQjN0Xcsr0GU/+B+mSGKW6vRLEN6AplEs4Euf70NbHINTr30OexCydiy7R
79xZpxSbLtgFmB9Vsd01DENEgWsbrQSCsFISzQCp1+9ilj920N0=
=HQTt
-----END PGP SIGNATURE-----

--JBD0RaP1owMlZMgCfyzsdXoSQ3lps9ToX--

