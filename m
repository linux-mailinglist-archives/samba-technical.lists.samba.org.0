Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AFE24B74
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 11:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mi/bdQ8g85cYASAlzbi7rIe8HH9uycx2TKvK1spPgOE=; b=5xNcxx8UTIaexZBhxwTS4g+R8u
	MgElIEui9NcWmjWgXwmChVV2J6YQ/dSzmZTA37xUqg7WqyNnUKCgpaeIb/ST8b/MGSK7Nol2ee8I4
	NtOGFhDj1UvjMheYm90ITvIkMhDT2SsOD0MwtKoW41K0d/cMkN952H1LrnSvdNceqlfVUNCBP+qXm
	yUAP/4+kW2NVIl6/GmzyvY9fzmweh3Hw5kLQlzFGk92dwbp3VY5DeY8/TYO/CwOOatH1II08kloLg
	F6lSkuQTfUEYdHCVJrEjyG/8GYe8thxmUQ2kjYnGfF/ULIa0N5e0VHq7SjsJVRu0BT178HB5xoktp
	6+8EHX9g==;
Received: from localhost ([::1]:37950 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hT12a-000vbP-Js; Tue, 21 May 2019 09:26:36 +0000
Received: from [2a01:4f8:192:486::147:1] (port=18570 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hT12W-000vbI-5P
 for samba-technical@lists.samba.org; Tue, 21 May 2019 09:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=mi/bdQ8g85cYASAlzbi7rIe8HH9uycx2TKvK1spPgOE=; b=Yf41Vepp4WvD8NUklgOYMrdqtq
 xEEtWV3UbQA/8bnWFmV88sXptG80Ot19Grzz40D03MWjzML40FM0mQDd7NJKYsQA50xcVOO/79BJA
 X4Ill7Vl97aC3UmCB2Zkk2Wbvvqx00Kh/AOp72gE/rdCbeQHHi3WXrudAIHReLVcQQIM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hT12N-0001Z5-GY; Tue, 21 May 2019 09:26:23 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 Garming Sam <garming@catalyst.net.nz>,
 Aaron Haslett <aaronhaslett@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
 <01caab91-5ec4-392a-0227-c4782db5959e@catalyst.net.nz>
 <1557898030.25245.8.camel@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [WIP] [PATCH] ldb: new on-disk pack format
Message-ID: <6a709953-cfd9-c5fa-8b65-05e56c0f49b0@samba.org>
Date: Tue, 21 May 2019 11:26:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557898030.25245.8.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="D3skFUiYnAV0rdZaCjYHJCBGvXSyCXapN"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D3skFUiYnAV0rdZaCjYHJCBGvXSyCXapN
Content-Type: multipart/mixed; boundary="FgYj60rWYaFMSeSLZ9JjEzgY1RknZ0kwS";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Garming Sam <garming@catalyst.net.nz>,
 Aaron Haslett <aaronhaslett@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Message-ID: <6a709953-cfd9-c5fa-8b65-05e56c0f49b0@samba.org>
Subject: Re: [WIP] [PATCH] ldb: new on-disk pack format
References: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
 <01caab91-5ec4-392a-0227-c4782db5959e@catalyst.net.nz>
 <1557898030.25245.8.camel@samba.org>
In-Reply-To: <1557898030.25245.8.camel@samba.org>

--FgYj60rWYaFMSeSLZ9JjEzgY1RknZ0kwS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> At this stage we are thinking to have GUID indexed databases use the
> new pack format, with an upgrade on first use, exclusively.  This will
> avoid changes to non-Samba LDB users while keeping the test matrix
> compact.

How can we make sure it's possible to downgrade to 4.10 (all versions
with GUID index) once ldb tools for the new format upgraded it?

metze


--FgYj60rWYaFMSeSLZ9JjEzgY1RknZ0kwS--

--D3skFUiYnAV0rdZaCjYHJCBGvXSyCXapN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlzjxDgACgkQDbX1YShp
vVblfRAAhJ6ecnqtGE+h4g83RtJatoZk5dtqolInx0y8amBmFVuOwLBl+6PW+Y2/
nyGz/HaWxZMu2mUA/Q//yYgfLjRlAfqDhjE0S5oIIBgNlm+P0nKoTXxFMHlXT9eU
04tWI4kTYtjk+MtsTbfjowHFrWP3KaI9tztKVRI5voS6os5RYhIl0wbr/m5h04TH
aWbyhUd65K4pXubvsMdremmns+C5oYkBGoC50wvns4zSadAYZTpXDN6sqaZv6abZ
aUBy4P/Y0v98GTAXd1n65yiBXITzRJX0RunBnDq0k5mEGpkTlD6bY+W4v6K8N8Qc
4Z/Dhu44sPXMJKlWqMSI4liueAYnapxT1nCUToQNvjbtLRJQCOYIzhSVVqVcxQKq
YtLkq33GUt0SVYYPVOgesvUW46yAwgT3l4BRyJ2r3IUfcD6VHzykT5lAWMGWsxVd
wwsBsOrcG6Vtk6jELLT/y5rBlcfIQKlBeoVZTamoO1d1cKt3TVFR2jyzVGvmCvze
fidxTTnY/aW+45KxLfwnVKrDU2iBLSFbxpNJ8q1TH9QdOI9NF6E/FqSZn1xiRyCt
ID22RPnGnC1PUaV57lR6iPNTOttceTepWF+VFu17NaSQg+tlO89/OtYsK2LWufR0
t2TPu8hGPkH8aak/e0hxahL+kztv9cJs/EeQMQL9rsr+S1xeAGQ=
=Di+n
-----END PGP SIGNATURE-----

--D3skFUiYnAV0rdZaCjYHJCBGvXSyCXapN--

