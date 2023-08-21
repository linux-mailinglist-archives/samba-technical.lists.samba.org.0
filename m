Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA47821A7
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 04:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=n6CVRVK+ki8qfbCA7Jl0jX65pmQeltTPYnaOcCb/NcA=; b=pL0wC1mB6wWodp5Mc1gdEgb4vB
	MQaL5PQQitpR/3q1tA0Fbb38WtgxSdAOFDCgUiAVagRXd9//M+L1WW0kSVRMPwmtQB7ADx/RxkEqU
	BQ5qFjEkHjbLfwUn492QdUfpZzU+vGqPr4GPlTkgbCV6bLtJnEtggPNuJrD++v24YjFVufakLpt9E
	nZ7xiOJaC3XJT0Hv4mHSZS2iiUx58BGddk2IW+6xq+C7O5TBqEjR/8Z1lq8xelOlK2aSB/UzbTln5
	tScmP4PcBtEwuMcvWFrJFVQ/0ntIX11vp/+33oOToKJpMpyxO4hXu0f9cmiejRnsmYj4MdD+Ox1CZ
	28l1AIsQ==;
Received: from ip6-localhost ([::1]:41452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXutq-00DXSC-0y; Mon, 21 Aug 2023 02:44:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58428) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qXuti-00DXS3-Rw
 for samba-technical@lists.samba.org; Mon, 21 Aug 2023 02:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ac4xKq3W6j70DGwQELtUDtxOkWuoTf4K4VlMWNv0y0A=; b=tzMblQwdY/fUSAP/AIkDuidU6p
 YsEMjWErs899TB6PB9nooUBDxvdUpMfyztMN/M0dsxH8QpBupv0Bo4OrZE48obqQdU0k6NQYb+q7F
 Ur9LVBI68mWE0IqDM6/7Mw2WrL5Zoi7r3d2/quSNmt9ILlRovYLNUtO4cboF4eB47NQ4b1iD0Igz7
 JeezUfOWqtVN3kjD/vTYrKTseUVl3g1KaZ0Bmt7VaMs9Pb+q1kqCH3YSekG1n0Yd6mM1b9N768Fdp
 J8h40JFVeOZFRWTQSchDtplpoVI3ez477DUP9I7WqO9b8fdlgUZGrctSdXtrKr3d03S6PeRb/a0Ds
 1zYELJld5snuD5KEnvwzw/HYcyZvmEh4pWdGG4JNz6XZtfZIGguAwOUz9recUR7ipp55As0S64SbV
 evksY2+GbZPQhtb6aE7k7GvZRSfx1jFvh6C4Qw37JhuhElDKjPIF8KbWT9lC2qUmAANAfLIUSbUDV
 mMoSd7gGCTdzqh2wb1P4bLXr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qXuth-0095pF-1O; Mon, 21 Aug 2023 02:44:06 +0000
Message-ID: <dd2f4ba33c19cae2271c23c9bfb5e90d5d3172c1.camel@samba.org>
Subject: Re: Building Samba master from a few days ago on CentOS 8.5 runs
 into a weird Python problem
To: Richard Sharpe <realrichardsharpe@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 21 Aug 2023 14:44:02 +1200
In-Reply-To: <CACyXjPzjJTfpx7ad2BQS0CiN0SRazz_7tdSwDnX7+qZR9VFfYg@mail.gmail.com>
References: <CACyXjPzjJTfpx7ad2BQS0CiN0SRazz_7tdSwDnX7+qZR9VFfYg@mail.gmail.com>
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

On Wed, 2023-08-16 at 18:50 -0700, Richard Sharpe via samba-technical
wrote:
> Hi folks,
> I am trying to configure Samba master from a few days ago on a
> CentOS8.5 system.
> I ran the bootstrap script and it only complained about lmdb-devel
> ...
> Then when I ran configure --enable-debug, I got this error:
> --------------------------------------# ./configure --enable-
> debugSetting top to                           : /root/src/samba-ad-
> error-injectionSetting out
> to                           :/root/src/samba-ad-error-
> injection/binChecking for 'gcc' (C compiler)          : Traceback
> (most recent call last):  File "/root/src/samba-ad-error-
> injection/third_party/waf/waflib/Utils.py",line 833, in
> wrap    return cache[k]KeyError: (<samba_waf18.ConfigurationContext
> object at 0x7fb83837d8e0>,)
> During handling of the above exception, another exception occurred:
> Traceback (most recent call last):  File "/root/src/samba-ad-error-
> injection/third_party/waf/waflib/Utils.py",line 833, in
> wrap    return cache[k]KeyError: (<samba_waf18.ConfigurationContext
> object at 0x7fb83837d8e0>,)---------------------------------------
> In looking at the Python code it seems like there is an issue with
> theexcept KeyError clause in the code.
> Has anyone seen this issue before?

Richard,
Just checking if you managed to work it out?
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
