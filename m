Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA77EA344
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 20:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=UBGWSU30fIduvN+gw/bT7fGZ3hedJB58PdFWUJ7JysI=; b=YcHSR/XtTVJWc0BeAFSTGLO+04
	3m8jikYQqe0koHnjeeyLwQ7lWVJ4MsMHv9V8g08uE/O8AJ4oHTWBzJosA2g63gldzzxrpjGIeNu5O
	W3fOacgn6g9ASJdgA19brMAUoC13u8jFpn9jiD8B7n6jP4CVy5d9ty+MoPbvWOvF03t7t/Vc7Atbc
	kXZbNV+4hDIBYKsK6kARAuzoERenJOeVt+JMkNQczDkOT0MzRo23CH4XqIjTaRdNHA3HUC8EqSAZz
	vmJgUtcorTvuH3ZQ7e06DngKNQehsu289eP2p8p3P4gk/dKInEzN7EiUCPCR7ZIhEGTtqtW4nSCL/
	2WTIjm9Q==;
Received: from ip6-localhost ([::1]:52030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2cEc-0088gQ-9V; Mon, 13 Nov 2023 19:04:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62286) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2cEU-0088gH-Fm
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 19:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=UBGWSU30fIduvN+gw/bT7fGZ3hedJB58PdFWUJ7JysI=; b=Isa2JdegCH6M5ilYHXOzb0WgDf
 Lf7py8AFXPemN6dij7HCoI1+Z3UEBPH+l/7d3PnaY22pCg+yKk7aPT96hic/NJYYthqPT4LqirGlP
 z3vWkz6h3v7XC8WBXW3WK89PgarqHwnx/GS7BKN+NzdMlvd4eQCD+34eu909qOt2glxkinnqgLFDJ
 p7LLeid1JBYCkl16pLSestG8kUc0vcy9FrFrgahtisLAhOGUXMlfMy1btetVDWragr1zY4SdDjan2
 1CXBvCoDMxroiCaP3IgV/3BJwIYW8e5qtigJE4EoBAxw/m2eCeNnJrBBZQhZn+dA5DC3EnfFMefMc
 N29ohtAoE0AIU6MerOgs9QIIctw1oED91jPM+VX38uamefGQcVv+OQT/vpmy2l/3Ca+JXqHPQ1fjk
 vxSsoxC1FKWERePkLVRW026ppo4FgNtAuyjHhM/H7eRBbwmiCOvlrGeNJJXxDjPeULDSAwNp1Nwp7
 7s16MFPTiyEa0z3I1ewW+FSc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2cET-005yXE-2P for samba-technical@lists.samba.org;
 Mon, 13 Nov 2023 19:04:25 +0000
Message-ID: <dc587b8f-72c1-3437-2184-4a8e0200b73b@samba.org>
Date: Mon, 13 Nov 2023 12:04:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: rust in Samba (for certificate auto-enrolment)
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
 <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
 <4161642b58cc7840c73c91cdb000716b423593db.camel@samba.org>
In-Reply-To: <4161642b58cc7840c73c91cdb000716b423593db.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 11/13/23 11:42 AM, Andrew Bartlett via samba-technical wrote:
> On Mon, 2023-11-13 at 15:28 +0100, Ralph Boehme via samba-technical
> wrote:
>> On 11/13/23 14:56, David Mulder via samba-technical wrote:
>>> I'd additionally like to be able to contribute rust code to Samba,
>>> and
>>> I'm certainly glad to see someone wanting to work on certificate
>>> auto
>>> enrollment. I know there is some opposition to providing rust code
>>> in
>>> Samba, I think because of platform support.
>> iirc this was about AIX for which we do provide our SAMBA+ packages,
>> but
>> last time I checked several months ago AIX support was about to be
>> released in rust, so this is likely not an issue anymore.
> I would love to see some ways to start trying rust in Samba.  We will
> only really know how we feel about it once we actually start using it
> in anger, and our packagers start trying to package the result etc.
>
> Things that don't touch the core file server offering are clearly going
> to be the easiest targets, while we start to understand what working
> with rust will means for Samba.
>
> So I think this is an ideal place to start.
>
> Python was in the same boat for a while, and so there is a
> --without-python build we test that only uses python for the
> build, but produces no python requirements in a bare fileserver.
>
> That helped us get over the line.
I've also thought of writing some AAD/Entra ID stuff in Rust for Samba.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


