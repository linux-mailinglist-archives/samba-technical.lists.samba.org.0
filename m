Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7382B8B271
	for <lists+samba-technical@lfdr.de>; Fri, 19 Sep 2025 21:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=VMFocH9pWjtC8X+/NEvwZFYw3QaeduLSvuaq9HNU3tE=; b=ek6RimY8zDFvwVq7xIm7HJYyBZ
	Djhv+N0q1KSMqezeMLeO4TszenJeZ+Xg2IjGiWlaht2slSCsLliMlyDd/g1JZy62+sG3tem0jTFGt
	/LFadYxKB5103x9hkqqpxGuSH/WNyIkY2wIEpW7OAbg2WaACE500wVy+z6UBI8fyAXOy6r7JOtsIb
	May2Cljdmh2kMk5mdX58Iu7yQM/5jMH3HSxU0eCQU/7yB8VzDwjZJ2ysVU85LA+cXD+zDbkZigfQP
	DbfQESQL2oGVHp9GyeoqV/J+BNbm6uuWF2LMocF7EB206NKHMyQ/ZNp+CnfERg+qGkr7du1/CDkvH
	R1XqcURg==;
Received: from ip6-localhost ([::1]:29994 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uzhDh-004JyJ-Aq; Fri, 19 Sep 2025 19:56:37 +0000
Received: from isrv.corpit.ru ([212.248.84.144]:38335) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzhDc-004JyC-Jh
 for samba-technical@lists.samba.org; Fri, 19 Sep 2025 19:56:35 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 20A9F155B4F;
 Fri, 19 Sep 2025 22:39:28 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 62F1128667F;
 Fri, 19 Sep 2025 22:39:30 +0300 (MSK)
Message-ID: <db1fb336-7c9b-4816-acd8-e0815a460b80@tls.msk.ru>
Date: Fri, 19 Sep 2025 22:39:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal to change smbpasswd file format to address Y2K38
 coverity issue.
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>,
 samba-technical@lists.samba.org
References: <CADrT-m+CZf3_pzAkKXB0UVHkd1o6NJR2bN+udTf-PCEdvSS-eQ@mail.gmail.com>
Content-Language: en-US, ru-RU
In-Reply-To: <CADrT-m+CZf3_pzAkKXB0UVHkd1o6NJR2bN+udTf-PCEdvSS-eQ@mail.gmail.com>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 19.09.2025 15:02, Vinit Agnihotri via samba-technical wrote:
> Hello,
> 
> Coverity Id#1509031 and 1509040, reports Y2K38_SAFETY issue for
> 'pass_last_set_time' in file "source3/passdb/pdb_smbpasswd.c".
> https://scan5.scan.coverity.com/#/project-view/64750/10100?selectedIssue=1509031
> https://scan5.scan.coverity.com/#/project-view/64750/10100?selectedIssue=1509040
> 
> Although this is defined as time_t, we are storing it in file as a hex
> string of 8 bytes(uint32_t)as opposed to a hex string of 16 bytes
> (uint64_t/intmax_t)
> Existing entry looks like:
> xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C:[U]:LCT-ABCDABCD
> 
> Main crux is to ensure conversion of existing entries so that new changes
> won't break older file.
> I'd like to propose an approach to deal with this issue.
> 
> Proposal states that on opening this password file, we check the hex string
> which represents "pass_last_set_time". If this string comes out to be 8
> bytes, then we flag this as old format and then we read every record one by
> one and convert it into a 16 byte hex-string and write it back to file.
> New entry would look like:
> xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C:[U]:LCT-ABCDABCDABCDABCD

There's no need to worry about this at all, I think.
Just change the type of field to be the correct one (like time64_t),
together with the printf/scanf format specifiers, and be done with it.

This way, as long as the timestamp is before 2038, it will fit into
the existing scheme.  And on the first password change after 2038,
additional hex digit will be written in there.  And everything is
compatible (besides very old - at that time - versions of samba),
and there's no need to rewrite anything.

Mind you, smbpasswd can be on a read-only media, so rewriting it without
someone changing their password is not a good idea.

/mjt

