Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944A696848
	for <lists+samba-technical@lfdr.de>; Tue, 14 Feb 2023 16:40:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=EUg6cYHgf+PgGYr77b3GYkRQms4J8bqdWFrIMT9jC1c=; b=v7keQp52RPWgrKUq0TVxVOEPeQ
	Mk5rfb45fCGquSnBPSt1xXvuhiTHKyz+/bi9X3mzkWtnUxDOuLudTAGtfozBpsmHdX47J5vgcVs3Q
	C40+ufaYphmwzpSyeNoAcDvTsyxLJab5QBHRQcZZ6PhBiM+oLjNS1NE7lQh5ILL5s2/JzGbxldERG
	TL31TM6efldFHPfR4kN4OyO7S/ePNzfiBx4F5aSQoA7gMUF0ktJ/0xyRmJ2XI7ScbX2wiVS+hYGGl
	32CQPWK7n/HRgeuAw+vGBT5neardHFiOmo13848/9CpdA1+fcqP1SEWIVqFlDrxTQ8kX4PtWhfe0x
	8YZlZ6xQ==;
Received: from ip6-localhost ([::1]:28534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRxPa-00C6tQ-6W; Tue, 14 Feb 2023 15:40:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61244) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pRxPU-00C6tH-6e
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 15:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=EUg6cYHgf+PgGYr77b3GYkRQms4J8bqdWFrIMT9jC1c=; b=Zqr5PQpxRza2wNvHC7iTYaScQh
 Jvi2auqoFRw/qQaMQVws9N0/5jn/vGMNtkTft7fo308eFH/o/qd6UvR20Lfh8HtMi50u0jKqbGE14
 UPmye6Q0B0EYO92sFsuznQ5GlRgT/594++rMZMVKrLoSd+1/XLZu94UfpQJwKjlRzV1lUgwA/YZ7K
 K2I0mx4C1sB7ZBnl489SyfrEsAWWh3Oo87iqJwBTai5JJCu3xQREZLtvqQkk8pKZGdrHAIh2ZqdgZ
 yIV8sL4a+7+THSOOdW2DVW4qy2VvqGAL0go0vqekNmMSRwy9VBHFmjpDKUTTORPKSQ9wcHNyEYXaz
 ng1XcvPl6OjrrzOjuUIWeQxSzPw/x0IDYs0TDnVc5wCRlyv5xGfqtvjvQB5WfScqyJ/qiC0g8u3PZ
 4mtjCTIfSTDZ6jGgW960kZGY6VjZVSJ1AmZxfhgt6g9fxx7TdhYJcZ/UsV/FF5dGNVYWv27UUxKdv
 ePAWDu16cVluCIlH2zkJHmqX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pRxPT-00DgGH-HV
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 15:39:59 +0000
To: samba-technical@lists.samba.org
Subject: samba-tool domain backup with lmdb on btrfs fails
Date: Tue, 14 Feb 2023 16:39:59 +0100
Message-ID: <1944992.usQuhbGJ8B@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I've discovered on my Fedora 37 system that all tests related to domain backup 
fail. The strange thing is that I can't reliably reproduce it, I see reliably 
two different errors:

lib/ldb/ldb_key_value/ldb_kv_search.c:162: Invalid data for index  
DN=@INDEXLIST

or

lib/ldb/ldb_mdb/ldb_mdb.c:419: MDB corrupted for key [ DN=@OPTIONS]

ldb: Improve debug outout
https://gitlab.com/samba-team/samba/-/merge_requests/2936

It the tests worked just fine on my other system with openSUSE Tumbleweed. So 
I've tried to track it down. My home directory on openSUSE Tumbleweed is ext4 
and on Fedora 37 my home is btrfs.

So I created a btrfs filesystem on Tumbleweed and could reproduce the issue. 
The next thing I did is replace the compression algorithm for the domain 
backup tarball to gzip and it also failed.

Now the question is if lmdb or btrfs needs a fix and how to create a minimal 
reproducer. As I never worked on this codepath, pointers and ideas would be
really helpful!


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



