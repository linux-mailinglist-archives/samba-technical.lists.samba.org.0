Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 456EA855493
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 22:16:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=pPULSIhO7/FcNzG2RfyQC66mPqQ+Ga2Od2qYenmT+c8=; b=eIJqhWsl+iGPYm3GqOT451NSEJ
	wInn805eNHAuhpa0oIdY28P788srESeIk7tTwaV5Lqfg8IH4MgHDwhClUmhU2avZVlIyD0PNNsKyY
	pkCmVjQn3YEj6DTlrTYDoNZ1n4Efxl9jQpj4kFSk3fcBMACAavwpQSVz9UGxrnR9fzpB/Z8s7+NrD
	H/mOmaA3qcPLKB7Nz18m380uW8C2NxQvAJdZFvKLqm7WavSkhUryssymIWZJ82PSzUQEx1/pqjB8c
	K4Wfhd4mImKNUOXuwBY5qmNb6fsKhfz57yxZzNLhLFSHUC4zX1EfXwajM3k9wpV+jiCYe8Q5DwtcW
	vq2Z3l+w==;
Received: from ip6-localhost ([::1]:57638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raMbp-008Vpw-Te; Wed, 14 Feb 2024 21:16:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22708) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raMbj-008Vpp-Rf
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 21:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=TkV0Q6Boa/2RetTkGCseNj0jW2BVl5Jp7Hb8IURFh5M=; b=Ic4/bJ2/DB5RfjYAoVgK2fHHfd
 7pQPwWCU1wO84jz6Qiri+xbKzSnIStO+shTNwFNdYTCsiaBjtSy1r6qDy9uACJmHnWpj0WtzVhWTU
 LGuE0MT652PtClP1XJyQdMcINAdrD8v74wQUu+0a53Zg7aLg2yCJ5cEe3eOVUEo+stN2U+KmCTWPA
 Vak66DJM5txacgsxd/BiH0taATSdRT+0neUCWlOqDhta+7lKI7lUmzfnOrrL1tOUbCSGCa3rIABZg
 h2vs1Jn96rC17D87qYrc/830Zs9D/+RZgMsiEOM+WuFfolIQRcQ2mE0cnzX5a6nblpXoQwLjw2PZq
 2WA1s6NCw8wckCdp6npoO6YC9aAjrYGsFYKKfIahM5mjsr/YLxE0T/aXQs7/AUXvrxdJ5K1RUWYDG
 hRspHxDLhaJwMbqHeRQladv3TrkYVpbOpZzzCQbA3IPskfNr2bZBZuNX19a8JJ5v8RatyHURfmgys
 ofIOiLozxFgKvP+utPEbZXFY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raMbi-00D5gj-1b; Wed, 14 Feb 2024 21:15:55 +0000
Message-ID: <d86085efac671b56c7ba8389e5f509a51206fdaa.camel@samba.org>
Subject: MIT and Heimdal development patterns
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Date: Thu, 15 Feb 2024 10:15:49 +1300
In-Reply-To: <20240214201949.328f5cf4@devstation.samdom.example.com>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
 <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
 <372bd541-decd-4c1e-abf2-940833c4cfc9@tls.msk.ru>
 <Zcz2oHdkRyYgJK6E@toolbox>
 <dc921798-03f9-4045-957a-dadedc51993f@tls.msk.ru>
 <Zc0LAN08B3wPY8pr@toolbox>
 <20240214191249.727ce60d@devstation.samdom.example.com>
 <Zc0W3hMABO/gCdvC@toolbox>
 <20240214201949.328f5cf4@devstation.samdom.example.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2024-02-14 at 20:19 +0000, Rowland Penny via samba-technical
wrote:
> As far as I understand it, the whole idea behind running Samba as an
> AD
> DC is to be Microsoft AD compatible, so having the extra MIT
> capabilities might be nice, but are not really necessary if AD cannot
> use them. Can I also point out that Samba 4 was released 11 years ago
> and, in all that time, MIT has been the coming thing, it still hasn't
> arrived, there has to be a reason for this, could it be that people
> are
> happy enough with Heimdal ?

The pattern has been for, with one or two smaller exceptions, for new
features to be developed against Heimdal and then work is done to make
the MIT KDC able to support those features.

The size of the gap depends a lot on how much you care about matching
error codes exactly, but in terms of developing new features, this is
possible (with a sad side-effect of a diverging feature branch due to
an poorly-resourced and disinterested upstream) with Heimdal, and not
commercially feasible with the expected development pattern for MIT.

That is why there hasn't been a great swap over to just supporting one,
which would overall be much less effort for the project.
The bargain at this point is that tests are written in implementation
independent Python, and that folks who care about the MIT KDC are most
welcome and encouraged to make them pass as their resources permit.  
If that knownfail file ever gets close to empty, we can perhaps have a
discussion about development going forward being against a Samba
vendored 'lorikeet MIT' (replacing lorikeet-Heimdal) and 'upstream
MIT', rather than the current two-implementation situation. 

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



