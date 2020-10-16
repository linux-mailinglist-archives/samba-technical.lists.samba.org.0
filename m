Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E91DB29050A
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 14:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4kTBlh2N7pmU3HYI7CyZya27xpVh2ayjaN9t9DFzqck=; b=0ie5i2r88JCiAsgllT5FAjiw0C
	5fUju1DeUjcnlrUlFH+SMgWIQ0jSJ+jjumjvovvTiokzntbzFTAQWpMKBBq7hJ6Lsokqj5nI4SnQR
	4zO1NiqyoI9vr6mUh7vkd4Pn1EauyU/OunAvXljWbIHpS4dSqxa8xH3I2szDVWs7LQCQNBM/+FKzO
	jOWytinP7d2xDVAP9HevR0Nn1lKGs0IADTC414gVzLIQ4WvhivShzphO0aE4uoLMZjeA2SRBb1MSY
	9WuZQVHDC+PBe/NzxF8v3fP5HzCKrWwmAiNjO/jRoG/BvSmgbdmwL1IPMAcniRDZUBz51A9EkyNBc
	aKsZhJHQ==;
Received: from ip6-localhost ([::1]:45054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTOr7-00CPB6-Nq; Fri, 16 Oct 2020 12:29:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTOr3-00CPAz-C4
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 12:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=4kTBlh2N7pmU3HYI7CyZya27xpVh2ayjaN9t9DFzqck=; b=FAIem7/DfAOFFFwwHa2wCfk5P9
 fnrSEMzPLdrbLq8+g8yaTXPK/5FR/X67886vcbcwKnZl8+4cFbwTCJ+ESHjNcQueykM/E2pkEobby
 oQwUnkFpH4qMNa7ev2ZKYTRFn/AKjUN4xB76GGrZFJg64+aXt/VURiB27NWg/2JncTBo1jclBpt0X
 gDYDtQMv/WX72NY4br99SlEGBFEk6A0dQCa5Ea7xciwUGfgUE6/i3XeQBuC/mZVFVzIPWA1aYtSoH
 Acl83+6lCJhleQXjA10UIZWccjAadgV9r5m5whDSf/NgTTNmC65KyggqrHQAUy/uPQ7UJVzlyvjks
 0DG1Y/M1Avu3N4fJh8zlW6wwJ2IIrTQmBiGQlJ2f4DzssZdRVYHffzybA1BXinp1xo/iBf89swkxQ
 alKm4uF9bJC+sgVTKAgqvYj+ueElp6hXBYGvb3wdeVUPNMQuabY2KNazCyJIyLLuyGdFW1VS/tfq6
 FPPvdRvEBPHKBau3g3UvwDmw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTOr2-0003IU-9Z; Fri, 16 Oct 2020 12:29:04 +0000
Subject: Re: Samba with multichannel and io_uring
To: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
 <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
Message-ID: <72a7edd7-3bc7-22ad-39be-fd2d4d567825@samba.org>
Date: Fri, 16 Oct 2020 14:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="YRnZHLXufqg6VTH5yr7EqanQPpdsoTi8D"
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
--YRnZHLXufqg6VTH5yr7EqanQPpdsoTi8D
Content-Type: multipart/mixed; boundary="4CIFFxtguNnWb3KTOO9ZN66UTJ37XHNEA";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Message-ID: <72a7edd7-3bc7-22ad-39be-fd2d4d567825@samba.org>
Subject: Re: Samba with multichannel and io_uring
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
 <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
In-Reply-To: <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>

--4CIFFxtguNnWb3KTOO9ZN66UTJ37XHNEA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

> I just found that proc_task_name() handles PF_WQ_WORKER special
> and cat /proc/$pid/comm can expose something like:
>   kworker/u17:2-btrfs-worker-high
>=20
> ps and top still truncate, but that can be fixed.

I commented on https://gitlab.com/procps-ng/procps/-/issues/51

metze




--4CIFFxtguNnWb3KTOO9ZN66UTJ37XHNEA--

--YRnZHLXufqg6VTH5yr7EqanQPpdsoTi8D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+JkggACgkQDbX1YShp
vVa2EQ//bK++VFOp0ZZ1Eh2xE0PyAa2Xl43Xhh1DoIhUQwgHgXsTtPtlAc+r3c12
BuYOgozjAAE4hWs+FQMa8Du37eSg45qwcGYHNeGakuTQvaU0igiRKGnLQawgspkm
1ILYGV9SJHVLplNB3BZWYdj0UgB+SB0YmZTOTYB7EYfx6RSLJLYaU5NHM1bKYdah
+j4M9E6oUkJc5nOeBnMqSJfjG/dCM84Aqa5Z5sPVuhJ2tKUg+yQTVDtQHgrkyl+j
eQKb5Kq5oMCAu2MJpQgNkHd5CaLrCqDV5db4fUmsQKWHPYt5j6h4AV5pbSzlIIxn
AWzDZwhJxk+RgI6oSSu24jhLRIMa0kHHVhLoafL1zLd3xQhDRxnq7ayKK58Kp86O
Ak+io0mnn/ySHDlhxAelPInT8yqGE8QvCWe4SDjdlsGvhHLUHXC7d+6K0d3dU4CM
Anq9KpNC1A2CKEwtFwuKFur97YHcX7hccLqD/D+k9uNKt7fIk4RIea6vy9NW3ECY
/mBLmms8qhf6/4BdhCo/Ujlxg8S79IERbNn0zNXJfKUYRvLzINdQc5j2L6T551dc
4HVdxurCEktjwNYeQKvuRpPnH4CnUSG5lkMKaWX2CqRiZHiCeZfoUSL9bD/ksMx5
Ta3LGz/1hJcN5meUzGSn8lfANEIgeJt33dqKkCmIBfZXhnXvdBo=
=GAEA
-----END PGP SIGNATURE-----

--YRnZHLXufqg6VTH5yr7EqanQPpdsoTi8D--

