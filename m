Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB9F9B3D69
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2024 23:03:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZnhMTorCA/H2twr7boNiTf7jisMIywY9uLAIoPmXtpE=; b=Wtnz/M9BASMyxkaKaS8sFh51bt
	NKgiDdL9GDyMAx3yZWQrJdviuvi02t9/Og652fmvdNzOhYVG38+B+58kMC+Y3L7owcHkcJXIduyS0
	9C3p1A0/EddCgthrNJ31ln4/jCUuq6XIRAAdSaN1toBWu+RIz42lKd7FxAzeldnkbp/Z+oKMmfbqm
	Qd41q9zvJ7b3LWpxenxQy7t/P/Sq7C6jj2gHk/SVNcWnBwT3HmSSIDEcmp4hDTz/VjuoETlVPPpM2
	imhV8y9QGjVP+++xBWQ5/K9UqRmFC6ZUctwdcn+5AjtNBOsbAzfyvsEKsEVRSW8QEMqjlzwuGmZ1R
	rfZo4VTA==;
Received: from ip6-localhost ([::1]:46708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5XpY-005Ohe-Kw; Mon, 28 Oct 2024 22:03:20 +0000
Received: from cat-porwal-prod-mail10.catalyst.net.nz ([202.49.242.1]:56948) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5XpT-005OhX-Oi
 for samba-technical@lists.samba.org; Mon, 28 Oct 2024 22:03:19 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail10.catalyst.net.nz (Postfix) with ESMTPSA id 1E386701; 
 Tue, 29 Oct 2024 11:03:04 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730152984;
 bh=kA1+iSw3zcayqqUAHUV0hhtkHXuoUD+FledjmJz87hU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=EnlMGCRkzhkKA1oTzCui0DUmMNZ04FhSPIqf9fgENVNktLCz10P1qXZvMJZufLqIs
 BhUpmGrNg1HDa25nKUfYxW962nfVgsTK5lRxvD8W/0+p3+7D47F8gieZbSI8tYibSa
 S5Td0ZjlUB+XmDy45ikjkrWxaMHQNZHlPsE5jbIz/aKzODs8k2Ag4LeV0o+UvMV4E4
 AHTv7AXGrOTUuh3oMSuNDbFxQkGE+FkgiP34e4VUeUhRiyy2q2fteaz8IXzjFeQEq+
 6XRbq85aQUUDECLTSKaWddZyid8nJaZT8BbA6UEdr1iKn8Rym+yXWLyyawW2LBdb5q
 J11K1rHJaPBug==
Message-ID: <65868a98-13a7-498f-ad66-0dae2f3dcc38@catalyst.net.nz>
Date: Tue, 29 Oct 2024 11:03:02 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <f1cbcc0d-3f5e-4e1b-94da-ae76d2f2b9d5@kania-online.de>
 <60405467-4994-4a9b-8d31-136871c5b721@catalyst.net.nz>
 <cb71c66c-f7e8-474c-9457-0e82b8b4e5bc@catalyst.net.nz>
 <82457840-e665-414b-b7a8-9cb6dc803c1a@kania-online.de>
Content-Language: en-NZ
In-Reply-To: <82457840-e665-414b-b7a8-9cb6dc803c1a@kania-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 25/10/24 09:01, Stefan Kania wrote:

> Douglas have you ever get it working?

A fair question. Running Samba is not a thing I do. But you spurred me
to have a go. It was hard.

In the end I traced what our interactive tests do, which is this
(test_user_silo_access in python/samba/tests/blackbox/claims.py):

bin/samba-tool domain auth policy create --enforce --name=win11-policy

bin/samba-tool domain auth silo create --enforce --name=win11-silo \
     --user-authentication-policy=win11-policy \
     --computer-authentication-policy=win11-policy \
     --service-authentication-policy=win11-policy

bin/samba-tool domain auth policy computer-allowed-to-authenticate-to set --name=win11-policy --by-silo=win11-silo

bin/samba-tool domain auth silo member grant --name=win11-silo --member=win11client$

bin/samba-tool domain auth silo member grant --name=win11-silo --member=stka

bin/samba-tool user auth silo assign win11client$ --silo=win11-silo

bin/samba-tool user auth silo assign stka --silo=win11-silo


If you go:

 kdestroy -A
 kinit stka
 bin/net ads kerberos pac dump -Ustka | grep -A 20 PAC_TYPE_CLIENT_CLAIMS_INFO

you should see something like this:

                type                     : PAC_TYPE_CLIENT_CLAIMS_INFO (13)
                _ndr_size                : 0x000000f0 (240)
                info                     : *
                    info                     : union PAC_INFO(case 13)
                    client_claims_info: struct DATA_BLOB_REM
                        remaining                : DATA_BLOB length=240
[0000] 01 10 08 00 CC CC CC CC   E0 00 00 00 00 00 00 00   ........ ........
[0010] 00 00 02 00 B8 00 00 00   04 00 02 00 00 00 00 00   ........ ........
[0020] B8 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00   ........ ........
[0030] B8 00 00 00 01 10 08 00   CC CC CC CC A8 00 00 00   ........ ........
[0040] 00 00 00 00 00 00 02 00   01 00 00 00 04 00 02 00   ........ ........
[0050] 00 00 00 00 00 00 00 00   00 00 00 00 01 00 00 00   ........ ........
[0060] 01 00 00 00 01 00 00 00   08 00 02 00 01 00 00 00   ........ ........
[0070] 0C 00 02 00 03 00 03 00   01 00 00 00 10 00 02 00   ........ ........
[0080] 1C 00 00 00 00 00 00 00   1C 00 00 00 61 00 64 00   ........ ....a.d.
[0090] 3A 00 2F 00 2F 00 65 00   78 00 74 00 2F 00 41 00   :././.e. x.t./.A.
[00A0] 75 00 74 00 68 00 65 00   6E 00 74 00 69 00 63 00   u.t.h.e. n.t.i.c.
[00B0] 61 00 74 00 69 00 6F 00   6E 00 53 00 69 00 6C 00   a.t.i.o. n.S.i.l.
[00C0] 6F 00 00 00 01 00 00 00   14 00 02 00 0A 00 00 00   o....... ........
[00D0] 00 00 00 00 0A 00 00 00   77 00 69 00 6E 00 31 00   ........ w.i.n.1.
[00E0] 31 00 73 00 69 00 6C 00   6F 00 00 00 00 00 00 00   1.s.i.l. o......

You want to see this bit:

  ........ ....a.d.
  :././.e. x.t./.A.
  u.t.h.e. n.t.i.c.
  a.t.i.o. n.S.i.l.
  o....... ........

which means the silo is there.

If you don't see that, then changing the policy conditions won't matter.

If you do see that, then changing the conditions will work.


The thing I missed, but Jennifer didn't, is that '--user-allowed-to-authenticate-to=win11client4'
is not --{subject}-{verb}={object}, it is --{object-type}-{verb}-{object}.

That means you want '--computer-allowed-to-authenticate-to=win11client$'.

cheers,
Douglas


