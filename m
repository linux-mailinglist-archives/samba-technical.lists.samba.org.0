Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8542143A4
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 04:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=k1pkqV4ji9PkM1H8R5Xaq/j3HoSGX+EgJdiLTtnYNk8=; b=qgNAZo6c0P5CJixH8ukioyr9zA
	8Z0DFJaooGG5FxzpGluvuiZWRxfh5rfrPlBqLjNjMTeb+4kmEKalHNbAitj3wA34MI7poQUfriAt6
	tpWiUU9cd0eZQt+cBsNrhtmAUP/IdVIhR6Mp8gtJ14PAGyJTLF4mNEfPilq/ciZqCgrrZ5LnzUw9W
	6PsfseyWSJrX3t09llryYMH7QDCXhAHRtJX7xrCm0BCNamMaoKSK2EHpekB4g98Go9kprG79NaET8
	lBFX+ktVm67e53C5RmFNFv8s1NsIDUiMa4NtWm7Yv2E9tUROb4sddIdJKIJyw21SNL3iX1VCjCiU2
	ZqXbbRYQ==;
Received: from localhost ([::1]:53632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNTjV-002VaT-N5; Mon, 06 May 2019 02:52:01 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:54450) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNTjO-002VaM-ES
 for samba-technical@lists.samba.org; Mon, 06 May 2019 02:51:59 +0000
Received: from [IPv6:2404:130:0:1000:cd33:6df5:c1f3:8bac] (unknown
 [IPv6:2404:130:0:1000:cd33:6df5:c1f3:8bac])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id E1FCB81026
 for <samba-technical@lists.samba.org>; Mon,  6 May 2019 14:51:41 +1200 (NZST)
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] Make samba build with address sanitizer configured.
Openpgp: preference=signencrypt
Message-ID: <44426b35-96b1-49db-49d9-943648e0f271@catalyst.net.nz>
Date: Mon, 6 May 2019 14:51:34 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="dMuwPNKJ5SvsvUwNuWjkWuOXS1w58vOVy"
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dMuwPNKJ5SvsvUwNuWjkWuOXS1w58vOVy
Content-Type: multipart/mixed; boundary="sKRbjoPULbRqOZxmDR7CgJD0OvxdqFP4T";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <44426b35-96b1-49db-49d9-943648e0f271@catalyst.net.nz>
Subject: [PATCH] Make samba build with address sanitizer configured.

--sKRbjoPULbRqOZxmDR7CgJD0OvxdqFP4T
Content-Type: multipart/mixed;
 boundary="------------C041DF612584F9D9DD79812C"
Content-Language: en-NZ

This is a multi-part message in MIME format.
--------------C041DF612584F9D9DD79812C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Two patches that allow "make" and "make test" to run when Address
Sanitizer is configured.

CI: https://gitlab.com/samba-team/devel/samba/pipelines/59874413
MR: https://gitlab.com/samba-team/samba/merge_requests/419

Review appreciated

Ng=C4=81 mihi
Gary

--------------C041DF612584F9D9DD79812C
Content-Type: text/plain; charset=UTF-8;
 name="419.patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="419.patch.txt"

