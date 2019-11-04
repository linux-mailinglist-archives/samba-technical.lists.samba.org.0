Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B2EDBA0
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2019 10:23:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ZiHehtD9lLgoOyXEbT1d1VNujDpwBV05INl4a5MCAKI=; b=s7us73u+ciiIFt2YoQL1IrUR6d
	M50bTDME4yHXL1GAqNeihNKIEmvtfmbw8GYdM3bYURLfrNdXOOs6NwnkATkFDawxdxZ7z6luhh6Fa
	gp8yq59vewxdiNaNS8qAibR2ORf6P8fWVqG+DtZDEraaMe5HWtC+EDHJgVEpLJ1RZD49xdeQMP48w
	20HewG75fILV1ASHn0AlrOtZtnfQ0GnJ8Q44W8XIqCKi9cdwDkf8dp9WeNM9OPY3k4GcuhlMsrmtK
	ZavssudnIUkLRUfY8Wq4wiua3kaPjiA6SuPlLaiMLlTcIdttrS6gM2UFpNh0eBtKMpSiiShANdJUv
	JweY80Xw==;
Received: from localhost ([::1]:64842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRYZx-006SVu-CK; Mon, 04 Nov 2019 09:23:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRYZp-006SVn-1J
 for samba-technical@lists.samba.org; Mon, 04 Nov 2019 09:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=ZiHehtD9lLgoOyXEbT1d1VNujDpwBV05INl4a5MCAKI=; b=uVMu0ZWKrMx7dSgcFaX4wtV3Zz
 LraYijLe+Row082nSSevEP4I2j3mngoB5VYxCnwI9bfNonInQZqMYvsEYgLvfrMSQwBeYYv6Y7ROI
 LEnUmRc3BY9jKCQNmTFAplmzT2rja4GBKLql3EXff2a0LHJIZ13VmFJrtQFGn6B2xjuMzDXtQeczL
 v8qXlvJyFyaLJASILgkvc460k7QmZgeDxt5uiLmYX1HPSU4k18X64blEvAmCzyOaoU+FAjs6kepMK
 omEREXcxV2jd0tSTYMs7XExQPUMpoIRCYBjq/nPezq8a1nYUMfLXO6wZGXB+F92al/db3mKgbh9Qv
 i/QcG2oJCZFTUpSFy93vihcgBrOI7kLubPPsRfWkoX0q1KV/23mkLC4tuE1qZm2myX+s7/qdGjtpz
 7MaecNKgOtO58vavjL7bqVg/+cd3SHBU0Gj58v4WeoEEA9Ru1Mgb+b/fcQsg2aB0U8JXWwH5H4Ifo
 jG80UeqlCg7QodjwFxhitVPk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRYZj-0006ko-VX; Mon, 04 Nov 2019 09:23:04 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: Noel Power <NoPower@suse.com>, npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
 <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
 <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
Message-ID: <1f594677-aa62-6d89-fa34-b95f05edd27c@samba.org>
Date: Mon, 4 Nov 2019 10:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 11/1/19 7:31 PM, Noel Power wrote:
> Hi All
> 
> Just thought I summarize what we (myself & Ralph) discussed, for my own
> benefit and the benefit of others.
> ...snip...

thanks for the summary!

> problem 1)
> 
> The mixture of xyz & xyz_smb1 test environments seems to cause strange
> issues (see
> https://gitlab.com/samba-team/devel/samba/pipelines/92945128), many
> tests fail or hang. Running the tests against these environments
> individually works no problems. Mostly I guess this is an issue with the
> fact that the NETBIOS name of these 'duplicated' environments are the
> same and this can cause clients to connect to the wrong server (from the
> wrong environment)

maybe you're just missing to assign IPs to the new testenvs in
selftest/target/Samba.pm?

> problem 2)
> 
> Yes, not being a test environment guru and being maybe a little lazy and
> I wanted to avoid trying change the test environment foo to change or
> pass down NETBIOSNAME  (seemed a little risky too, maybe there is other
> things like this).  So I decided to create 2 new autobuild jobs to run
> the smb1 tests. Unfortunately these fail in CI (see
> https://gitlab.com/samba-team/devel/samba/pipelines/93029325) What is
> really weird here is
> 
>     a) running these autobuild jobs locally on my own machine causes no
> problems, both jobs pass
> 
>     b) running these jobs in the *same* docker container as CI uses
> (using the same autobuild command) again works no problems
> 
>     c) running the problematic jobs on sn-devel-184 using
> autobuild-private-security.sh again works :-(
> 
> I am trying (sofar unsuccessfully) to figure out why these are failing

This looks unrelated, but maybe this will work too if you fix the above?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

