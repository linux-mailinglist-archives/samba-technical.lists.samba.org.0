Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D63460F5
	for <lists+samba-technical@lfdr.de>; Tue, 23 Mar 2021 15:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=UgxaYjnO8WcIZGYrDe7L/Dn8RSa3YCdg/0jvHBjj//w=; b=tsu1jU1xATg0TmDyzTrd/wW3QL
	3cTWZyWA0ju2QlNAZlDo8pwn4rLOhGQvHErXH6hqv6u2F4XNRfzLkPC9vvOYYzK47S5rDYgDZgVkA
	+6ID7N53b5inEKpPAkya71eAcb4mgQNZG2HLz96DELA9Aq2CPgEYV4hk9qRZaj/rwobPnl652YBo/
	YCdaEgD+TPRzGHK1QD0Kb+H+k2D+ECfonJFY9BfbXFF6Dw6ONk2GcmaV+qO4+9cxElKCq/2FH8Cso
	aIjn06PCcxG/CQQimqMOgucM1vYu261UBKYUGw7e2IGfQEMqCaHw1Q2/yutWM8g7Sr7WFd33W869U
	gu5JKpZg==;
Received: from ip6-localhost ([::1]:38238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lOhei-006NLq-Ip; Tue, 23 Mar 2021 14:05:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lOhec-006NLb-Ii
 for samba-technical@lists.samba.org; Tue, 23 Mar 2021 14:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=UgxaYjnO8WcIZGYrDe7L/Dn8RSa3YCdg/0jvHBjj//w=; b=jgFgQX/cARYBNLP2/+8SXAd1Tj
 BM2VwSlpCJtqb7KuueyT7RR+j7JQN2cRq4Vg7BlWoUspQCKnAFxKolO6vhA4EA/lOVBOpVinasvcA
 6k0/DwgcJ4HHo4NStGJ3EUgzaDvobky94EBj7/cTIAdA/wyYH4/+8W0c7eNIySNWAN5AHzuCRLUAQ
 0HZazGoioLHr49IP2yF2iVDV3+HjTSoZnOWnyOpqPJjp8Z1xEtzIsvmA+r77jQvo54sX4vHPKMDXX
 RP1OXpWx/ycW8J7PF+gngD8Fxo26Jl+pZRcDIDj5QCtAFDEW91ps9DZJaXZ7NZzSly3Id8Xu00n7y
 R3QROHtqZgSqDqGO8WNbRkZPyhH9a2yc4IEQd2FQ+iTeeB8K7jVrqxIRNWWo/AB9Uk6cv7YyrdOfN
 1Tx4YtEEg/Kw3VP0jBFaj1tEQ4QVz+SrGAGAXMENRZQZKEC5tQI/1xabAjitpB/nQ9KCro61GVH6w
 jd6UFhWELMWOtolMszuE8NTY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lOheb-000783-IN; Tue, 23 Mar 2021 14:05:05 +0000
Subject: Re: [PATCH] man winbind
To: Rowland penny <rpenny@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <64a50e84-f92f-bcbd-e3cf-3e5ae55b5b7f@samba.org>
Message-ID: <056cceef-77f8-0635-275b-75fe75d33ec7@samba.org>
Date: Tue, 23 Mar 2021 15:05:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <64a50e84-f92f-bcbd-e3cf-3e5ae55b5b7f@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gHoYarOOEfZbcrW5l0RNgrVIOhGTrTiKy"
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
--gHoYarOOEfZbcrW5l0RNgrVIOhGTrTiKy
Content-Type: multipart/mixed; boundary="P01Ux5q65BYz3QqyF3BoJ0cQzRGmdSShm";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Rowland penny <rpenny@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <056cceef-77f8-0635-275b-75fe75d33ec7@samba.org>
Subject: Re: [PATCH] man winbind
References: <64a50e84-f92f-bcbd-e3cf-3e5ae55b5b7f@samba.org>
In-Reply-To: <64a50e84-f92f-bcbd-e3cf-3e5ae55b5b7f@samba.org>

--P01Ux5q65BYz3QqyF3BoJ0cQzRGmdSShm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 3/23/21 um 2:26 PM schrieb Rowland penny via samba-technical:
> Seeing as I cannot seem to do this through Git-Lab, lets try the old wa=
y =F0=9F=98=81

well, running CI on a doc change like this doesn't really make sense anyw=
ay.

> This patch just removes an untrue statement from the winbind manpage,=20
> you can run winbind without running nmbd.

Lgtm. Pushed.

Thanks!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--P01Ux5q65BYz3QqyF3BoJ0cQzRGmdSShm--

--gHoYarOOEfZbcrW5l0RNgrVIOhGTrTiKy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmBZ9ZAFAwAAAAAACgkQqh6bcSY5nkYd
kg/+OurkGMkQ/vSclb+oOg/y3eYQ2Mj8XbAxZs0xcIXVY9fRMM8e1/Szwc5PYyJrWYSPX05X/g7y
EANKWq9eeP1y876KK40C0hc6RL3dGTywZrs3YVO7VvxaSGrg1MUJfYQfF34idVE7rQIn2wDXm4Wr
qg+rk8ihAaWiFELZKmtVwNrEw/AMabpjgDO9WQ/BudPLWZKeIJGGc6msLQXEcF7KGcJVQX2lwdz0
TVoJCYU7NmcECvib3PVxEfo0tTbAil2oPhonCXcH4gJacLqpOvLE90y2elNEGcrR/JOD6w6hCCJx
4lNJrd5Bzw9BoWL5t5gKUdoHE7ShPXsOHnBENPTiSVgQESAl3HaLClCQpLI5CFM+GmWV6caZ32Ni
yyy8sa6WypGcXxOtr+1GQbUXlb/1F6U5VO1sMYtzzYDZltzagQGMN+ur2O87aBFZC1TWA8S8XyTt
fYjdNjWigFN8+kDNs2cki2RmKrQC5Theqgg8Zifp0Eiuem9JAj7oUydGzo/eD49QwWlXPVblqKf9
BLdVPryeJEKgEYWXNI1yRocDh0BLPMSaWO+7eH8lbOIJm7j4Q7vlO6Lt2PhxYrPOxsNRbsVl9I+T
Xlyvpztn8ATyp8CL41R/pRWKyd6R3yOKFhAIa0aceBT9cdaNAURgWHoUnx65kNZ7Av5VdXMTPRRJ
LdE=
=M2Mn
-----END PGP SIGNATURE-----

--gHoYarOOEfZbcrW5l0RNgrVIOhGTrTiKy--

