Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D228EFDA
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 12:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=jYfSUkd7rE/dxyv673+lN2R59fwQKLG7l9AuOA6yo2A=; b=6MyQjMO3YbjIjksya76jMVf2uV
	v/pEVlm5jJGl4Xz370SMLwh2tyqZrjiILVaGq4WE040tpEit7/ccxYFia/NNLvrDe3RuahN2SWLD0
	3wLY6L+FPo/oSpVxIDtvZLKh9Z2UU3s9yPJiM4BkcEHqSYlcY7DT42pMKV9cY6PHr3BdLYtdiQ6gt
	4Z2wWyBoEEfCnhRzG3lWFzQuQcHmlaPMBvxYouWBRcUE3pg0bM+64RWLDwXQVk0s/93rELQgPWz0i
	hMq58a9yWNfJNkZTe2n22PwBZKIilj3vp4JnJT/Ep5nGysCgV7zZM543g56sDAnSiw2/2v4Y+19xM
	nFz3NM9w==;
Received: from ip6-localhost ([::1]:63002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT09i-00CCIb-Vw; Thu, 15 Oct 2020 10:06:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT09e-00CCIU-Jj
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 10:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=jYfSUkd7rE/dxyv673+lN2R59fwQKLG7l9AuOA6yo2A=; b=PT5OcfPJkRnz5rgMls3N5ngnwb
 NQFT++5lYRFgh1UsqJAuMMRCrKIF2Ijos4Bi9gT0PutxmGUTm1YPniLDLnJhjxycvienbHpSDX5kW
 BiJyopjC+ub82lZMMga1fT4SWKAZQIE3wCnzqZXQwwH3iYsgClK5bjFJPpaBBqiKZVaKau0cYeUHj
 N/erkaBdz1RKd43rEsq0SSUHfNK958KZsEz2paPamLWbsc0LMWmHwInkVZ4mDC0+Q4a4GHWot0bO3
 rhgtM4iGLoYMyrebUzZFqb3bzfM9D5/2eC4ACj9LENNLDFyYkGRnUnX/BpEL8DhALTMD7cx40H4NZ
 IaOMUWLz47aNoe9FGThqTKGUvSZ057JMgqtKQhwi7j8FyNNp6Blk0SW7aLznaWTHbObyvxL50rK03
 Px9edUDYE7I1ewrfWOv0kp414LWM5h/GdCLVDSryu4QOvcL7KKgwfXsuomFBud9aoNwCKt5UGqXWk
 0Pt4nmqBw4Fa/WEQPpOQrhyJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT09d-00071e-VL; Thu, 15 Oct 2020 10:06:38 +0000
Subject: Re: Samba with multichannel and io_uring
To: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
Message-ID: <b272e0b4-d3f6-700e-d870-2f6a4d73d17f@samba.org>
Date: Thu, 15 Oct 2020 12:06:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RW10drWOsQmqaqXZtkUyQZUFGXI9MIdy9"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RW10drWOsQmqaqXZtkUyQZUFGXI9MIdy9
Content-Type: multipart/mixed; boundary="i1Pa8Vbu52aZtyqN76hUV3uSKLSpvkppV"

--i1Pa8Vbu52aZtyqN76hUV3uSKLSpvkppV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hey metze,

Am 10/15/20 um 11:58 AM schrieb Stefan Metzmacher via samba-technical:
> I'm not sure when all this will be production ready, but it's great to =
know
> the potential we have on a modern Linux kernel!

awesome! Thanks for sharing this!

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--i1Pa8Vbu52aZtyqN76hUV3uSKLSpvkppV--

--RW10drWOsQmqaqXZtkUyQZUFGXI9MIdy9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+IHywACgkQqh6bcSY5
nkaFJQ//dozVjWRdDdaaH5Is8NfS8odpzw0uL5H6X7/mTP8h0+VduIVCIKrpxdDx
zhRxuKJipFwKhMx8TIICe51vvEhQCbp4aGs6p9K+4IRCbjXlRfjAYc0/xnjsq2yh
VYuWrF6FZ8njtiWhtUDMGA8amSFAnOL6bB3bVmZzUAxtxo8fND0QJ3M0vN+0C1kc
pROHrkbu45ISMZyj0YelitMUCisboRsf7ylfeaEBQKLija7Bpqu7oDkxHNgIixGn
rg/aaHY+znq37WQNu80mKGreal7NbNzn1SoEAffa0TIhe6T0cmEPOqt1skFmmC74
1uq0O0hUp70gSkjonCQuHRftsAmL/Ytca4/IizItbvsd1Dtuce5QzjZz954T1OQM
EVS7b8RF6Zgl1UkNlkUk6XOhYegrcypBQVmTimYPyH9HeRs0Ghf6iZGyecS+B+4L
kuHIAqdXU4N+TMdOA/Aekn6R44MlpOlle/CIXqckB/gzihijv1Wwwjzq5eo4qbQt
81TWMnYxMi6cGhTaK+h+EMjWTMeEAfP2vAPg89PY/tFyeM48PTd4OgurKOTLjdoP
QCz/nEw3Kvt8V1QTongBwTl3b25KfjSFIRre0iNPZ+y5hzjzJ+m29DfEpd1yRwBm
5b3oqmbgn+u1RuzidKFcBrvBL5l/DjuFduJaXTdwZ0ck2UT6qSg=
=3GWD
-----END PGP SIGNATURE-----

--RW10drWOsQmqaqXZtkUyQZUFGXI9MIdy9--

