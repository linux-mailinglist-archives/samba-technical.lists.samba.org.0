Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E09235DBE0
	for <lists+samba-technical@lfdr.de>; Tue, 13 Apr 2021 11:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bG52PCcnc7NDyFS1/J9MWZRFwPTCmQ44DZCUGMPZACg=; b=o9XM5QkCsgrDZZiMltRgmP3oCU
	nm6mlQsu7vwUfe1BF+CtUji5vIY6FNd9fWyWbnXtBjpyPzgmv+Htzo9Qymz7tBWscak2hacMh9PQ1
	St3R1EscQFpqO3dorz0r6uLuXtsDn4p+6grTqlGjwaa4HWXyeaaCgbO6v/H4U6yr3snoe6nIuDwk3
	CiNbV73qIC+0RudOFVYNxXVHRkl0O+UoiGjTZmLAgYzMRaRrBAonX+UfvNA2uocrwpXysZJIjKVug
	uGiKbn24jsIile+RHnLTlzCoL+umoJ3z0bCVeKb8vMSESInrEbvKL0F+7KrdG5fRy60BgsQFXs969
	PkYZ8FlA==;
Received: from ip6-localhost ([::1]:18082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWFia-00B5t8-Ef; Tue, 13 Apr 2021 09:52:24 +0000
Received: from rp02.intra2net.com ([62.75.181.28]:32916) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lWFiV-00B5t0-JK
 for samba-technical@lists.samba.org; Tue, 13 Apr 2021 09:52:21 +0000
Received: from mail.m.i2n (unknown [172.17.128.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by rp02.intra2net.com (Postfix) with ESMTPS id 325621000D9
 for <samba-technical@lists.samba.org>; Tue, 13 Apr 2021 11:34:46 +0200 (CEST)
Received: from localhost (mail.m.i2n [127.0.0.1])
 by localhost (Postfix) with ESMTP id 09C7E969
 for <samba-technical@lists.samba.org>; Tue, 13 Apr 2021 11:34:46 +0200 (CEST)
Received: from crust.home.phg (unknown [172.17.68.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: smtp-auth-user)
 by mail.m.i2n (Postfix) with ESMTPSA id 4C6D48C4;
 Tue, 13 Apr 2021 11:34:44 +0200 (CEST)
Date: Tue, 13 Apr 2021 11:34:43 +0200
To: samba-technical@lists.samba.org
Subject: CI failure on account of C99
Message-ID: <YHVls6bU63Xhd32H@crust.home.phg>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2rHnYBK7FxMdKtDy"
Content-Disposition: inline
X-Sent-From-My: toaster
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
From: Philipp Gesang via samba-technical <samba-technical@lists.samba.org>
Reply-To: Philipp Gesang <philipp.gesang@intra2net.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--2rHnYBK7FxMdKtDy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I=E2=80=99m preparing a patch for submission which seems to be fine CI
wise except for the centos7-samba-o3 target which errors out [0]
with

    =3D=3D> /builds/phgsng/samba/samba-o3.stderr <=3D=3D
    ../../lib/util/tests/time.c: In function =E2=80=98test_normalize_timesp=
ec=E2=80=99:
    ../../lib/util/tests/time.c:119:2: error: =E2=80=98for=E2=80=99 loop in=
itial declarations are only allowed in C99 mode
      for (int i =3D 0; i < sizeof(data) / sizeof(data[0]); ++i) {
      ^
    ../../lib/util/tests/time.c:119:2: note: use option -std=3Dc99 or -std=
=3Dgnu99 to compile your code

AFAICS there=E2=80=99s numerous C99 constructs all over the source and
README.Coding explicitly mentions it. Is there a special
precaution that must be taken for this test target to work?

[0] https://gitlab.com/phgsng/samba/-/jobs/1174823996

Best regards,
Philipp

--2rHnYBK7FxMdKtDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEnZTDO4wmd424wPWRCSLGx8z5U5wFAmB1ZbIACgkQCSLGx8z5
U5y8qRAAvG5BX0LyxrjrYvsbRmrxtg1FFTW7upqaVpGXiR149IMSEovug8+S9z+p
Spp/TUl35mwZcwUgRIWC4Jm1AEDRJfKoUfi9kRi5lbfylBW2icChw2HrH9erMA85
6pgdepH8/6ERr6sDqOg0n0McfkKHkpansKbfXKCJkBOcbLE8PSLP02fabF5E1xL7
2d2uh0wb7pUow720Q3n8f5uRwT8Nu3wdg8Ru/uAmSZzSDQb4FIVIlyCZJNW8FbuL
aYt51Qi3rwSbBy39PNDGZ4aJEKMjcUYlqisBDPmpMFSsWL1L1D9Pb5svMSp4ivb/
ytDKWvMIQddDoBfCxbZfdhOVW2kuBiWK+PpFNBaRm/V5fqekyMFRDJRcfhaJKI2q
0ZIkE2W1iOObEDcCobuPjYwg64mrP02bx5MD8667qvoQMLZLwymKW24JIioKRBRw
Nzv5E/TU6mTq+ln+Vk7Bhc2KzOidvPa6351df76O9va2/fTbJZ3iaQ6oA5NvTroJ
A5D1TdP8GmNs1srjhnuXuGrkrgA87GCVqEHsPgaZDsndDpTEnltSSGSWPLT4spzg
lt5ahSN9C3edk/RQ4XwZnvHHkjpYw6YW5Sh2HT3wy+fjIuEPhWYlfI0mUeMaigt9
QUX10KZEIP9RoSLfY+cN6NeLxoFzMb+hFQvcZ+1jEIX0SuVrsLg=
=iaew
-----END PGP SIGNATURE-----

--2rHnYBK7FxMdKtDy--

