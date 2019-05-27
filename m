Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8962B0D2
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 10:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uZbCx4BtgYeVDMa8wUXrZxp5cTktxPKFRIJ++9ZuzM4=; b=pyKtf/xtqUzvO2wcTsRLtVOvPY
	wSDhxYv3LqdvDmzqh35KMDYim7oV8ih7VsOVw8SrgtQKa+GbreJIokjvv9nED7CfhMVBUF83PXRd3
	GPKhRYB4U85v25+s3mA1GucKWXfTIZn4N9DCbpei13uK0L+Eixw/DnU4et3vmiivEhj2TQfqh/QR4
	qegxo71bsVtsJAx6yW7WCnjrwscnCErem9w6cM7QpFLgFLv4upo3Wn+Cseft/XEpVRCMOUTNYkzWg
	GlaF7cnCQrkNZnd1dI1I8GqbGCxaXFWsPEbBsB7Rnpne91+saWk36EOBJU4eD04TT8Hh9cywF8+jT
	puw9tVjA==;
Received: from localhost ([::1]:53054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVBTe-0029Ih-KB; Mon, 27 May 2019 08:59:30 +0000
Received: from [2a01:4f8:192:486::147:1] (port=25806 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVBTa-0029HW-Ku
 for samba-technical@lists.samba.org; Mon, 27 May 2019 08:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=uZbCx4BtgYeVDMa8wUXrZxp5cTktxPKFRIJ++9ZuzM4=; b=Xzh3NwT3heUG6dtV8tAM3cd9pw
 HcrVA37pTUi5uDHmk2P0z3b3xYdoqtH3K6N30pQzhWJOJUIxJLAeHvrSkrn6Mp2jsmQSG714K7Rr2
 +FvawwEEd3fEWo6WtMJC6F7JoKjSx9YMkKqOGD69cIYm9lPY89rkbVozMUjNagH1BudE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVBTV-0004ks-B1
 for samba-technical@lists.samba.org; Mon, 27 May 2019 08:59:21 +0000
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
To: samba-technical@lists.samba.org
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
Message-ID: <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
Date: Mon, 27 May 2019 10:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
Content-Type: multipart/mixed; boundary="------------1C5E1EFD608AB65B6064A3FA"
Content-Language: en-US
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

This is a multi-part message in MIME format.
--------------1C5E1EFD608AB65B6064A3FA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Amit,

thanks for the patch.

Looks like it doesn't apply to master. Can you please also submit it as
a git format-patch patch instead of a diff?

Thanks!
-slow

--------------1C5E1EFD608AB65B6064A3FA
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFzgBK0BCADMj5sZpYD3LrcDnDxTUTpzS4Fpnba5QUUtmmT8muJQZhu9ARqQ
lKHnRnYMvGIfN/6Ju3l9FUG7uAbwiY0+4g8wgkc7cqLhla/m5ilR0RSj/4NBlYrc
SViPqHtye7U43tSBWKeisK/aSaChtxe11GU7piWCc7iZS0Pdh5nk6Bjgtyu13y0+
d1QxcWBUTYa1kVQTGcWjBGlAsD20x/pojhA98mgzR7IQ4D/opWvsT3PkqKfrXbIA
BxJlNLI9oBdQ9kPXatbDWzpgFV6lbb0LenjuAFmnhJa5RkIsQBOo1H8igfFGC/EY
xa/83xTYhB9kAb8bZ/OQXKYWLwgh31SuawY3ABEBAAG0HVJhbHBoIEJvZWhtZSA8
c2xvd0BzYW1iYS5vcmc+iQFUBBMBCAA+FiEE94NHVYAePaUwrPPQZC0vYQ+8I1QF
AlzgBK4CGwMFCQHhM4AFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQZC0vYQ+8
I1QQnQgAokhbUXheexlL3ZZOrMQhYh0mCL7AAlPWt96dEoJImBNUsvGFh04hmU/x
PghTnqO3879YPAxGjWtCnDnNsxLRbl6wasMqKpMzJuFieTMsY0670Ce04UW7R1Jg
Ae43o4nWVwtqug3j4rOG1Wk51mtxxrKjTnbIcKN3B4mU4vuWXVfiBm1iX3ISlRAz
VRRcEhxVCq7whLaBh/AK+cpkVK/fEjvUr1MXT0BqtGowDRRiy4IbCww19b7soHJI
fvfZvIicxlrERHKzfpTe3pNUSEsJJZBq7QfshnQluOrHDbwoUd2UXmU5qMLaDrdD
E9bA4tSsfSh48Nu2wHGAgu6nkIP5yrkBDQRc4ASuAQgAtpj76xoodLJ3VZAjSruR
Cxg3AZACD7LRZ6ioz2qJtJmiHyKhbr3RHrfah2mCcISNZydxiRv9sn7oxt2a6lgn
CZJNevc815G3nU8dn+dY/zgZiQCtk/vllX8Uvkta4/dkGNJXXk+czj7PXSGH9KcD
i+3m6RpivOgc/nqKPuuej+iFII+SN71opgDAuLdJNNrD4zdh33qEZPqdVxsbSTGW
Oc501Mm6MKwuYJwwWbxM1hK7d6dFC521QAv6//tm0medMd8mA7+4bZFV8gDMZg++
vGxT/f6B0bYu/cacv6rN4J+PHfn5hXkv757wJbWISN8rUowsGCerAVKjSMEiXqN+
pwARAQABiQE8BBgBCAAmFiEE94NHVYAePaUwrPPQZC0vYQ+8I1QFAlzgBK4CGwwF
CQHhM4AACgkQZC0vYQ+8I1R9bwgAhQnf/Z4cd3CmE/j0+Vcnrcy+cAcMlnqnjRAt
mooh/1MR15ml2mPp7/SSPYp3ZJ0VCaKRkEwcchSRAFrEacLt1cTTbtZs1oubReLU
QclqKatK4QWyLTB/MlcY9+P8zDedDxoG5YNVXNbEPGzd9TdadT1YGlCCVjOc3nuX
IITkv/X+Yk12ZFJ9JvMQM96vuBgBlCX/dr0cxSA0oqKC8UplMsXfkQJ7QYLB+JW2
D40ukeoKKarpF1/ys0gSP7Qi9jk4We8KkSzfv9NGfH56THbtA2FydOXNIgn+jYP5
gFKuxrEsr79mTlVwszKjC8DG+7jBz+1Y/mM+0kEJcBaz5KEgvg=3D=3D
=3DUz8n
-----END PGP PUBLIC KEY BLOCK-----

--------------1C5E1EFD608AB65B6064A3FA--

