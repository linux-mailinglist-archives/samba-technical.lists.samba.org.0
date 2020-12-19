Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 828192DECFC
	for <lists+samba-technical@lfdr.de>; Sat, 19 Dec 2020 04:39:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=K4Tbd9kvJLV1z7Skt1ttNzDDgCMe96VbARE8hykF8Po=; b=v0DNl3PZBehCU/oKh9+ViilxUT
	aH5sSg+X2n/ZAw73GTTxFwAWU0bBl4VWpfu+WxZiZeWq8zFq9c5x3oOR2Qix+B9bFCItBLdOT+hJR
	6v9IkEWqpQK7tREKSQIJYGD4oIqe7RH2PeXHsSZok5g87sw0fgHZ0M6bOkU9v3B4YS35/Z6GFsiFv
	MBvaMgVeiM17iqXlSTmoFavc5pOVCgio3HlvBVaSqJloG2Z6pqRuSu7atJvX4SdmIXHtbYg4avdSX
	Wdo4FLoA1sG5R/2xv65BMz3y2lv9iwKmqADYjS+zZFXGCm2gnY/RaixIsoPWONyfcESQxho81sAgo
	/rZashXA==;
Received: from ip6-localhost ([::1]:44146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kqT4r-00210l-18; Sat, 19 Dec 2020 03:38:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60580) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kqT4g-00210d-6V
 for samba-technical@lists.samba.org; Sat, 19 Dec 2020 03:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=K4Tbd9kvJLV1z7Skt1ttNzDDgCMe96VbARE8hykF8Po=; b=cy6vzmEVNjkfkeSxfbC662LMLv
 ydkLPRlvIT8MniwNQ4glxU5uiBN4tUS/kBhASI7a5vd0Mxube28PWcBdSJJ3BG4TIETWDcOvc/1Vh
 GqWN9higH5apdgBieqmlG+cbITKIM7fPlFkTd5nULS0fEsXJoGd7Wjlsli/50oRLK8dop8W/rF+qe
 MR55Y4HSgIAZ/wweZrqakCyG55tbSeiSURiyuLRrYOB0H7iCnLXg+aYl5xPNDGbAw69tkwHhiqxGQ
 9tnz6cYnaG216LN1VswkhboW3AIgPKyu2tB7leKgry7skvNbGV7jw2GIvZr7bGFCNwokiFjnH/Ra8
 EG3hpFFxEW5xdegnWC4Yo6QBzoZ5ySzdixqQkAKGShh9thme/tIPKcNzsZ+yUwsMwzXUVtqdKwJz/
 UZLJq7OamB1jPtTyqv1eLrVKZB/zGXqD/aWBeaDjzDKARkFiQVD+WYix4OWkydNC+Sc9izDnKs0z+
 Iq72UUU2rNIQyBn5tVHqO5FE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kqT4I-00009M-Lj; Sat, 19 Dec 2020 03:38:07 +0000
Date: Fri, 18 Dec 2020 19:38:03 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: vfs_acl_[xattr|tdb] and timestamp in ACL hash
Message-ID: <20201219033803.GE480071@jeremy-acer>
References: <86aa9f39-3535-01ca-f96d-f22acc36778b@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <86aa9f39-3535-01ca-f96d-f22acc36778b@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 18, 2020 at 04:31:33PM +0100, Ralph Boehme wrote:
>Hi Jeremy,
>hi Andrew,
>
>here comes another question related to vfs_acl_xattr.
>
>This is triggered by a customer request who is storing xattrs in some 
>kind of database (external to Samba) and they're trying to leverage 
>xattr deduping.
>
>They have a xattr dedupe feature in their backend such then when to 
>files have the same xattr it's only stored once in the backend.
>
>But when using this with vfs_acl_xattr they stumbled upon the fact 
>that we skew the ACL blob bash with timestamp, so even if two files 
>have an identical ACL, they will have a different timestamp so the 
>overall xattr blob will be different.
>
>        typedef [public] struct {
>                security_descriptor *sd;
>                uint16 hash_type;
>                uint8 hash[64]; /* 64 bytes hash. */
>                utf8string description; /* description of what created
>                                         * this hash (to allow
>                                         * forensics later, if we have
>                                         * a bug in one codepath */
>                NTTIME time;
>                uint8 sys_acl_hash[64]; /* 64 bytes hash. */
>        } security_descriptor_hash_v4;
>
>They can hack around this by applying a vendor specific patch that 
>always sets time to 0.
>
>Afaict the hash should not include the time of the creation of the 
>ACL, the hash should just be over the ACL.
>
>So the question is if we want to change our behaviour?
>
>I wouldn't wanna go up to security_descriptor_hash_v5 that drops the 
>time field, maybe just stay at v4, but set time to 0?
>
>Thoughts?

Yes, along with what Andrew said - as we don't use it just setting
to zero when setting the ACL would work. That would still be
compatible with existing code reading existing ACLs.

