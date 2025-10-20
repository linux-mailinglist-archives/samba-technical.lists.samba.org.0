Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0D7BF2F4C
	for <lists+samba-technical@lfdr.de>; Mon, 20 Oct 2025 20:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=KZq8yJS6P7GhtA6jAmeV72n9c7cr6e4dDAA8rc3T/rY=; b=4IlYsi4zYjqOmrsObkv0vYO6od
	hyZDi6Eb+p6e6kLVAEyLhG36WqGa6HD+EtoQDSrT70eTPdTEdTuPUOY+NBIEyIF9w2/sVP29YNz9d
	0xCgXasEHgN6ztis039HpkZ5V7/pUPsaaxhI4IhzSMdHXLU8dr0Dsd3vwmmK4PEWCWeUmcwDGsaDG
	jQwfAr6g8Eq0wAvll06MoiEmx+3yaOj3yimWapX5OOvYNToEeBeBf3p60+3cijF+qumKlMbwibPJP
	q89+qT49JgYP/ZNX3gFDXRqTrsAI1tLunadQwqvgPqkzVKnONRvf8eZUqLtz0YaFlrZmICkQUMT4S
	/4n/J7Xg==;
Received: from ip6-localhost ([::1]:39884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vAujv-008NIg-3d; Mon, 20 Oct 2025 18:36:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60890) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAujq-008NIZ-RV
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 18:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=KZq8yJS6P7GhtA6jAmeV72n9c7cr6e4dDAA8rc3T/rY=; b=IY6D5MU4m8Kg24zE/5OSzUV3iG
 E4FbbNa/8oyMZfNuDL4zQYl12DEhxigEB97c2w3VYZqhA6WwJWt62pIbNzfZcpVjxdMrA1DcWQ0ka
 oJ3p6EQGqSvi0AGR9h3xeInT4hhk0SeUEQXjygZeFqXOWTewOH4yMr97JbGnGb8n9sYVgXMWKTKEv
 rk1wrLRecZNrdm9MDoVfh3/q9s1Vf9RDqfdEFeWrYnn4TES8hlJSG3mPbPC/UifJWO0zGYzdECOo0
 Tk2T0po2C2EB5/cBQRj+BWAlW0+n+9qTaCi/fS6cUOg1lgaGunXFyLG+qVqn4kvppYe+1PVF/HzDZ
 /qnUTdU/WMmtBWdzLIFXCgU3FmSdhv2jmph0PKvJlRzdLfdZPUgkxMvtPehgAobUBkE96ZDZgdG7K
 TjDDDPtULc9f49GNl8SZb+B/ciwVGso9fIEF6cKFZhxvdAkJ7N8ubZHXKLcW0FlXYMcl5b67ZWBP0
 RVLVOc2Ilgb61yZhqqFNxFll;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAujp-00ACN6-1d; Mon, 20 Oct 2025 18:36:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 0/5] smb: smbdirect: introduce local send credits
Date: Mon, 20 Oct 2025 20:35:57 +0200
Message-ID: <cover.1760984605.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
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
Cc: metze@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

our client already has some logic to prevent overflows of
the local submission queue for ib_post_send(), if the peer
granted more credits than we asked for.

But it's not as easy as it could be.

I guess that won't happen against Windows, but our git
history indicates this could happen.

Now we have a loop of local credits based on our send_credit_target.
With that we always try to get a local credit first and then
get a remote credit. When we got both we are able to
mark the request as pending in order to keep the
existing logic based on the pending count working.
Removing or changing that is a task for another day,
when all code if in common between client and server.

For the server this is a real bug fix, as such a logic was missing
before.

For the client it's not strictly required for 6.18, but
I think we should keep things consistent, as it will reduce
churn on my 6.19 patchset, which already has about 100 patches
and brings things into common code. And more is comming there...

Stefan Metzmacher (5):
  smb: smbdirect: introduce smbdirect_socket.send_io.lcredits.*
  smb: server: smb_direct_disconnect_rdma_connection() already wakes all
    waiters on error
  smb: server: simplify sibling_list handling in
    smb_direct_flush_send_list/send_done
  smb: server: make use of smbdirect_socket.send_io.lcredits.*
  smb: client: make use of smbdirect_socket.send_io.lcredits.*

 fs/smb/client/smbdirect.c                  |  67 ++++++++-----
 fs/smb/common/smbdirect/smbdirect_socket.h |  13 ++-
 fs/smb/server/transport_rdma.c             | 106 +++++++++++++++------
 3 files changed, 129 insertions(+), 57 deletions(-)

-- 
2.43.0


