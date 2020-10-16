Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0A290569
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 14:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Ua+qWKv05TVMUrzuP7cijJmDrlkomXq/PjGb5qZHpoA=; b=2DXZOptPDWte3hzCLXjzKe5o/N
	Ax4IOZbAaWx1EQvBUtWM7qjUh3RmMfDLI/hzcavYUy7w7hKkiYXUCQ0wtgs6mPJ3s8SL6D8n/F2RP
	aQl2DAUIvF2ru+UKzuj8fA33zqGKIyTCXMfdzq/Y1U//foF7inK2khS1CmpSdOIVWwso3KV+4tPFz
	zjBvrf9PP3+wW1xnRcKIbw3JcWd3k3j1Gs0cxISn7+tWcYo1/QVmiIV+N4g4z79ul6U374BgVJBsN
	5RnKt2TCNGbvUg4Hf5Raq0xf+5MImf9IZVWx6Cd/KzNF3Mds7qTzvyiHnS8XYg2jLa7FpW1P69jy6
	k1gKzKnQ==;
Received: from ip6-localhost ([::1]:45774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTP2V-00CPHt-0a; Fri, 16 Oct 2020 12:40:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12248) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTP2Q-00CPHm-Jt
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 12:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Ua+qWKv05TVMUrzuP7cijJmDrlkomXq/PjGb5qZHpoA=; b=uAIkpO4rYIkUfR9WxTVDw9owlV
 c4YOG/+P8Cig6ppTbAjmG8hLVwL5FB+8K/plSqvczXolqp64CPlLFPjWl6XIvVObTHMJmIEcerb80
 SKaUHDM0OjOVUOAMpm+wUUudmdW9BbEZnBGoCkTsIDgo6z/HT/nrA+EHpHMZAUfaR91tYZ1gtM9EJ
 gKhy074tSZo8tmoV97cXglhKMkHnXFgDa3Yr5SQCsOHx2H6aT3WQEzo2vJxpFMkv8ILESHyyW0NA/
 hxb8Y1uA3Q3RwGHcPK2x+3zX/nqJFF+Wgq+OlG3xNLGm+hGsoeGt6FNHYP1caDbzntIUj+LulsNQZ
 FTNQdoqtvV/DjE7wSsM2k4CP08yt7CmnrLggM/4/nDGC/awPu/p7DM5zX5HSkbQ5srAT4t0U+6BXq
 bIoQIXGr/uBIaXMQbqfgSwkAK4TrGtVP+d7gGOn+HeJRbbUIAs7iBT6Szk7pILyB5Wh60WZi+17wJ
 ckkQ8jwgV7+WJa6tF7/HWSJh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTP2P-0003WY-RZ; Fri, 16 Oct 2020 12:40:49 +0000
To: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
 <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
 <72a7edd7-3bc7-22ad-39be-fd2d4d567825@samba.org>
Subject: Re: Samba with multichannel and io_uring
Message-ID: <5e052fc2-a513-1f9b-d939-fc79ef41d96c@samba.org>
Date: Fri, 16 Oct 2020 14:40:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <72a7edd7-3bc7-22ad-39be-fd2d4d567825@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="T6uFHJ7ROrSUajMXLX1GY4KU4IHRm5EFb"
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
--T6uFHJ7ROrSUajMXLX1GY4KU4IHRm5EFb
Content-Type: multipart/mixed; boundary="sAtErHz8pQE3aEOD06ShSB9BYQ0ii6umG";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Message-ID: <5e052fc2-a513-1f9b-d939-fc79ef41d96c@samba.org>
Subject: Re: Samba with multichannel and io_uring
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
 <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
 <72a7edd7-3bc7-22ad-39be-fd2d4d567825@samba.org>
In-Reply-To: <72a7edd7-3bc7-22ad-39be-fd2d4d567825@samba.org>

--sAtErHz8pQE3aEOD06ShSB9BYQ0ii6umG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 16.10.20 um 14:28 schrieb Stefan Metzmacher via samba-technical:
>> I just found that proc_task_name() handles PF_WQ_WORKER special
>> and cat /proc/$pid/comm can expose something like:
>>   kworker/u17:2-btrfs-worker-high
>>
>> ps and top still truncate, but that can be fixed.
>=20
> I commented on https://gitlab.com/procps-ng/procps/-/issues/51

Ok, it's already fixed in newer versions:
https://gitlab.com/procps-ng/procps/-/commit/2cfdbbe897f0d4e41460c7c2b92a=
cfc5804652c8

So it would be great to let proc_task_name() expose more verbose
for io-wq tasks in order to avoid the limit of set_task_comm().

metze


--sAtErHz8pQE3aEOD06ShSB9BYQ0ii6umG--

--T6uFHJ7ROrSUajMXLX1GY4KU4IHRm5EFb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+JlLoACgkQDbX1YShp
vVaKwA//fZUJFqjR37P1imLMv4yojrX/GIVz0g/yszUIv9hRAKGUQTuuoGTIecil
CWVk8cBteseTAeHD2O5pSSxavGe4HrPQk4a74DmHphqhJ0MeDDYnQvddf4UsFjUF
tjDIil55Ki9CEx3C0shlIpE+wRXIe1YJIAss6/odmzzHALeJiVr9RzJCifRZu2Xr
7iT2LyyGymLqyFKG/yk4XfHzvXFDPjZozHUMLVz6yTUhvoBraY0u9Tt6kNpuJds4
u0aCdhOkfxGGPPiiWQXQJ1DNhJymEFdhJNcPSos2nQIfamf5/vb9Ze/91gyY2U7w
NoCTIIKliwA8hY3vDQ6S4pUXvKnAh0/a1oVnKITHtRURsnjOQL/8U7Yiuuu3wCEj
IdQYEcMn0Ztf9o/UigzS+PC+dViByc207wFwVtTun1RyEmvBVOTl/imWkNMvIqA/
G73Tfy5EhCPdLY/ybeZysEyFqlk/j7IYst0COqnUqkCiw46rHl3kx4qaS/F8EMmr
pHfAi2YJHEOD5PSrXPYxNUyUtOvxEdH7tawOtcp9k0ObM6u3RYBfV8BRLZrdm+Jc
YrLdkrwtuwwZ5aoUOboo44j4PPxdH29roL1/FFMUJEFIWeJ5LFri54ix/eYhPu5c
d4Gzdy4vUgPicjYadd4RT4R8OzPGycffgtIM7+dOcdDMkBzE2fA=
=HgUE
-----END PGP SIGNATURE-----

--T6uFHJ7ROrSUajMXLX1GY4KU4IHRm5EFb--

