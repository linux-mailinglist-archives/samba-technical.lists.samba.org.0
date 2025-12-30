Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ABFCEA424
	for <lists+samba-technical@lfdr.de>; Tue, 30 Dec 2025 18:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CuVRG8WBGwCVViySH5Pv9J7p4O1XMfIETW4T068MI90=; b=4EFooa43XGm/N2gbf6SRi9ddOJ
	pcZWcE6lx7Sryy5XrL4wA7CO6N/P3mtKhekakmnf5qpDVeo9w8RG9+ua23oKTQ6BYWndLhX6tydVB
	Dje4HSq91M3sSvkiA49fOHPVZxo9gGoiVTYNlbtCttIaQSZfbiToPAOuH34biskEPu2HpEJlSq2r9
	pEAVFMJpuk1xvU1bCZxa30FfKAEcDIngWI9aDZLj5aPhvlYxV30nULBSTsLgcLxmuxoUVPhRyOIYr
	9k99hIneO76Y1QubqsirlFA42QggJsniq9bd0fBJjGxy6TUH+1z8PB6nua/qnAjP1PexaZcrqAWIx
	CVWVBxYA==;
Received: from ip6-localhost ([::1]:48794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vad9h-00H0Rw-Mp; Tue, 30 Dec 2025 17:05:09 +0000
Received: from air.basealt.ru ([193.43.8.18]:58602) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vad9d-00H0Rj-Ed
 for samba-technical@lists.samba.org; Tue, 30 Dec 2025 17:05:07 +0000
Received: from lenovo-93812.smb.basealt.ru (unknown [193.43.11.202])
 (Authenticated sender: alekseevamo)
 by air.basealt.ru (Postfix) with ESMTPSA id CE50A2336D;
 Tue, 30 Dec 2025 19:48:34 +0300 (MSK)
To: smfrench@gmail.com
Subject: [PATCH v3 0/1] Add hostname option for CIFS module
Date: Tue, 30 Dec 2025 20:47:58 +0400
Message-ID: <20251230164759.259346-1-alxvmr@altlinux.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAH2r5mvDa8E8NKNHevoWYARY_52DJ+WQX3oetYw-pwysMyAKYQ@mail.gmail.com>
References: <CAH2r5mvDa8E8NKNHevoWYARY_52DJ+WQX3oetYw-pwysMyAKYQ@mail.gmail.com>
MIME-Version: 1.0
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
From: Maria Alexeeva via samba-technical <samba-technical@lists.samba.org>
Reply-To: Maria Alexeeva <alxvmr@altlinux.org>
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 Maria Alexeeva <alxvmr@altlinux.org>, samba-technical@lists.samba.org,
 tom@talpey.com, vt@altlinux.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good afternoon!

Unfortunately, our correspondence was interrupted at the stage of discussing 
the shortcomings of the previous patch versions - we still have not received 
the promised comments and suggestions from you.
We have decided to revert to using the name hostname for this option, 
as its application is not limited solely to domain-based DFS resources. 
For example, it can also be used for mounting via CNAME.

We will send the updated versions of the patches for both the CIFS module and 
cifs-utils in the following emails.

Maria Alexeeva (1):
  fs/smb/client/fs_context: Add hostname option for CIFS module to work
    with domain-based dfs resources with Kerberos authentication

 fs/smb/client/fs_context.c | 35 +++++++++++++++++++++++++++++------
 fs/smb/client/fs_context.h |  3 +++
 2 files changed, 32 insertions(+), 6 deletions(-)


base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
-- 
2.50.1


