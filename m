Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D624EB2B254
	for <lists+samba-technical@lfdr.de>; Mon, 18 Aug 2025 22:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/6qw7UXvIeheSrNYve+OT2MBciJ0q6Owf7qjCi5txnA=; b=EqM+pptSE2G1CB/R9lnVc7AfRu
	nk3Yk+LPzyOSuymQAI9ukDfcRWW+9/A7Zj7sKxOPvERFyvnWlFTK/Gf+PZBsX3WS7VV+c+CLqPyXQ
	j/5tjmeXa3bEP3wSTP90f0RDAUMDzLZPJFe0mSYCCh4ecLHj+9yPM0ny/MfaEWn+ZNNOoKycdJkUg
	eF+Ut4IzPmjEZA3TKLAypmA5ig2aA0YX4hNZ6FZbIYQ9MnC7LUxZWeu1tT3M2IMRnlhGKK24n2HHL
	TIMBJkDSOlRjdvlDpNM5YCnwYrig3mn2nVfVN+67Xhd99wSi4O/Mug4zAfLn+gbKgX0fcPYtZllvW
	4XCrzHkw==;
Received: from ip6-localhost ([::1]:60916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uo6Q8-00FGj2-Vi; Mon, 18 Aug 2025 20:25:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36676) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uo6Q3-00FGiv-5m
 for samba-technical@lists.samba.org; Mon, 18 Aug 2025 20:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=/6qw7UXvIeheSrNYve+OT2MBciJ0q6Owf7qjCi5txnA=; b=MIfyifTChNv3oQ017D6HlNu0Xa
 diTvBZzZHEx7IqrGBiCg6YL9ho05pFbfQMtn1nXgrqgLaN20Tkkgh/bQ1dNvFbfSIV1WxjWdSyMbi
 Cz47XjKA4PkKHxZ6zAT27RsRyTCg1ohoAh56X2BssyqfdvspUPfjSdIPjPTfoTmQwPj2wOhbF86Kl
 AWnlKtY9VcP/meVdWM4UdfpK9F05/UcyJheaW9GoM8ciHeHvpaBje983qt4MEZznzcm8c0IpjbCAk
 3OClp41lwlYe2JsoG8BgfpO3rJTLlPpE9fl9mTG+4Ji2sHzVNeHAc3TcIqAGL3zN1q9oJpzPyPSwF
 DCcj4c5RF3ZFTQqlTMzheGLyxqNAtOfk1w5iErdyCFOzJlIrjHqiGWzJm6ijItMypxVbtvFYIh8ic
 FjNh6oV5B3yZAOuGoK/9UxJj9Lbnd4eX//fx/KMklKS8mnyMGnbecTSb4lsiFIxm9DN6QzGFjH1cH
 1HskZnqBw5qW7IV/F3y/x6hZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uo6Q2-003WkK-0a; Mon, 18 Aug 2025 20:25:26 +0000
Message-ID: <c2d9d516-d203-44ff-946d-b4833019bfd5@samba.org>
Date: Mon, 18 Aug 2025 22:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Subject: Current state of smbdirect patches
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm at the point where server/transport_rdma.c only has there
local structures:

struct smb_direct_device {
         struct ib_device        *ib_dev;
         struct list_head        list;
};

static struct smb_direct_listener {
         struct rdma_cm_id       *cm_id;
} smb_direct_listener;

struct smb_direct_transport {
         struct ksmbd_transport  transport;

         struct smbdirect_socket socket;
};

All others are moved to smbdirect_socket.h.

For the client I'm almost there I just need to
finish the move of struct smbd_mr.

Should I post all patches including the ones already in for-next and ksmbd-for-next-next?
But resorted, first all fs/smb/common/smbdirect/ patches, then
all fs/smb/client patches and finally all fs/smb/server patches.

Maybe we want a smbdirect-for-next branch, which could be a shared ground for
for-next (client) and ksmbd-for-next[-next] (server)?

So how should I post what I have?

metze


