Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF2158C8F
	for <lists+samba-technical@lfdr.de>; Tue, 11 Feb 2020 11:20:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=9PBdJK0MALitMaYgLd8R0eV1uFkUjnTezNQn2JN59VM=; b=eBIjjK7jROHEg1NoSP8O4s++Ii
	npfSJI7WGh+/hQ2dr5VrM6iGL3nesf7T/FkEmlnUJfmNQBYrkpprMaRsbmRPai/1mslQnMu8bVr15
	4Ws9vr/5CxFkmQXGbSJ6T7JWChnTOWaBKJsirT0SwVLGhyIv6k7E2bEnj1l+1pagfElKtqv0BH+DN
	tsh0ohbJcooOemh7slVnZmphuhBWzmaLE+/JQTcG8lp6gDBMQbfs6aeZPVm9yCzU3LK4CNZSj88RX
	zUUGReTI8SHfvyC5FNOOIWlDO0ajBn3bH7SkYpbMAD0HwIxk4QEPRYzbbvbM3aGvkdKk2thr+U9ph
	Fp2jl02Q==;
Received: from localhost ([::1]:54866 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1SeZ-009Lor-JE; Tue, 11 Feb 2020 10:20:27 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:42971) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1SeL-009LoJ-EI
 for samba-technical@lists.samba.org; Tue, 11 Feb 2020 10:20:15 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1j1SeJ-0003lu-CU; Tue, 11 Feb 2020 11:20:11 +0100
Received: by intern.sernet.de
 id 1j1SeJ-0005wE-8t; Tue, 11 Feb 2020 11:20:11 +0100
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <B14B9A04-A84E-4DCB-95BE-E029378E49C6@gmail.com>
 <20171105085753.axk2m5lsdjns6u37@kazak>
 <CALdFvJGSw9WSm9UtAB32Nqgt=4qA_whai15Fo9C6ypspdKQt5A@mail.gmail.com>
 <20171106094708.ku75kutkm3s6i23c@kazak>
 <441FAF42-21F1-444D-BECB-843F2CF4A73A@gmail.com>
 <509e99ca-dfed-e09a-1da5-f1b0c1238d5a@sernet.de>
 <CAB5c7xokf5Fs-hcx=uREuiOb2LO1D3AbDAg+kyGzy+Yvpn_4ww@mail.gmail.com>
Organization: SerNet GmbH
Subject: Re: [Proposal] Remove dns_sd API
Message-ID: <5c5cd65e-c4aa-d086-2962-a7e5c78aff36@sernet.de>
Date: Tue, 11 Feb 2020 11:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAB5c7xokf5Fs-hcx=uREuiOb2LO1D3AbDAg+kyGzy+Yvpn_4ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

On 2/10/20 9:16 PM, Andrew Walker wrote:
> This is used in the FreeBSD port for samba, and is currently used in
> FreeNAS 11.2 (though future versions are moving away from).

ok, sorry - I thought this is only for old outdated Samba versions. I
didn't take notice of the additional patches in the FreeBSD port of
Samba which enables the code.

I've closed my merge request.

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de

SerNet Hausmesse - am 12. Februar 2020
im Göttinger "COWORKING" (Pro-Office)
Anmeldung: http://sernet.de/hausmesse

Besuchen Sie die verinice.XP 2020 in Berlin!
Anwenderkonferenz für Informationssicherheit
25.-27. Februar 2020 - im Hotel Radisson Blu
Info & Anmeldung hier: http://veriniceXP.org