RnJvbSBmZjMxNzNkZTNhN2Q3YTM0NmY0YWM1NzU2NDQyYjcwZDA3Zjk1YTY0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHYXJ5IExvY2t5ZXIgPGdhcnlAY2F0YWx5c3QubmV0
Lm56PgpEYXRlOiBNb24sIDYgTWF5IDIwMTkgMTM6MTI6MzMgKzEyMDAKU3ViamVjdDogW1BB
VENIIDEvMl0gczQgaGVpbWRhbF9idWlsZDogZGlzYWJsZSBsZWFrIGNoZWNrcyBmb3IgYXNu
MSBjb21waWxlcgoKRGlzYWJsZSBBZGRyZXNzIFNhbml0aXplciBsZWFrIGNoZWNraW5nIGZv
ciB0aGUgaGVpbWRhbCBhc24xIGNvbXBpbGVyLCB0aGlzCmFsbG93cyBhIHNhbWJhIGJ1aWxk
IHdpdGggQWRkcmVzcyBTYW5pdGl6ZXIgZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IEdhcnkg
TG9ja3llciA8Z2FyeUBjYXRhbHlzdC5uZXQubno+Ci0tLQogc291cmNlNC9oZWltZGFsX2J1
aWxkL3dzY3JpcHRfYnVpbGQgfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zb3VyY2U0L2hl
aW1kYWxfYnVpbGQvd3NjcmlwdF9idWlsZCBiL3NvdXJjZTQvaGVpbWRhbF9idWlsZC93c2Ny
aXB0X2J1aWxkCmluZGV4IDg3MWRiNmIzN2ZiLi5iZWRjMTMwZTA3YSAxMDA2NDQKLS0tIGEv
c291cmNlNC9oZWltZGFsX2J1aWxkL3dzY3JpcHRfYnVpbGQKKysrIGIvc291cmNlNC9oZWlt
ZGFsX2J1aWxkL3dzY3JpcHRfYnVpbGQKQEAgLTQsNiArNCw3IEBAIGltcG9ydCBvcwogZnJv
bSB3YWZsaWIgaW1wb3J0IENvbnRleHQKIGZyb20gc2FtYmFfdXRpbHMgaW1wb3J0IFNFVF9U
QVJHRVRfVFlQRQogZnJvbSBzYW1iYV9hdXRvY29uZiBpbXBvcnQgQ1VSUkVOVF9DRkxBR1MK
K2Zyb20gc2FtYmFfdXRpbHMgaW1wb3J0IExPQURfRU5WSVJPTk1FTlQKIAogZGVmIHRvX2xp
c3Qoc3RyKToKICAgICAnJydTcGxpdCBhIGxpc3QsIHByZXNlcnZpbmcgcXVvdGVkIHN0cmlu
Z3MgYW5kIGV4aXN0aW5nIGxpc3RzJycnCkBAIC01Nyw3ICs1OCwxNSBAQCBkZWYgSEVJTURB
TF9BU04xKG5hbWUsIHNvdXJjZSwKICAgICAjIHNvdXJjZSBmaWxlLiBOb3RlIHRoYXQgaW4g
dGhlIGNhc2Ugb2YgYSBvcHRpb25fZmlsZSwgd2UgaGF2ZSBtb3JlIHRoYW4KICAgICAjIG9u
ZSBzb3VyY2UgZmlsZQogICAgIGNkX3J1bGUgPSAnY2QgIiR7VEdUWzBdLnBhcmVudC5hYnNw
YXRoKGVudil9IicKLSAgICBhc24xX3J1bGUgPSBjZF9ydWxlICsgJyAmJiAiJHtBU04xX0NP
TVBJTEV9IiAke09QVElPTl9GSUxFfSAke0FTTjFPUFRJT05TfSAtLW9uZS1jb2RlLWZpbGUg
IiR7U1JDWzBdLmFic3BhdGgoZW52KX0iICR7QVNOMU5BTUV9JworICAgIGVudiA9IExPQURf
RU5WSVJPTk1FTlQoKQorICAgIGlmIGVudi5BRERSRVNTX1NBTklUSVpFUjoKKyAgICAgICAg
IyBJZiBhZGRyZXNzIHNhbml0aXplciBpcyBlbmFibGVkLCB3ZSBuZWVkIHRvIHN1cHByZXNz
IGxlYWsgY2hlY2tpbmcKKyAgICAgICAgIyBpbiB0aGUgYXNuMSB0b29sLgorICAgICAgICBu
b19sZWFrX2NoZWNrID0gIiAmJiBleHBvcnQgQVNBTl9PUFRJT05TPWRldGVjdF9sZWFrcz0w
IgorICAgIGVsc2U6CisgICAgICAgIG5vX2xlYWtfY2hlY2sgPSAiIgorCisgICAgYXNuMV9y
dWxlID0gY2RfcnVsZSArIG5vX2xlYWtfY2hlY2sgKyAnICYmICIke0FTTjFfQ09NUElMRX0i
ICR7T1BUSU9OX0ZJTEV9ICR7QVNOMU9QVElPTlN9IC0tb25lLWNvZGUtZmlsZSAiJHtTUkNb
MF0uYWJzcGF0aChlbnYpfSIgJHtBU04xTkFNRX0nCiAKICAgICBzb3VyY2UgPSB0b19saXN0
KHNvdXJjZSkKIAotLSAKMi4xOC4xCgoKRnJvbSBlOGMzYmIxMDBjNGQxMGJlNDUzNjgwYjYz
ZDMwMTU0YzdjOTI2ODFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHYXJ5IExv
Y2t5ZXIgPGdhcnlAY2F0YWx5c3QubmV0Lm56PgpEYXRlOiBNb24sIDYgTWF5IDIwMTkgMTM6
MTQ6MzcgKzEyMDAKU3ViamVjdDogW1BBVENIIDIvMl0gc2VsZnRlc3Q6IFV0aWxzLmNtZF9v
dXRwdXQgcmV0dXJucyBieXRlIHN0cmluZwoKQ29udmVydCB0aGUgcmV0dXJuZWQgYnl0ZSBz
dHJpbmcgaW50byBhIHN0cmluZy4KClNpZ25lZC1vZmYtYnk6IEdhcnkgTG9ja3llciA8Z2Fy
eUBjYXRhbHlzdC5uZXQubno+Ci0tLQogc2VsZnRlc3Qvd3NjcmlwdCB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvc2VsZnRlc3Qvd3Njcmlw
dCBiL3NlbGZ0ZXN0L3dzY3JpcHQKaW5kZXggMmZkMzhlMjBhNGEuLjQ0NDU1NDgwZWIxIDEw
MDY0NAotLS0gYS9zZWxmdGVzdC93c2NyaXB0CisrKyBiL3NlbGZ0ZXN0L3dzY3JpcHQKQEAg
LTI3Niw2ICsyNzYsNyBAQCBkZWYgY21kX3Rlc3Rvbmx5KG9wdCk6CiAgICAgICAgICMgV2Ug
dHJ5IHRvIGZpbmQgdGhlIGNvcnJlY3QgbGliYXNhbiBhdXRvbWF0aWNhbGx5CiAgICAgICAg
IGxpYmFzYW4gPSBVdGlscy5jbWRfb3V0cHV0KCdsZGQgYmluL3RleHBlY3QgfCBncmVwIGxp
YmFzYW58IGN1dCAtZiAzIC1kIFwgJywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2lsZW50PVRydWUpLnN0cmlwKCkKKyAgICAgICAgbGliYXNhbiA9IGxpYmFzYW4u
ZGVjb2RlKCd1dGY4JykKIAogICAgICAgICAjIEhhdmUgdGhlIHNlbGZ0ZXN0LnBsIExEX1BS
RUxPQUQgbGliYXNhbiBpbiB0aGUgcmlnaHQgc3BvdAogICAgICAgICBlbnYuT1BUSU9OUyAr
PSAiIC0tYXNhbl9zb19wYXRoPSIgKyBsaWJhc2FuCi0tIAoyLjE4LjEKCg==
--------------C041DF612584F9D9DD79812C--

--sKRbjoPULbRqOZxmDR7CgJD0OvxdqFP4T--

--dMuwPNKJ5SvsvUwNuWjkWuOXS1w58vOVy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAlzPoTYACgkQei/9ZKIy
R1N+gAgAk43gZ+5ikur4bwwf3O4pfq6JQj+PMN+a3D1ntTuT5dZTkj67MlQp2tZA
cYJQomH0ZOGqc7d8IlFaZzD/2zLubiJukAW2jwuLuU1zI1gHkDvbkRAWxkYLyeVb
Y0wEdoQcGMRyXuE0tCb99bBWCuGaOTBawTATbhirlvZlLJeleLvEBb3nh9Wyvusu
CMGMP8EVk6M4cAjGnPnpgtNLl9SemApTJiip3YP/hhk5BopgxDjg6xzj78WuGdio
aDtCe3sxJOTyeDxw4395VOHQzQYbPGcvuBfDAoPFgd+fM3MplFHnIhA/2Eu34xOX
rdwXTBCzZCiWiadjm0bri4/iAMbv9g==
=F7Pw
-----END PGP SIGNATURE-----

--dMuwPNKJ5SvsvUwNuWjkWuOXS1w58vOVy--

