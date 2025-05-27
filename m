Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56809AC52CC
	for <lists+samba-technical@lfdr.de>; Tue, 27 May 2025 18:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=snINRHgzR0pARdE9yaIqqTcIiJjdbYkKTgM2gMLU5lI=; b=fNMFnAegmxyZtVVLdSRbWKXFeF
	8uRcjGMKkLMopv4u0Dragn3KjbDqvI7DtnAUdqANjt+Kzfcu1Mw/ngCZBM/uO2T13YCQHg4IO7Uei
	GI9nGPat5fEvT9F9Ip8UASwCgVgvsb59rgRClrsP2ekxiBv0AHTqzJ50xJSYfbW10s7dRh05S0FDZ
	M95tkMAsYYy0n3NE6Lcm8djpwH9FUMeFH5cn4kU+xXI+0Wk3VAMJ3eiVzACs7Ettby1s6Zn5kTC5W
	4k04lfdzI7l9lJlDLo+D4UKHt+OeZ2B/ZZ96Qx7Jr0jDf3Tx+rXqBq6iMuVL/QWGGcFpq6TIJI44L
	NuP14yBg==;
Received: from ip6-localhost ([::1]:33178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJwvv-004HcX-N1; Tue, 27 May 2025 16:13:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16194) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJwvs-004HcQ-DG
 for samba-technical@lists.samba.org; Tue, 27 May 2025 16:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=snINRHgzR0pARdE9yaIqqTcIiJjdbYkKTgM2gMLU5lI=; b=TqTbTuOzse474/dRSv9yUQz4Mw
 KPkEG3QL5tBilLqOj8IWwNyyGNPVMtNsY/NWgFQmrUANgd5iNzpkWzEYcipeUeYsM/Xrr8KJZcenI
 rJk+NWrPdLrGzIDI+ee3cNUrwPQCXByKi9NBNa2trps6wWlIfBrgXNaOB00LJBMgwgZtwsU6OFe/6
 ev7KZ/H4i19DAgejCr5wuMJh88B7HV9zyrUoefZCZ9wJbRbnZ5+5joBnX9KLpc9N15hqQYw7Oabna
 gfD9rL1fmr3hOxtfVGf4ezSf4xNtn7K2VX7G6ekk1ZiYAvYfs4lNhstgG07fVhc9XIB3uJZMkfkJg
 qiFjXBWaImnvh9ad9BGqxYXjAAzI4IDDcjxbQrasoJbHw6KB8egI1TOEsaZJBzzDAm0pQmdVDdxfW
 +gtSKBddYCWdCc/dQNQAgZcc1ih/63jyxSEB/7BmPL+ZC4Gw47ZaCHGA+XIr0aT4zW2JlFwPVCfV9
 KMML3/rCjT9O8dQMUJO0ip/Q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJwvr-007VkJ-0B; Tue, 27 May 2025 16:13:39 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH 0/5] smb:common: introduce and use common smb_direct headers
 (step1)
Date: Tue, 27 May 2025 18:12:57 +0200
Message-Id: <cover.1748362221.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

in preparation of a having a common smb_direct layer I started
to move things into common header files.

I'll work on this the next few months in order to
unify the in kernel client and server layers
and expose the result to userspace too.
So that Samba can also use it.

Stefan Metzmacher (5):
  smb: common: split out smb_direct related header files
  smb: client: make use of common smb_direct headers
  smb: common: add smb_direct_buffer_descriptor_v1
  smb: client: make use of common smb_direct_buffer_descriptor_v1
  smb: server: make use of common smb_direct_buffer_descriptor_v1

 fs/smb/client/smb2pdu.c                   | 16 +++----
 fs/smb/client/smbdirect.c                 | 22 ++++-----
 fs/smb/client/smbdirect.h                 | 50 +------------------
 fs/smb/common/smb_direct/smb_direct.h     | 11 +++++
 fs/smb/common/smb_direct/smb_direct_pdu.h | 58 +++++++++++++++++++++++
 fs/smb/server/connection.c                |  4 +-
 fs/smb/server/connection.h                |  8 ++--
 fs/smb/server/smb2pdu.c                   | 10 ++--
 fs/smb/server/smb2pdu.h                   |  8 +---
 fs/smb/server/transport_rdma.c            |  6 +--
 fs/smb/server/transport_rdma.h            | 41 ----------------
 11 files changed, 106 insertions(+), 128 deletions(-)
 create mode 100644 fs/smb/common/smb_direct/smb_direct.h
 create mode 100644 fs/smb/common/smb_direct/smb_direct_pdu.h

-- 
2.34.1


