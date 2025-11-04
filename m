Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF80C3054A
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 10:46:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=KAEya8zcnbW3cZkPzGhfVC/wrLHEvm8DWTh0Vs2+5FI=; b=pxk1BvpBE+iqMwUBj4WHddpsM7
	6GCGtbDXV4Shi59WTJZZMCf5GB+9TT3ArCOI6dablUcmp+ZGKOuxg3p1NnK35rNmBl3qDScs1WS9V
	oGw4X+6v/Mdju+hxIC/nx4xhfpoHaDGT3ClYsynPy49S1sbqrJTbBED7zchSm98cG+PYsN0tA2N1b
	a1K9tgxKxHcae12AQCGFG/jaFQs0emtlsiAD2mBykujxXTYF/fnaLKNGclFTOZkhfTHD+87JubGtT
	ArE4DVT/3ci/eKGzz7SaUe/AXJ5Pibf3PbRPYsChhmkW8u8bqRdInQAQ15DsFwh0//Wlvp2CXo63P
	8N9GcDUQ==;
Received: from ip6-localhost ([::1]:46362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGDcr-00BRYK-WB; Tue, 04 Nov 2025 09:46:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24208) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGDcn-00BRYD-CM
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 09:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=KAEya8zcnbW3cZkPzGhfVC/wrLHEvm8DWTh0Vs2+5FI=; b=Klr6U97aSZAYYc/KxBAr3gmXJk
 TTRON7SD/ArxdXogM8BsECvUu0hESeu4A737TDFbfg2fLPDMaZ92OW+AkGQNyxjks9psbuchWOGeq
 0nfaE24BUpXKCcdM2OY+7KenAffnp48W7nHcvls2LtsGd8BfcLFQgdYN/Wu/D+IQYp02odSePMYzE
 UpO7h87tNvwAlkqMHOwZDxa6YrIbG6HfwYT9Ovrm50u6rtLJzubbD6n5fI+JPR/hYiduVI5FLPlFA
 UpqhsADcEPcF/HcEHGAJ6caXHkdSjHYM4Q3Mkw3Wbu3We+RwZsSXVRq4EIgidTEkIwtvbpRv675IP
 YMDEnZ2U2+wcNAbsjX4W/wcwoFWSgUUumITO0Asgi2/F87okNeHDfH1h1sXnL0sxckCLchqkh1sEc
 Yc3QbOlx4b9expf8CzbnKCZYsKJpsrQ3NUH5vIjP9KgwlWYnD/ydqxnYQF5vu+t6/1nmtnhXh+UK6
 UXa0g27GCN2iU50l8vAqsHnv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGDcm-00CVIb-2v for samba-technical@lists.samba.org;
 Tue, 04 Nov 2025 09:46:48 +0000
To: samba-technical@lists.samba.org
Subject: Top 20 developers with open Merge Requests
Date: Tue, 04 Nov 2025 10:46:48 +0100
Message-ID: <7684109.rdbgypaU67@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey,

together with Claude I wrote a little python script:

python3 /home/asn/junk/gitlab_mr_counter.py --top 20
=46etching merge requests from samba-team/samba...
  Fetched page 1 (100 MRs)...
  Fetched page 2 (100 MRs)...
  Fetched page 3 (21 MRs)...
Total open merge requests fetched: 221


Showing top 20 of 88 developers:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| Developer         | Open MRs |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| David Mulder      |       25 |
| Andrew Walker     |       16 |
| Noel Power        |       11 |
| Jennifer Sutton   |       10 |
| Stefan Metzmacher |        9 |
| Bj=C3=B6rn Jacke       |        8 |
| Ralph B=C3=B6hme       |        8 |
| amit kumar        |        7 |
| Andreas Schneider |        6 |
| Andrew Bartlett   |        6 |
| Alexander Klishin |        4 |
| Andr=C3=A9as Leroux    |        4 |
| G=C3=BCnther Deschner  |        4 |
| Pavel Filipensk=C3=BD  |        4 |
| ProhorP           |        4 |
| Shachar Sharon    |        4 |
| Oleg Kravtsov     |        3 |
| Peter Eriksson    |        3 |
| Vinit Agnihotri   |        3 |
| Anoop C S         |        2 |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
| SUBTOTAL (Top 20) |      141 |
| TOTAL (All 88)    |      221 |
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D


You might want to look into your MRs and make sure they are rebased on mast=
er=20
and find a reviewer for them ...


Best regards


	Andreas


=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




