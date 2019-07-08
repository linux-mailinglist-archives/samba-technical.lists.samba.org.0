Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E07C361D5B
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jul 2019 13:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=tuAJ3ibfY3sTmjtgTUkGojdi5GSi6UrVhmq6OM+Ig90=; b=eeB9+S9m7vjdYzR9o5pOQz3nAx
	tTqnfEFOhWp/YQG3jcFZj+qtpl7TLxYSE0jmnlyB+m1Gx+hQGiABTo0MhNuYRVKXyk0oSfO71HTSJ
	cUW6JZj0nnaPN/8sNsvZBqssz6yHFwYkTrJKm0ql16QcuJ8D9kxNWZKDlqZ0NoyByw00lHyMAeI/R
	L+Th4oN4kmMeIZiA0OkCfaS8UJm5Kv3SXAe64kIkfjzRjuTYx8gQCrjn0fmR/hWHA7JGKlpyFbwsy
	pirSgO5AOJQAnOJvuqesBkyAVQaohvbUK0qW6U6CxB/C2/10phGNJfXFz5pQmkdptEdOUE1qumtBJ
	L+x2rbHw==;
Received: from localhost ([::1]:48394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkRMk-005phm-B8; Mon, 08 Jul 2019 10:59:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42074) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkRMf-005phf-93
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 10:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=tuAJ3ibfY3sTmjtgTUkGojdi5GSi6UrVhmq6OM+Ig90=; b=cUXIdYKmLyB6kC3yWqITM4NDxt
 4TcEUssdZIA6wwmVe0M4TnWg3MW/dGZFdF0sN26Ae/N5F468J3AiPdu0OG1WQgLfXfm7fvjjAZMX/
 89URiPgoFTbLR/mkP6ke1H3ghLwEE1BtkIOtSiUHV1jx/P6TkbTvVgWKb8G441T6sk/g=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkRMe-0006WZ-Q4
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 10:59:20 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.10] Samba 4.10.7
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <fab894a3-3202-7e7e-0e2b-d9553a5fe19e@samba.org>
Date: Mon, 8 Jul 2019 12:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.10.7 is scheduled for Thursday, August 22.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

