Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E954279301B
	for <lists+samba-technical@lfdr.de>; Tue,  5 Sep 2023 22:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NsgCSwiwW8DPRgYTjnq1xuHBxkhEi9aYv9ioXGCQuFI=; b=bcpx6Kb2lD/xSoWM2SGsymPcjW
	ddPM0z/xpZKhWHYgwtdTGYViuvLO42DESKhArVu0P2nqyYigxgF+CTr9h1wjQrHIgY4XaSA+9aHm5
	fAU+FdB7WrGfa/jjB4dS/VbwERF5wXoecIRDPHgGfNk5LMJmTjvfWgTYmGnBa7jFTK/+tRFNxdIt8
	f4rB5VIg5oZPkTaQiTB28vb44pQIDt5eL/eyaqa39zO3wY1gzQOof0kkKN6C96E3zE9sZ9RR+/lR2
	uBGV2bEe7Zxs8inIWwQb2CIdRKkaCrFHCT879Y0GdyqCyVyb82LYrYh5kt5CRj6WMeX66zIchU+Iw
	vsy1jvAA==;
Received: from ip6-localhost ([::1]:55518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdclh-00127l-MF; Tue, 05 Sep 2023 20:35:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25178) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qdclX-00127b-7q
 for samba-technical@lists.samba.org; Tue, 05 Sep 2023 20:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=NsgCSwiwW8DPRgYTjnq1xuHBxkhEi9aYv9ioXGCQuFI=; b=e80a7p82nAaxg3dpBc41wOxeyk
 CQiHrkti3dBo1pEpuuW+ZVOAwRsyznmK5IQh1vPweXdq2yl1huwCIN87/GXL+GvfskhP14ET9Vrgw
 1UjUFMyeUYay1URkaG+TZPliDchZZwHgvlpSHsa8WeJ1A+DXIvJAWlBOT6d/HF7vmyYnm/bmKZDSH
 haKij4ca7zxb0qpN3LtyefBgSdhrPDxK4UGaHW9Q5D2lkccKrGtRWwJRZt2OXd9Hxk9doF3IZHvBA
 cUfGCw+L3BMAmFrftRiNwarKyCxHHs1UuJh+EIqGOqDCom011vCcXgxw/bIOt78TiB29W00PJW8Ek
 m8CQlCoeXp1RwtDi6k3bpn6A7TdxZIxZ2iCrzTP67eqCq13Cd4K6AHBL7UeTNqy31UM7rh6lt7buf
 VDuNzh7mrZvzQu7mNQulB0xumstsCiT4/pZ7e2DlN4dqnT2+zP6lKi8QVTwTxv0VrV6+oS05BpBgm
 BPQ1fYDvJpzCQLgHJr958M8d;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qdclW-00BxKF-0p; Tue, 05 Sep 2023 20:35:14 +0000
Date: Tue, 5 Sep 2023 13:35:11 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Failed to join domain with un-interpolated string ...
Message-ID: <ZPeQ/+lgBym1MMyY@jeremy-HP-Z840-Workstation>
References: <CACyXjPwergRhYMWViO=xH4y8a44BU02PxEd1UEZk-DLm_ZR6qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACyXjPwergRhYMWViO=xH4y8a44BU02PxEd1UEZk-DLm_ZR6qw@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 05, 2023 at 10:37:59AM -0700, Richard Sharpe via samba-technical wrote:
>Hi folks,
>
>I am seeing the following errors when I inject delays into certain
>SAMR functions during domain join:
>
>"Failed to join domain: failed to join domain 'test.qa' over rpc:
>{Device Timeout} The specified I/O operation on %hs was not completed
>before the time-out period expired."
>
>However, the '%hs' is not being replaced with an actual message.
>
>Is this expected?

It's a bug in the error text here:

libcli/util/ntstatus_err_table.txt:

"{Device Timeout} The specified I/O operation on %hs was not completed before the time-out period expired."

There are several '%' characters in these error strings, which
aren't being matched with appropriate values when
called from get_friendly_werror_msg(werr).

So yeah, expected, but also yeah, bug :-).

