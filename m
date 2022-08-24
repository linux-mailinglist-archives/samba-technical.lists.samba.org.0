Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A387059F0CF
	for <lists+samba-technical@lfdr.de>; Wed, 24 Aug 2022 03:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=xw26Kg6qbXvzMwbec31mlWyOHBj58C4v3dRAT2ikEjw=; b=G1OYrKVEGMBcWgcBl1koc/Hsoh
	+iTEJzANs6mFpcAck3+wRXdnRdNeN/yoENcfcPBZDhSz/0XnLVvorQ1q1BbZIjJTBKr5Ddg2tIxO2
	ZQsOxeBT0DobVRQVp81EwA9woMTY/tTK0N5iChVlo7H0xeYrEOtlGprBTtSCOzZwptveU7z/lMKTF
	sqeyjOda8vyP7EUA3idwihAr3xykhrSJuuLQBNFNiige0ZMnT+oAb75Dw89GZyuuRieA4z/4ZgQT6
	pZkq9Ob11rrHl3x+h7PprmzaoaaVoqTQAvSl5x9JPA7w1yrJMgSeJXRiWIDNbxWSOiL5Mhs+21v3A
	VlsG6qGw==;
Received: from ip6-localhost ([::1]:28698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQf6p-0028CJ-3O; Wed, 24 Aug 2022 01:23:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17670) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oQf6i-0028Bl-0x; Wed, 24 Aug 2022 01:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=xw26Kg6qbXvzMwbec31mlWyOHBj58C4v3dRAT2ikEjw=; b=aEOM1xJs7iVKxbZxbsWJHLOrWm
 v5KGuwBt+bXm4VDq+5umehWFRcX1L9gy80vQq1gG4gr8d700Rp0uhMgysgZ0dDPJdKS+B2A3zB5UG
 IcOJ/j6mT2KmLzUZ0MV6LwNjced2CiWdF0AOY2zB9Ry0NMYn7bKzlkIr1IqmWlLbGd3s7mmoiyFqC
 vI8o2xtWf/fQ5wdft5jkB2eAV/8XLeZ65F0OeEH31kGQ3T4AGFiXf9yah/uXCtfSZuvUYIKgTYMXO
 r4d4iUPppL/mCkRfuvJHmekyC5B7zN8gcsFPL2hXhFrJyhzuKyOZnCjO5qIf5/0zDuWAq4bfgkN3d
 wskteNkkZtAuM1BuVx9J7AvOdfGLxFPz19/9SPsfm4S9+lIUgQhq4+7N1H1G1hYRXx31qXfBjdQk1
 xZOseDWgTAHc4ECQ/LPvFtX446Bqk8n9bD7l7LC6eqvpN3N7gixqDSmfx/5VaRTf9JenrsUe1TpAf
 7ioLApvXpjStKuYF4+QosNO5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oQf6g-001U3M-SA; Wed, 24 Aug 2022 01:22:59 +0000
Message-ID: <cfa3f458-f9ce-6671-5cc0-ab3b53103c9c@samba.org>
Date: Wed, 24 Aug 2022 13:22:55 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>
Content-Language: en-GB
Subject: samba-tool error messages: what needs fixing most?
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <dbagnall@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi,

If you have used samba-tool, you will be aware that it often reports 
simple problems with long messages talking about exceptions and line 
numbers and file names and all-caps error codes. Sometimes, well, 
usually, these messages turn out to mean something like "bad username or 
password" or "samba.example.com is not a real address".

Every so often (but less often than you'd expect) somebody has the 
genius idea that samba-tool could just describe the underlying issue, 
and refrain from the detailed account of subsequent woe. Even Samba 
Developers have that idea, sometimes, but then they look and think "no, 
too hard" and get back to debugging clustered inter-forest symlink 
tevent races with S4U2SELF SPOOLSS ntlmssp_states (or winbind for the 
extremophiles). But NOW I, fully sober, have decided to *actually* try. 
Which leads to the question in the subject: which messages need fixing?

So *please* reply to this message with a samba-tool line that says 
something really stupid, and suggest a better message.

It won't be possible to fix every example, and I will try to be 
cautious. It is worse to hide real problems than to expose everyone to 
horrible noise.


Q: But won't this break the Application Search-engine Interface (ASI)? 
How will we be able to find old posts on stac^H^H^H^H 
https://lists.samba.org that quote the old nonsensical message?

A: Yes. ASI stability is never guaranteed. But you can always get the 
old traceback by appending -d3 to your samba-tool line.

Q: But I like things the way they are. It makes me look like that guy in 
the Matrix.

A: You don't want to look like that guy. Also, try -d10.

Q: When?

A: 4.18, and don't expect too much.


cheers,
Douglas

