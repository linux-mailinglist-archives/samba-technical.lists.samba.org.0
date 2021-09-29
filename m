Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD3F41CC20
	for <lists+samba-technical@lfdr.de>; Wed, 29 Sep 2021 20:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EC1s5XsryDU8w6Az+0d6CRHsTQcCg7LkGj6VmvfVxCU=; b=FIRH6l11msw/4cUVMEyIURMbq1
	PUfGQRaV37JYMQqSjU6oTFaCNk6G6HWFY0IHpS8cim20It9wRkCOq4EhFljJqpmXp7X21rx0F6PxJ
	F2EDurofQBYCgzJeGmXLk/ks24Qn0AGo1XlgU19tpt7yMNzDUR5Tvh1rbPdyUU/RZmpgWjuLyTugU
	poqSZO/ncUNi7hnnXCNbBdYL1cV9RrrYh+CudJevwEvoyC/Y+CwlUL49KM0Le5Qy2P7aRxKa4L0d9
	fikPgAb+oUe4IyWs5qnQ1tOu8Cv+joliRk1wk/QYTajn7fIZFi/n+cBMvrEs/bu0YJxcotYgdGmxy
	TuVPAITg==;
Received: from ip6-localhost ([::1]:21812 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mVedO-001CKW-Rq; Wed, 29 Sep 2021 18:48:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50498) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mVedJ-001CKN-G6
 for samba-technical@lists.samba.org; Wed, 29 Sep 2021 18:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=EC1s5XsryDU8w6Az+0d6CRHsTQcCg7LkGj6VmvfVxCU=; b=JoZw1H6g+FhklIa/4KtMCvnlaD
 4/kbZQTZfrCx2qv5qIya3DMJkJS1I8OjQmoQ74rMr4+y3S8xiUYcceiH2A2K+GyEdFe9mKkxrA+H2
 f6w1um1qYp36acIvlWKhRQF5SI1A/Rub/3omLGcCc3Gcg7MrlJeTpPzrZJ407ESUzthwyNB3DtIgn
 johdemZyDNPyS8zYaYOGn+UVsVYKRd9iy0lfdVwYgJOrrl/DyacXaWqJ5F1dFGhvGjYYDm5xZc9ha
 U+MvQP+mvL/DPVaZa2dk02iUgxnD0BcRh+C/tOGI3Qp6Qz2+tTIk5mluODtYOVvKntNYD3vZ5Ai2f
 aUcG0VhcNhljtP/wxNxtf+B6vSR6Lpkv00HIUOD50H6RRoSKDEMMSejqUKfqsie57yVQCPMHMy4v5
 MI68HBV29EhGkylcX3OHSG33vwgorwO+z4lKBNxVDVNtOloHD+P2bLq+ANC2YW9FhP9pS17IpLUcG
 AgVVJ5M1nYSXtKXv9tlpdyhM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mVedI-000kJH-Cy; Wed, 29 Sep 2021 18:48:44 +0000
Date: Wed, 29 Sep 2021 11:48:41 -0700
To: samba-technical@lists.samba.org
Subject: Adding the ability to remove the SMB1 server.
Message-ID: <YVS1CdwAYbqdZDfs@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is just an FYI. I'm working with
David Mulder of SuSE (actually he is
doing all of the work :-) to add a
waf configure option to Samba to
enable users to not compile the
existing SMB1 code into the Samba
binaries for 4.16.

The option is provisionally called
--with-smb1server and is currently
set to "true" by default (i.e. we
*will* still build the SMB1 code).

As the code will still be present
and able to be compiled this will
mean minimal disruption to our
regression tests, mostly we'll
just be able to add a new test
target "smb2only" like the existing
"fileserver" test target (in fact it
may be possible to make the existing
"fileserver" test target use
--with-smb1server=false, not sure
yet).

This will prepare us for the future
where we support SMB1 only in client
code for connecting to legacy servers.

Having the ability to ship Samba
with *NO POSSIBLE* capacity to
serve SMB1 would be a positive
change for security-sensitive sites.

No current ETA for this change, but
Andrew suggested to me this would be
a good thing to bring up on samba-technical
in case people wanted to discuss.

Cheers,

Jeremy.

