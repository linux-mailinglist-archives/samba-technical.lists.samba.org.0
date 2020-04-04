Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0301919E5F0
	for <lists+samba-technical@lfdr.de>; Sat,  4 Apr 2020 16:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=kv9YjvCHehnGDJZzNiM24DSjfxVaUF/fGBJJSqGIUc0=; b=E2whWmf8v0DkyxbFeF/kAD46yn
	eK7NM16m+6h8onj2rVfpvrpC9ZIZa4X6ioo9INLWms+17OEhSf8EKe6mysXRD8drOow9yaiz9DNgr
	fFQfTuSkb1P0evogqH4Sl1+gr2+FUU8zI6d16w/0ESykZ1GjCCPCaLlsER/72I0t/eQ4HF3koocnD
	I8cAdymrLEQijAUNol73Wdyky2VIc87U2P+dRucDpxsrb8/qmQKkjUvWDnbkUDikNvXTVncDUT2gA
	5E2ArDbPLMKiiAZDWdztyQ+qLgJNcLrc8z9IKhIjfLK/Fagfl3Rhs1ey9gC9slNJzoU7PRNR1Y5KS
	R599ER9g==;
Received: from localhost ([::1]:37250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKkCP-003JDT-OG; Sat, 04 Apr 2020 14:55:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKkCE-003JDJ-H2
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 14:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=kv9YjvCHehnGDJZzNiM24DSjfxVaUF/fGBJJSqGIUc0=; b=pT1uRYNrMz0cWAeb0dQkA69aC6
 Qd1+pTFCrBO5TcC14j/eJQZg9ghie+aVwW2Hn7eq1giwA/IM1fM0Rh7mx9xyzxrzEiw5fV3bhptRn
 IJuTSbos/HuJfFThXHSI7d5dL9xPaJwlWsvcbJ3LuD4DhJQs18fq2pVcTIJuucnVdG0ularWQgtLM
 Dv8YkE9SNmHQq2MOeL2SaZnYT/gknBIOeQa1ZNQwx6ivLckWWzULSa+0YgomZMXGCIPNZbalJJz9j
 A63NnSe0K+iLccEF0qLOw1YCxjgOAGyG9k1FbHr6iCz4WcUgMF+A6zW+w39+71fWt13IsihZGEWi1
 mMw2vj/bmnk0I0/9PssjuR23IVzrJDG1/+RFQca4SgCy71vF15U6K4ZmU/eUFKCAtp7WQtjMJ4R7Y
 AZrMo9gqhmaQyYI92wDhH6JhpSb4jooIQ6Fqp+u01OW+1iMyGdBNwF4g2IIKO6BA8gWEtVV9OBw4g
 CUhxD72HdYvkyaZcrDwb8yNW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKkCA-0003KR-Ky; Sat, 04 Apr 2020 14:54:50 +0000
Subject: Re: selftest/flapping: mark samba3.nbt.dgram.netlogon.* as flapping
To: Noel Power <nopower@suse.com>, samba-technical@lists.samba.org,
 Noel Power <noel.power@suse.com>
References: <20200404011303.EF6081400BD@sn.samba.org>
 <7206459d8324b34757339d9d858266c9cbf47303.camel@samba.org>
 <96732fcc-6632-f93d-c075-bec077475165@suse.com>
Message-ID: <abafcbc0-a433-12b1-58d4-011e934b42c3@samba.org>
Date: Sat, 4 Apr 2020 16:54:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <96732fcc-6632-f93d-c075-bec077475165@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pxJiLWX3up8VUPP2dbcCrvypbWCLdnx2N"
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
--pxJiLWX3up8VUPP2dbcCrvypbWCLdnx2N
Content-Type: multipart/mixed; boundary="aO1UTkh0F2Nw83NKSzHxWpIPWsbGEtj0t"

--aO1UTkh0F2Nw83NKSzHxWpIPWsbGEtj0t
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 4/4/20 um 2:35 PM schrieb Noel Power via samba-technical:
> interesting, I didn't know that, must say don't recall this one in CI
> but post these changes this test started flapping more frequently on
> gitlab CI on the merge branch. But it took 3 attempts I think to get
> this patchset through on autobuild (all failing on this test) strangely=

> it seems it on the samba-ad-dc-1-mitkrb5 job that it fails in (can't
> recall seeing it fail on the normal samba-ad-dc either on gitlab or
> sn-devel)

fwiw, it was flapping on ad-dc as well quite often in the branch CIs.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--aO1UTkh0F2Nw83NKSzHxWpIPWsbGEtj0t--

--pxJiLWX3up8VUPP2dbcCrvypbWCLdnx2N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl6In7kACgkQqh6bcSY5
nkbBbA/+MF9OD63shDAWdGrmkG/pAsinvx/AuH52ZjdPz+Jg6wu055KWTayv9lbZ
R3yQaPjQbg4n1opKxY1Yl+Dw2PRLFyAnPxH4sTQGYXI7uGbBtG4DSAmkMF7gG/Bk
3muBUd5ZXjqJErzdd/7y+9XCjwYPdWE9GOxMqxTUpKyPx0svfAFFp98qcezRHoNq
vIBlfeYCwONWO80SHbKAkmXjR5GBm5GD6XpnaPU76BX/tefsuRylzYFCJusxAnD3
6nzdCuTgNMgvOwVJ1LZNFqg6BYri1jgMhyYyZGxYRJ1sqCIO94xHLVmcjp/f3fhW
Lh735ufiwPMoulSrkKwLloFd8KvfipxCvnIUKNqZlnhQeh0WhxqUhr15ArcGBSwF
oxVpnHnUrvUFLuLTWdeHDriHkJqAnOR8KhVDcrSE8amZRZZlFW3L1fhVciq0p+i/
bdKiWd9jnRdhnOzLYbWuPcoIxujWgrQcuNBA/2ykWoc91/kHTfb1CSW5gBIFAtr2
fCm7laEiUHt0fRRDROU+UUuIizgepv9c5POD7Wlvy475Bva8E9e8FHFnkWGyq3fZ
hrZcYAWDWZg6CXPwb9jxhOkSUmGNKFu8tz0H2xwB7YkxBlUl/guEtHTGItz8HOiJ
2V+DqYE8VZDTymh9Wndu2DSQ4ThLfjLYGr/DSVcBR8BA/aBHS4A=
=PKF9
-----END PGP SIGNATURE-----

--pxJiLWX3up8VUPP2dbcCrvypbWCLdnx2N--

