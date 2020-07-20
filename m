Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 594CA227342
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jul 2020 01:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=o/6O/1Vqa0ydpKZ3tJwbctAbEbBubH6maLgXLkSqbE0=; b=vkgGNYKPiU0LEg3jLjGESiUeuG
	T2kxRHEAzTjPL8Ez6gBPYNdBpRh+7DCFMVXZ2R8zj1fnPVx4MxLe3QyEjO5yyv+gfIAx0GmiX2Sie
	YUshQonx5nxYSi0d7NeUs9PbkdNd+oHTqm4xwX8ijS4zK7dUezvsmi+xXZvF2af2hQX6ZgrExgeg6
	GJIOvOjKLYbHHs9cZRCiiyjfjLHE0OAJvWOsvh4Gy1/EdipBGgt0CFzDg6orZcFWD1/jGFHRq7w0B
	JKZURlbGjFLbhrUT+8na0P5LyhLVCmWli60lcED3aRGxrTQL7+DLroK7rDuokEWUz9EVhdCCEIwFg
	jRH8Aclw==;
Received: from localhost ([::1]:44548 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxfUt-008wn2-CU; Mon, 20 Jul 2020 23:47:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44372) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxfUi-008wmd-2Q; Mon, 20 Jul 2020 23:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=o/6O/1Vqa0ydpKZ3tJwbctAbEbBubH6maLgXLkSqbE0=; b=KSw2AfRVmip3yNqaqOivzuHmWq
 USccqw6ZAX8fPXlB5wOD02HLT2rA6c8OXRlgnP1rkxkQQGyf8/oFLMFGyNzBqX+lDoWHKUJ+CLv/n
 A8gQ+P0d+6+qIcOzfnP4+DjPbqayDR63OoMseU4qUKbAuJrwGI4DhRZQ1h7dgQPwi+UXrlHVQ7Pnh
 Zp4uxvEPAmw8bpD0M5bYm06fipCrGRJCrdoe/wrZ5oSz3ZGdsC+TLGuyJKkyzhENuusIDLhMocRaI
 yyftgpgywrfVEONriFO1YZ0nq2Djdwj/B8ekigfdYjk/da8g3PZXxv8eKdj2vmChppCtanQWIK/vY
 BhKq4ML6K60kS0hx6/3/ejW2izv3wawIjPtSX4d2E1q4mSjShc1+gxhkDW8exUYSoLxleLHiHyWSg
 WwljqIEMJWTT+opXe+ud4g0ZF/TMNJbFyixrtZpS/s2j76V6gKG5GCHMkOHNNnvt94rzSGPYGe4iJ
 LFJjZbag4wNdYdURyO4A6HV1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxfUh-0006jM-Bk; Mon, 20 Jul 2020 23:46:51 +0000
Date: Mon, 20 Jul 2020 16:46:45 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Arstechnica reviews Samba-based iXsystems TrueNAS Core
Message-ID: <20200720234645.GC3702@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Really nice write-up on the Samba-based
Open Source project !

https://arstechnica.com/gadgets/2020/07/an-easy-mode-for-zfs-we-test-the-truenas-core-12-0-beta/

Congratulations to the FreeNAS/TrueNAS folks !

Jeremy.

