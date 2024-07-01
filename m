Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE391D9A7
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2024 10:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+f6RkyqFunrnLKk1xOvg91g9Q4uOFhbcZTGI7dAChUY=; b=5Il4/tGtC6fSiQ9Y2gyyoqT8wf
	ikIWmJEKpdTVjJDy2pdsTeet+RpJvxRpWi/c98Nrlg3AJwlRgPFROuhvLl6yJ2Kyy2ZEmg4eVUPM3
	NowseP575g14HeyIdt5DgkR0G2eE5OpbIKrMmuoQ7EdspRNVz9mWV8l+epK/pijgsW+cM7lBWVFfW
	IqfCp73XLvABKMcK1Sro3nq8UcXo751OWPdAg1Qd00SJeG/fZ5IwfOC93RTnm+ohhctcWthaNTlat
	8YaHcK1buw7i92tktJz/WjY80P+mdEz2wcRPRwzY+toyy8MkZDVDYB04jPOV7UpUVIaTpgZMjjTL9
	AqtzF5BA==;
Received: from ip6-localhost ([::1]:50158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sOC3y-002y8Z-Oz; Mon, 01 Jul 2024 08:07:02 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:40025) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOC3t-002y8S-I8
 for samba-technical@lists.samba.org; Mon, 01 Jul 2024 08:06:59 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7301D75ACE;
 Mon,  1 Jul 2024 10:47:26 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 32E6EFB22A;
 Mon,  1 Jul 2024 10:47:34 +0300 (MSK)
Message-ID: <9171cd49-0955-49a2-842d-2c7ad1585101@tls.msk.ru>
Date: Mon, 1 Jul 2024 10:47:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Announce] Samba 4.19.7 Available for Download
To: Jo Sutton <jsutton@samba.org>, samba-technical@lists.samba.org
References: <efc3606d-23f0-442c-a994-46fb374b7bc3@samba.org>
 <e7c529cf-6b3b-47d5-b438-d4e96eed33ee@samba.org>
Content-Language: en-US, ru-RU
In-Reply-To: <e7c529cf-6b3b-47d5-b438-d4e96eed33ee@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

01.07.2024 07:27, Jo Sutton via samba-technical wrote:

> Hi, I’m not sure if this is the right place to report this, but a recent Samba 4.19 CI pipeline gave me the following error:
> 
> 2024-07-01 03:59:51,858 samba-def-build: [check-clean-tree] Running cd /tmp/samba-testbase/samba-def-build && script/clean-source-tree.sh in 
> '/tmp/samba-testbase/samba-def-build/.'
> The tree has 1 new uncommitted files!!! see stderr
> ==> /builds/samba-team/devel/samba/samba-def-build.stderr <==
> The tree has 1 new uncommitted files!!!
> git clean -n
> Would remove lib/ldb/ABI/pyldb-util-2.8.1.sigs
> 2024-07-01 03:59:52,263 samba-def-build: [check-clean-tree] failed 'cd /tmp/samba-testbase/samba-def-build && script/clean-source-tree.sh' with status 1
> 
> It appears that the file lib/ldb/ABI/pyldb-util-2.8.1.sigs is missing from the release?

This file is both in the tarball and in git repository.  I'm not sure
what you're reporting here - everything seems to be okay on the samba
side.

Thanks,

/mjt

-- 
GPG Key transition (from rsa2048 to rsa4096) since 2024-04-24.
New key: rsa4096/61AD3D98ECDF2C8E  9D8B E14E 3F2A 9DD7 9199  28F1 61AD 3D98 ECDF 2C8E
Old key: rsa2048/457CE0A0804465C5  6EE1 95D1 886E 8FFB 810D  4324 457C E0A0 8044 65C5
Transition statement: http://www.corpit.ru/mjt/gpg-transition-2024.txt


